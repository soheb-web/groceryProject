import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:realstate/Controller/myRequestBookingSerivceController.dart';
import 'package:realstate/Model/verfiyServiceAgenetBodyModel.dart';
import 'package:realstate/core/network/api.state.dart';
import 'package:realstate/core/utils/preety.dio.dart';
import 'package:url_launcher/url_launcher.dart';

class MyRequestPage extends ConsumerWidget {
  const MyRequestPage({super.key});

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'in_progress':
        return Colors.blue;
      case 'complete':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const primaryColor = Color(0xFFFF5722);
    final myRequestProvider = ref.watch(myRequestBookingServiceContorller);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "My Service Requests",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        backgroundColor: primaryColor,
        color: Colors.white,
        onRefresh: () async {
          ref.invalidate(myRequestBookingServiceContorller);
        },
        child: myRequestProvider.when(
          data: (data) {
            final list = data.data?.list ?? [];
            if (list.isEmpty) {
              return _buildEmptyState();
            }

            return ListView.builder(
              padding: EdgeInsets.all(15.w),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                final status = item.status?.toLowerCase() ?? "pending";

                return Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // 1. Header: Image & Status
                      _buildCardHeader(item, status, primaryColor),

                      const Divider(height: 1),

                      // 2. Details: Address & Message
                      _buildDetailsSection(item, status),

                      // 3. Dynamic Verification & Technician Section
                      if (status != 'rejected')
                        _buildVerificationCard(
                          item,
                          context,
                          primaryColor,
                          ref,
                          status,
                        ),

                      // 4. Footer: Date
                      _buildFooter(item, primaryColor),
                    ],
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            log(stackTrace.toString());
            return Center(child: Text("Error: $error"));
          },
          loading: () => const Center(
            child: CircularProgressIndicator(color: primaryColor),
          ),
        ),
      ),
    );
  }

  // --- Sub Widgets for better readability ---

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_late_outlined,
            size: 80.sp,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 16.h),
          Text(
            "No Requests Found",
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            "You haven't booked any services yet.",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardHeader(dynamic item, String status, Color primaryColor) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),

            child: Image.network(
              item.serviceType?.image ?? "",
              width: 40.w,
              height: 40.w,
              errorBuilder: (c, e, s) =>
                  Icon(Icons.build, color: primaryColor, size: 30.sp),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.serviceType?.name ?? "Service",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  "ID: #${item.id?.substring(item.id!.length - 8)}",
                  style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: getStatusColor(status).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              status.toUpperCase().replaceAll('_', ' '),
              style: TextStyle(
                color: getStatusColor(status),
                fontWeight: FontWeight.bold,
                fontSize: 9.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(dynamic item, String status) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          _infoRow(
            Icons.location_on_outlined,
            "Address",
            item.address ?? "No Address Provided",
          ),
          if (item.message?.isNotEmpty ?? false) ...[
            SizedBox(height: 8.h),
            _infoRow(Icons.message_outlined, "Message", item.message!),
          ],
        ],
      ),
    );
  }

  Widget _buildVerificationCard(
    dynamic item,
    BuildContext context,
    Color primaryColor,
    WidgetRef ref,
    String status,
  ) {
    final bool isProgress = status == 'in_progress';
    final bool isCompleted = status == 'complete';
    final bool isWorking = status == 'working';
    final bool isPending = status == 'pending';

    // Null safety check: Pending status mein serviceBoy null ho sakta hai
    final String serviceCategory = item.serviceType.name ?? "Technician";
    final String technicianName =
        item.serviceBoy?.name ?? "Assigning $serviceCategory...";
    final String technicianImage = item.serviceBoy?.image ?? "";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.green.shade50
            : (isPending
                  ? Colors.orange.shade50
                  : (isProgress
                        ? Colors.blue.shade50
                        : Colors.blueGrey.shade50)),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: isCompleted
              ? Colors.green.shade200
              : (isPending
                    ? Colors.orange.shade200
                    : (isProgress
                          ? Colors.blue.shade200
                          : Colors.blueGrey.shade200)),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (isProgress)
                    showDialog(
                      context: context,
                      barrierColor: Colors.black,
                      builder: (_) {
                        return Stack(
                          children: [
                            Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.zero,
                              child: GestureDetector(
                                onTap: () =>
                                    Navigator.pop(context), // tap to close
                                child: Hero(
                                  tag: technicianImage,
                                  child: PhotoView(
                                    imageProvider: NetworkImage(
                                      technicianImage,
                                    ),
                                    backgroundDecoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    minScale: PhotoViewComputedScale.contained,
                                    maxScale:
                                        PhotoViewComputedScale.covered * 2,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.w,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                },
                child: CircleAvatar(
                  radius: 22.r,
                  backgroundColor: Colors.white,
                  backgroundImage: technicianImage.isNotEmpty
                      ? NetworkImage(technicianImage)
                      : null,
                  child: technicianImage.isEmpty
                      ? Icon(
                          Icons.person_search,
                          color: Colors.orange,
                        ) // Pending icon
                      : null,
                ),
              ),

              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      technicianName,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      isPending
                          ? "Admin is finding the best $serviceCategory for you"
                          : (isCompleted
                                ? "Task Finished"
                                : (isProgress
                                      ? "Waiting for your verification"
                                      : "Agent is Working")),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              if (isProgress)
                IconButton(
                  onPressed: () async {
                    final String phoneNumber = item.serviceBoy.phone ?? "";
                    final Uri callUri = Uri.parse('tel:$phoneNumber');
                    // 3. Launch karein
                    if (await canLaunchUrl(callUri)) {
                      await launchUrl(callUri);
                    } else {
                      // Agar dialer nahi khul raha toh error dikhayein
                      log("Could not launch $callUri");
                    }
                  }, // Add call logic
                  icon: const Icon(Icons.call, color: Colors.green),
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                ),
            ],
          ),
          SizedBox(height: 12.h),

          // --- LOGIC: STATUS WISE ACTION ---
          if (isProgress)
            // CASE 1: Status is Pending -> Show Verify Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () =>
                    _showVerifyDialog(context, technicianName, item.id, ref),
                icon: const Icon(Icons.verified_user, size: 18),
                label: const Text("VERIFY & START SERVICE"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            )
          else if (isWorking)
            // CASE 2: Status is In Progress -> Show Working Label
            _statusIndicator(
              Icons.engineering,
              "AGENT VERIFIED & WORKING",
              Colors.blueGrey.shade800,
              Colors.blueGrey.shade100,
            )
          else if (isCompleted)
            // CASE 3: Status is Completed -> Show Success Label
            _statusIndicator(
              Icons.check_circle,
              "SERVICE COMPLETED SUCCESSFULLY",
              Colors.green.shade900,
              Colors.green.shade200,
            )
          else if (isPending)
            _statusIndicator(
              Icons.sync,
              "SEARCHING FOR ${serviceCategory.toUpperCase()}...",
              Colors.orange.shade900,
              Colors.orange.shade100,
            ),
        ],
      ),
    );
  }

  Widget _buildFooter(dynamic item, Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.access_time, size: 12.sp, color: Colors.grey),
          SizedBox(width: 4.w),
          Text(
            item.createdAt != null
                ? DateFormat(
                    'dd MMM yyyy, hh:mm a',
                  ).format(DateTime.fromMillisecondsSinceEpoch(item.createdAt!))
                : "",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 10.sp),
          ),
        ],
      ),
    );
  }

  Widget _statusIndicator(
    IconData icon,
    String text,
    Color textColor,
    Color bgColor,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor, size: 18.sp),
          SizedBox(width: 8.w),
          Text(
            text,
            style: GoogleFonts.inter(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }

  void _showVerifyDialog(
    BuildContext context,
    String name,
    String id,
    WidgetRef ref,
  ) {
    bool isLoading = false;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Verify Arrival?"),
            content: isLoading
                ? const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [CircularProgressIndicator()],
                  )
                : Text(
                    "Has $name arrived at your location to start the service?",
                  ),
            actions: isLoading
                ? []
                : [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("No"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() => isLoading = true);
                        try {
                          final service = APIStateNetwork(createDio());
                          final response = await service.verifyServiceAgent(
                            VerifyServiceAgentBodyModel(id: id),
                          );
                          if (response.code == 0 || response.error == false) {
                            if (context.mounted) Navigator.pop(context);
                            Fluttertoast.showToast(
                              msg: "Agent Verified! Service Started.",
                            );
                            ref.invalidate(myRequestBookingServiceContorller);
                          } else {
                            Fluttertoast.showToast(
                              msg: response.message ?? "Failed",
                            );
                          }
                        } catch (e) {
                          Fluttertoast.showToast(msg: "Connection Error");
                        } finally {
                          if (context.mounted)
                            setState(() => isLoading = false);
                        }
                      },
                      child: const Text("Yes, Start"),
                    ),
                  ],
          );
        },
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value, {Color? color}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14.sp, color: color ?? Colors.grey),
        SizedBox(width: 8.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.inter(
                color: color ?? Colors.black87,
                fontSize: 12.5.sp,
              ),
              children: [
                TextSpan(
                  text: "$title: ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
