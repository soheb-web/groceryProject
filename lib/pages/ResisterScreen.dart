import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),

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
                  fontSize: 24.sp, // थोड़ा बड़ा login से, premium feel
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
                hint: "Enter your full name",
                prefixIcon: Icons.person_outline,
              ),

              SizedBox(height: 20.h),

              // Email
              _buildLabel("Email"),
              _buildTextField(
                hint: "Enter your email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: 20.h),

              // Phone Number
              _buildLabel("Phone Number"),
              _buildTextField(
                hint: "Enter your phone number",
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 20.h),

              // Password
              _buildLabel("Password"),
              _buildTextField(
                hint: "Create password",
                prefixIcon: Icons.lock_outline,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade600,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),

              SizedBox(height: 20.h),

              // Confirm Password
              _buildLabel("Confirm Password"),
              _buildTextField(
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

              SizedBox(height: 32.h),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: _agreeToTerms
                      ? () {
                          ////////////////////
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16A34A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              // Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      color: const Color(0xFFA3A3A3),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // या login screen पर push
                      // अगर named routes इस्तेमाल कर रहे हो तो: Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF16A34A),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
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

  Widget _buildTextField({
    required String hint,
    required IconData prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: GoogleFonts.inter(fontSize: 16.sp),
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
      ),
    );
  }
}
