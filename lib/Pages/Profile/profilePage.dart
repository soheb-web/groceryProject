import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Controller/fetchProfileController.dart';
import 'package:grocery/Controller/loginController.dart';
import 'package:grocery/Pages/Address/PickAddressPage.dart';
import 'package:grocery/Pages/Login/loginScreen.dart';
import 'package:grocery/Pages/Profile/helpOrSupportPage.dart';
import 'package:hive/hive.dart';

import 'editProfilePage.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePagestate();
}

class _ProfilePagestate extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("userdata");
    final proflileProvider = ref.watch(fechProfileController);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: RefreshIndicator(
        backgroundColor: Colors.green,
        color: Colors.white,
        onRefresh: () async {
          ref.invalidate(fechProfileController);
        },
        child: proflileProvider.when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100.h,
                        decoration: BoxDecoration(color: Color(0xFF169545)),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 30.w,
                            top: 20.h,
                            bottom: 20.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60.h,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png",
                                        width: 60.w,
                                        height: 60.h,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 1,
                                                    ),
                                              );
                                            },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Icon(
                                                Icons.person,
                                                size: 30.sp,
                                                color: Colors.grey,
                                              );
                                            },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Sarah johnson",
                                        // box.get("name").toString(),
                                        "${data.user!.firstName ?? "N/A"} ${data.user!.lastName ?? "N/A"}",
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                      Text(
                                        // "Sarah.j@email.com",
                                        // box.get("email").toString(),
                                        data.user!.email ?? "N/A",
                                        style: GoogleFonts.inter(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                            178,
                                            255,
                                            255,
                                            255,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -45,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.only(left: 24.w, right: 24.w),
                          width: double.infinity,
                          height: 66.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                spreadRadius: 0,
                                blurRadius: 4,
                                color: Color.fromARGB(63, 0, 0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "24",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF16A34A),
                                    ),
                                  ),
                                  Text(
                                    "Order",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(178, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: Color(0xFFBFBFBF),
                                endIndent: 10,
                                indent: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$420",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF16A34A),
                                    ),
                                  ),
                                  Text(
                                    "Spent",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(178, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: Color(0xFFBFBFBF),
                                endIndent: 10,
                                indent: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "150",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF16A34A),
                                    ),
                                  ),
                                  Text(
                                    "Point",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(178, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account",
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(40, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: [
                              _item(Icons.person_outline, "Edit Profile", () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfilePage(),
                                  ),
                                );
                              }),
                              _divider(),
                              _item(
                                Icons.location_on_outlined,
                                "Addresses",
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PickAddressPage(),
                                    ),
                                  );
                                },
                              ),
                              _divider(),
                              _item(
                                Icons.credit_card,
                                "Payment Methods",
                                () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Preferences",
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(40, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: [
                              _item(
                                Icons.notifications_none,
                                "Notification",
                                () {},
                              ),
                              _divider(),
                              _item(Icons.settings, "Setting", () {}),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Support",
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(40, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: _item(
                            Icons.help_outline,
                            "Help & Support",
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HelpOrSupportPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFFFFFFFF),
                            minimumSize: Size(double.infinity, 50.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              side: BorderSide(color: Color(0xFFD02600)),
                            ),
                          ),
                          onPressed: () {
                            showLogoutDialog(context);
                          },
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFD02600),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Center(
                          child: Text(
                            "App Version: 4.99.1",
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text(error.toString()));
          },
          loading: () => Center(
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(IconData icon, String title, VoidCallback callBack) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000),
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        size: 25.sp,
        color: Color(0xFF181725),
      ),
      onTap: callBack,
    );
  }

  // 🔹 Divider
  Widget _divider() {
    return Divider(height: 1.h);
  }

  void showLogoutDialog(BuildContext context) {
    var box = Hive.box("userdata");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Styled Icon
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF169545).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: Color(0xFF169545),
                    size: 40,
                  ),
                ),
                const SizedBox(height: 24),

                // Text Content
                const Text(
                  "Oh no! Leaving?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2D2D2D),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Are you sure you want to log out? We'll miss having you around.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await box.clear();
                          ref.invalidate(loginProvider);

                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: "LogOut Successfull",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: const Color(
                              0xFF169545,
                            ), // Aapka Green Color
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF169545),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
