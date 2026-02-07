import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Controller/fetchProfileController.dart';
import 'package:grocery/Controller/updateProfileController.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePagestate();
}

class _EditProfilePagestate extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final Color primaryGreen = const Color(0xFF19B954);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> _loadProfileData() async {
    final data = ref.read(fechProfileController);
    data.whenData((value) {
      firstNameController.text = value.user!.firstName ?? "";
      lastNameController.text = value.user!.lastName ?? "";
      phoneController.text = value.user!.phone ?? "";
      streetController.text = value.user!.address!.street ?? "";
      stateController.text = value.user!.address!.state ?? "";
      cityController.text = value.user!.address!.city ?? "";
      countryController.text = value.user!.address!.country ?? "";
      zipController.text = value.user!.address!.zipCode ?? "";
      emailController.text = value.user!.email ?? "";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadProfileData();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    zipController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(updateProfileProvider);
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: _customField(
                            contorller: firstNameController,
                            label: "First Name",
                            hint: "First Name",
                            prefixIcon: Icons.location_on_outlined,
                            keyboardType: TextInputType.text,
                            horizontalPadding: 0,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "This field is required";
                              }
                              if (value.length < 2) {
                                return "Minimum 2 characters required";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: _customField(
                            contorller: lastNameController,
                            label: "Last Name",
                            hint: "Last NAme",
                            prefixIcon: Icons.pin_drop_outlined,
                            keyboardType: TextInputType.text,
                            horizontalPadding: 0,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "This field is required";
                              }
                              if (value.length < 2) {
                                return "Minimum 2 characters required";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 28.w,
                      right: 28.w,
                      top: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextFormField(
                          onTap: () {
                            Fluttertoast.showToast(msg: "Can not change email");
                          },
                          readOnly: true,
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              top: 16.h,
                              bottom: 16.h,
                              right: 14.w,
                              left: 0,
                            ),
                            hintText: "Email",
                            hintStyle: GoogleFonts.inter(
                              color: Colors.grey.shade500,
                              fontSize: 12.sp,
                            ),

                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey.shade600,
                              size: 18.sp,
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
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _customField(
                    contorller: phoneController,
                    label: "Phone Number",
                    hint: "Phone Number",
                    prefixIcon: Icons.call_outlined,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number required";
                      }
                      if (value.length != 10) {
                        return "Enter valid 10-digit number";
                      }
                      return null;
                    },
                  ),
                  _customField(
                    contorller: streetController,
                    label: "Delivery Address",
                    hint: "Delivery Address",
                    prefixIcon: Icons.location_on_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Delivery required";
                      }

                      return null;
                    },
                  ),
                  _customField(
                    contorller: cityController,
                    label: "City",
                    hint: "City",
                    prefixIcon: Icons.location_city_outlined,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "City required";
                      }

                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: _customField(
                            contorller: stateController,
                            label: "State",
                            hint: "State",
                            prefixIcon: Icons.location_on_outlined,
                            keyboardType: TextInputType.text,
                            horizontalPadding: 0,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "State required";
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: _customField(
                            contorller: countryController,
                            label: "Country",
                            hint: "Country",
                            prefixIcon: Icons.pin_drop_outlined,
                            keyboardType: TextInputType.text,
                            horizontalPadding: 0,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Country required";
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  _customField(
                    contorller: zipController,
                    label: "Zip Code",
                    hint: "Zip Code",
                    prefixIcon: Icons.location_city_outlined,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Zip code required";
                      }
                      if (value.length < 6) {
                        return "Invalid zip code";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.h),
                  // --- Save Button ---
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ref
                              .read(updateProfileProvider.notifier)
                              .updateProfile(
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                phone: phoneController.text.trim(),
                                street: streetController.text.trim(),
                                city: cityController.text.trim(),
                                stateName: stateController.text.trim(),
                                country: countryController.text.trim(),
                                zipcode: zipController.text.trim(),
                                context: context,
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        minimumSize: Size(double.infinity, 55.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        elevation: 0,
                      ),
                      child: profileState.isLoading
                          ? Center(
                              child: CupertinoActivityIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
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
          ),
          if (profileState.isLoading)
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF19B954)),
                  strokeWidth: 3,
                ),
              ),
            ),
        ],
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
  required TextEditingController contorller,
  int? maxLength,
  String? Function(String?)? validator,
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
          maxLength: maxLength,
          controller: contorller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.only(
              top: 16.h,
              bottom: 16.h,
              right: 14.w,
              left: 0,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: Colors.grey.shade500,
              fontSize: 12.sp,
            ),

            prefixIcon: Icon(
              prefixIcon,
              color: Colors.grey.shade600,
              size: 18.sp,
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
