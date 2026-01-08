import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realstate/Controller/myRequestBookingSerivceController.dart';
import 'package:realstate/Model/homeBookingServiceBodyModel.dart';
import 'package:realstate/Model/homeGetServiceCateogryModel.dart';
import 'package:realstate/core/network/api.state.dart';
import 'package:realstate/core/utils/preety.dio.dart';

class HomeServiceDetailsPage extends ConsumerStatefulWidget {
  final ListElement service;
  const HomeServiceDetailsPage({super.key, required this.service});

  @override
  ConsumerState<HomeServiceDetailsPage> createState() =>
      _HomeServiceDetailsPageState();
}

class _HomeServiceDetailsPageState
    extends ConsumerState<HomeServiceDetailsPage> {
  //static const primaryColor = Color(0xFFFF5722);
  static const primaryColor = Color(0xFFFF5722);
  static const darkBlue = Color(0xff0E1A35);

  void showBookingDialog(BuildContext context) {
    final addressController = TextEditingController();
    final messageController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool isBooking = false;
    const primaryColor = Color(0xFFFF5722);
    String? addressError;
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Bahar click karne par close hoga
      barrierLabel: "Booking",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: StatefulBuilder(
            builder: (context, setDialogState) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // --- CLOSE ICON AND HANDLE ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 40), // Balance ke liye
                              Container(
                                width: 40,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    Navigator.pop(context), // CLOSE ACTION
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Book Your Service",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(height: 20.h),

                          // Address Field
                          TextFormField(
                            controller: addressController,
                            maxLines: 2,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                              labelText: "Service Address",
                              prefixIcon: const Icon(
                                Icons.location_on,
                                color: primaryColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorText: addressError,
                            ),

                            onChanged: (val) {
                              // Type karte hi error hata dene ke liye
                              if (addressError != null) {
                                setDialogState(() => addressError = null);
                              }
                            },
                          ),
                          const SizedBox(height: 15),

                          // Message Field
                          TextFormField(
                            controller: messageController,
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Any Message(Optional)",
                              alignLabelWithHint: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(bottom: 40),
                                child: Icon(Icons.message, color: primaryColor),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),

                          // --- ACTION BUTTONS (CANCEL & CONFIRM) ---
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  onPressed: () =>
                                      Navigator.pop(context), // CANCEL ACTION
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: isBooking
                                      ? null
                                      : () async {
                                          if (addressController.text
                                              .trim()
                                              .isEmpty) {
                                            setDialogState(() {
                                              addressError =
                                                  "Please enter address";
                                            });
                                            return;
                                          }

                                          setDialogState(
                                            () => isBooking = true,
                                          );
                                          final body =
                                              HomeBookingServiceBodyModel(
                                                address: addressController.text,
                                                serviceType: widget.service.id
                                                    .toString(),
                                                message: messageController.text,
                                              );
                                          try {
                                            final service = APIStateNetwork(
                                              createDio(),
                                            );
                                            final response = await service
                                                .bookHomeService(body);
                                            if (response.code == 0 ||
                                                response.error == false) {
                                              ref.invalidate(
                                                myRequestBookingServiceContorller,
                                              );
                                              Navigator.pop(context);
                                              Fluttertoast.showToast(
                                                msg:
                                                    response.message ??
                                                    "Sucess",
                                              );
                                            } else {
                                              Fluttertoast.showToast(
                                                msg:
                                                    response.message ?? "Error",
                                              );
                                            }
                                          } catch (e) {
                                            setDialogState(
                                              () => isBooking = false,
                                            );
                                          }
                                        },
                                  child: isBooking
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Text(
                                          "CONFIRM",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pure white for a cleaner look
      bottomNavigationBar: _buildBottomAction(),
      body: CustomScrollView(
        slivers: [
          /// ================= DYNAMIC HEADER =================
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            elevation: 0,
            stretch: true,
            backgroundColor: primaryColor,
            leading: _circleIconButton(
              Icons.arrow_back_ios_new,
              () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.service.image ??
                        "https://images.unsplash.com/photo-1581578731548-c64695cc6952",
                    fit: BoxFit.cover,
                  ),
                  // Bottom Shadow Gradient for Text Visibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// --- Title & Badge ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.service.name ?? "Service Detail",
                            style: GoogleFonts.inter(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              color: darkBlue,
                            ),
                          ),
                        ),
                        _statusBadge("Top Rated"),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    /// --- Rating & Stats ---
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 22,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "4.8",
                          style: GoogleFonts.inter(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: darkBlue,
                          ),
                        ),
                        Text(
                          " (1,240 Reviews)",
                          style: GoogleFonts.inter(
                            fontSize: 13.sp,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Starting from",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    /// --- Highlights Row ---
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _modernChip(Icons.timer_outlined, "60 min"),
                          _modernChip(Icons.verified_user_outlined, "Verified"),
                          _modernChip(Icons.security_outlined, "Warranty"),
                        ],
                      ),
                    ),

                    const Divider(height: 40, thickness: 1),

                    /// --- Price Section ---
                    _buildPremiumPriceCard(),

                    SizedBox(height: 30.h),

                    /// --- Service Features ---
                    _serviceDetailsSection(),

                    SizedBox(height: 30.h),

                    /// --- Trust Section ---
                    _whyChooseUs(),

                    SizedBox(height: 100.h), // Space for bottom button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widgets
  Widget _circleIconButton(IconData icon, VoidCallback onTap) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
            ],
          ),
          child: Icon(icon, size: 20, color: darkBlue),
        ),
      ),
    );
  }

  Widget _statusBadge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.green.shade700,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _modernChip(IconData icon, String label) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: primaryColor),
          SizedBox(width: 6.w),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumPriceCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [darkBlue, darkBlue.withOpacity(0.8)]),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: darkBlue.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Estimated Cost",
                style: TextStyle(color: Colors.white70, fontSize: 13.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                "₹499.00",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const Text(
              "SAVE 20%",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: Size(double.infinity, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        onPressed: () {
          showBookingDialog(context);
        },
        child: Text(
          "Book Now",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  String _serviceType() {
    return widget.service.name?.toLowerCase() ?? "";
  }

  Widget _serviceDetailsSection() {
    final type = _serviceType();

    if (type.contains("plumber")) {
      return _infoCard(
        title: "Plumber Services",
        description:
            "Professional plumbing services for homes and offices with quick and reliable solutions.",
        points: [
          "Tap & Pipe Leakage Repair",
          "Bathroom & Toilet Fittings",
          "Water Tank Cleaning",
          "Kitchen Sink Repair",
        ],
      );
    }

    if (type.contains("carpenter")) {
      return _infoCard(
        title: "Carpenter Services",
        description:
            "Expert carpenter services for furniture work and wooden fittings with premium finish.",
        points: [
          "Furniture Repair & Assembly",
          "Door & Window Fixing",
          "Modular Furniture Work",
          "Custom Wood Design",
        ],
      );
    }

    if (type.contains("electrician")) {
      return _infoCard(
        title: "Electrician Services",
        description:
            "Certified electricians for electrical installation, repair and maintenance.",
        points: [
          "Wiring & Switch Repair",
          "Fan & Light Installation",
          "Power Backup Setup",
          "Electrical Safety Check",
        ],
      );
    }

    if (type.contains("painter")) {
      return _infoCard(
        title: "Painting Services",
        description:
            "Interior and exterior painting services with premium quality finish.",
        points: [
          "Interior Wall Painting",
          "Exterior Painting",
          "Wall Texture Design",
          "Waterproof Coating",
        ],
      );
    }

    return const SizedBox();
  }

  Widget _infoCard({
    required String title,
    required String description,
    required List<String> points,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12.withOpacity(0.06), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12.h),
          ...points.map(
            (e) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 18, color: primaryColor),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(e, style: GoogleFonts.inter(fontSize: 13.sp)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _whyChooseUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Why choose us?",
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        _whyItem(Icons.verified, "Verified professionals"),
        _whyItem(Icons.timer, "On-time service"),
        _whyItem(Icons.support_agent, "24/7 customer support"),
      ],
    );
  }

  Widget _whyItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(icon, size: 18, color: primaryColor),
          SizedBox(width: 8.w),
          Text(text, style: GoogleFonts.inter(fontSize: 13.sp)),
        ],
      ),
    );
  }
}
