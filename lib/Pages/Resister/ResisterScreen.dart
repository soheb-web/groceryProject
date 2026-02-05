import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controller/registerController.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool _obscurePassword = true;
bool _obscureConfirmPassword = true;
bool _agreeToTerms = false;

class _SignUpScreenState extends State<SignUpScreen> {
  late final RegisterController _controller;

  // नया variable — errors button press होने पर ही दिखाने के लिए
  bool _showValidationErrors = false;

  @override
  void initState() {
    super.initState();
    _controller = RegisterController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
            child: Column(
              children: [
                // Shopping cart icon with border (same as login)
                Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFF5F5F5)),
                  ),
                  child: Image.asset("assets/png/loginLogo.png"),
                ),

                SizedBox(height: 24.h),

                // Create Account title
                Text(
                  "Create Account",
                  style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  "Sign up to get started",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFA3A3A3),
                  ),
                ),

                SizedBox(height: 40.h),

                // Full Name
                _buildLabel("Full Name"),
                _buildTextField(
                  controller: _controller.fullNameController,
                  hint: "Enter your full name",
                  prefixIcon: Icons.person_outline,
                  errorText: _showValidationErrors
                      ? _controller.validateFullName()
                      : null,
                ),
                SizedBox(height: 20.h),

                _buildLabel("Last Name"),
                _buildTextField(
                  controller: _controller.lastNameController,
                  hint: "Enter your Last name",
                  prefixIcon: Icons.person_outline,
                  errorText: _showValidationErrors
                      ? _controller.validateLastName()
                      : null,
                ),
                SizedBox(height: 20.h),

                // Email
                _buildLabel("Email"),
                _buildTextField(
                  controller: _controller.emailController,
                  hint: "Enter your email",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  errorText: _showValidationErrors
                      ? _controller.validateEmail()
                      : null,
                ),
                SizedBox(height: 20.h),

                // Phone Number
                _buildLabel("Phone Number"),
                _buildTextField(
                  controller: _controller.phoneController,
                  hint: "Enter your phone number",
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  errorText: _showValidationErrors
                      ? _controller.validatePhone()
                      : null,
                ),
                SizedBox(height: 20.h),

                // Password
                _buildLabel("Create Password"),
                _buildTextField(
                  controller: _controller.passwordController,
                  hint: "Create password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  errorText: _showValidationErrors
                      ? _controller.validatePassword()
                      : null,
                ),
                SizedBox(height: 20.h),

                // Confirm Password
                _buildLabel("Confirm Password"),
                _buildTextField(
                  controller: _controller.confirmPasswordController,
                  hint: "Confirm password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    ),
                  ),
                  errorText: _showValidationErrors
                      ? _controller.validateConfirmPassword()
                      : null,
                ),

                SizedBox(height: 16.h),

                // Terms & Conditions checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.h,
                      child: Checkbox(
                        value: _agreeToTerms,
                        activeColor: const Color(0xFF16A34A),
                        onChanged: (value) {
                          setState(() => _agreeToTerms = value ?? false);
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: const Color(0xFFA3A3A3),
                          ),
                          children: [
                            const TextSpan(text: "I agree to the "),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: GoogleFonts.inter(
                                color: const Color(0xFF16A34A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.inter(
                                color: const Color(0xFF16A34A),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: _controller.isLoading || !_agreeToTerms
                        ? null
                        : () async {
                            // Button press होने पर errors दिखाने का flag on करो
                            setState(() {
                              _showValidationErrors = true;
                            });

                            // अगर form valid नहीं है तो API call मत करो
                            if (!_controller.isFormValid) {
                              return;
                            }

                            final success = await _controller.register(context);

                            if (success && context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Account created! Please login",
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            } else if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    _controller.errorMessage ??
                                        "Something went wrong",
                                  ),
                                  backgroundColor: Colors.red.shade700,
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      elevation: 0,
                    ),
                    child: _controller.isLoading
                        ? const SizedBox.square(
                            dimension: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text("Create Account"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData prefixIcon,
    String? errorText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: Colors.grey.shade500,
          fontSize: 15.sp,
        ),
        prefixIcon: Icon(prefixIcon, color: Colors.grey.shade600, size: 22.sp),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Color(0xFF16A34A), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
        errorText: errorText,
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
