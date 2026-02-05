import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePagestate();
}

class _EditProfilePagestate extends State<EditProfilePage> {
  final Color primaryGreen = const Color(0xFF19B954);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Edit Profile",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0A0A0A),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.dark_mode_outlined, color: Color(0xFF0A0A0A)),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            _customField(
              label: "Full Name",
              hint: "Full Name",
              prefixIcon: Icons.person_2_outlined,
              keyboardType: TextInputType.text,
            ),
            _customField(
              label: "Email",
              hint: "Email",
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            _customField(
              label: "Phone Number",
              hint: "Phone Number",
              prefixIcon: Icons.call_outlined,
              keyboardType: TextInputType.number,
            ),
            _customField(
              label: "Delivery Address",
              hint: "Delivery Address",
              prefixIcon: Icons.location_on_outlined,
            ),
            _customField(
              label: "City",
              hint: "City",
              prefixIcon: Icons.location_city_outlined,
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: [
                  Expanded(
                    child: _customField(
                      label: "State",
                      hint: "State",
                      prefixIcon: Icons.location_on_outlined,
                      keyboardType: TextInputType.text,
                      horizontalPadding: 0,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _customField(
                      label: "Zip Code",
                      hint: "Zip code",
                      prefixIcon: Icons.pin_drop_outlined,
                      keyboardType: TextInputType.number,
                      horizontalPadding: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            // --- Save Button ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  minimumSize: Size(double.infinity, 55.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Save Changes",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

Widget _customField({
  required String hint,
  required IconData prefixIcon,
  required String label,
  TextInputType? keyboardType,
  double? horizontalPadding,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: horizontalPadding ?? 28.w,
      right: horizontalPadding ?? 28.w,
      top: 16.h,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 16.h,
              bottom: 16.h,
              right: 14.w,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: Colors.grey.shade500,
              fontSize: 15.sp,
            ),

            prefixIcon: Icon(
              prefixIcon,
              color: Colors.grey.shade600,
              size: 22.sp,
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: Color(0xFFD9D9D99),
                width: 0.53,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: Color(0xFFD9D9D99),
                width: 0.53,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(
                color: Color(0xFF16A34A),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ],
    ),
  );
}
