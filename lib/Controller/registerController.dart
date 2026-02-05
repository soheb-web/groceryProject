import 'package:flutter/material.dart';
import '../Core/Network/api.state.dart';
import '../Core/Utils/preety.dio.dart';
import '../Model/Body/registerBodyModel.dart';

class RegisterController extends ChangeNotifier {
  // ─── Form Controllers ───────────────────────────────────────────────────────
  final fullNameController    = TextEditingController();
  final lastNameController    = TextEditingController();
  final emailController       = TextEditingController();
  final phoneController       = TextEditingController();
  final passwordController    = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ─── State ──────────────────────────────────────────────────────────────────
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // ─── Getters for clean validation ───────────────────────────────────────────
  bool get passwordsMatch => passwordController.text == confirmPasswordController.text;

  String? validateFullName() {
    final name = fullNameController.text.trim();
    if (name.isEmpty) return "Full name is required";
    if (name.length < 3) return "Name too short";
    return null;
  }

  String? validateLastName() {
    final name = lastNameController.text.trim();           // ← FIXED: was using fullNameController
    if (name.isEmpty) return "Last name is required";
    if (name.length < 2) return "Last name too short";     // slightly more lenient than full name
    return null;
  }

  String? validateEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) return "Email is required";
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePhone() {
    final phone = phoneController.text.trim();
    if (phone.isEmpty) return "Phone number is required";
    if (phone.length < 10) return "Phone number too short";
    if (phone.length > 15) return "Phone number too long";
    return null;
  }

  String? validatePassword() {
    final pass = passwordController.text;
    if (pass.isEmpty) return "Password is required";
    if (pass.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  String? validateConfirmPassword() {
    if (confirmPasswordController.text.isEmpty) return "Please confirm your password";
    if (!passwordsMatch) return "Passwords do not match";
    return null;
  }

  bool get isFormValid {
    return validateFullName() == null &&
        validateLastName() == null &&
        validateEmail() == null &&
        validatePhone() == null &&
        validatePassword() == null &&
        validateConfirmPassword() == null;
  }

  // ─── Main Register Function ─────────────────────────────────────────────────
  Future<bool> register(BuildContext context) async {
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();

    // Final trim & split name
    final fullName = fullNameController.text.trim();
    final nameParts = fullName.split(RegExp(r'\s+'));
    final firstName = nameParts.isNotEmpty ? nameParts.first : "";
    final lastName = lastNameController.text.trim();   // using separate controller

    try {
      final service = APIStateNetwork(createDio());

      await service.registerUser(
        RegisterBodyModel(
          firstName: firstName,
          lastName: lastName,
          email: emailController.text.trim(),
          password: passwordController.text,
          phone: phoneController.text.trim(),
        ),
      );

      _isLoading = false;
      notifyListeners();
      return true; // success
    } catch (e) {
      // Improved error message extraction
      String msg = e.toString();
      if (msg.startsWith("Exception: ")) {
        msg = msg.substring(11);
      }
      _errorMessage = msg.isNotEmpty ? msg : "Something went wrong. Please try again.";
      _isLoading = false;
      notifyListeners();
      return false; // failed
    }
  }

  // Call this when screen disposes
  void disposeControllers() {
    fullNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}