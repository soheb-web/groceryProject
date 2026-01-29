import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
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
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                          ),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sarah johnson",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                Text(
                                  "Sarah.j@email.com",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(178, 255, 255, 255),
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
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF16A34A),
                              ),
                            ),
                            Text(
                              "Order",
                              style: GoogleFonts.montserrat(
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
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF16A34A),
                              ),
                            ),
                            Text(
                              "Spent",
                              style: GoogleFonts.montserrat(
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
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF16A34A),
                              ),
                            ),
                            Text(
                              "Point",
                              style: GoogleFonts.montserrat(
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
                      border: Border.all(color: Color.fromARGB(40, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        _item(Icons.person_outline, "Edit Profile"),
                        _divider(),
                        _item(Icons.location_on_outlined, "Addresses"),
                        _divider(),
                        _item(Icons.credit_card, "Payment Methods"),
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
                      border: Border.all(color: Color.fromARGB(40, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      children: [
                        _item(Icons.notifications_none, "Notification"),
                        _divider(),
                        _item(Icons.settings, "Setting"),
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
                      border: Border.all(color: Color.fromARGB(40, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: _item(Icons.help_outline, "Help & Support"),
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
                    onPressed: () {},
                    child: Text(
                      "Log Out",
                      style: GoogleFonts.montserrat(
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
      ),
    );
  }

  Widget _item(IconData icon, String title) {
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
      onTap: () {},
    );
  }

  // 🔹 Divider
  Widget _divider() {
    return Divider(height: 1.h);
  }
}
