import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/Controller/fetchProfileController.dart';
import 'package:grocery/Core/Network/api.state.dart';
import 'package:grocery/Core/Utils/preety.dio.dart';
import 'package:grocery/Model/Body/updateProfileBodyModel.dart';

class UpdateProfileState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const UpdateProfileState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  UpdateProfileState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return UpdateProfileState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

final apiServiceProvider = Provider<APIStateNetwork>((ref) {
  final dio = createDio();
  return APIStateNetwork(dio);
});

final updateProfileProvider =
    StateNotifierProvider.autoDispose<
      UpdateProfileNotifier,
      UpdateProfileState
    >((ref) {
      final api = ref.read(apiServiceProvider);
      return UpdateProfileNotifier(api, ref);
    });

class UpdateProfileNotifier extends StateNotifier<UpdateProfileState> {
  final APIStateNetwork api;
  final Ref ref;

  UpdateProfileNotifier(this.api, this.ref) : super(const UpdateProfileState());

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String street,
    required String city,
    required String stateName,
    required String country,
    required String zipcode,
    required BuildContext context,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null, isSuccess: false);
      final body = UpdateProfileBodyModel(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: Address(
          street: street,
          city: city,
          state: stateName,
          country: country,
          zipCode: zipcode,
        ),
      );

      final response = await api.updateProfile(body);

      if (response.success == true) {
        state = state.copyWith(isLoading: false, isSuccess: true, error: null);
        ref.invalidate(fechProfileController);

        /// ✅ Success Toast
        Fluttertoast.showToast(
          msg: response.message ?? "Profile updated successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xFF169545),
          textColor: Colors.white,
          fontSize: 16.0,
        );

        if (context.mounted) {
          Navigator.pop(context); // back to profile
        }
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? "Update failed",
        );

        _showErrorSnackbar(context, response.message ?? "Update failed");
      }
    } on DioException catch (e) {
      String errorMessage = "Server error";

      if (e.response != null) {
        final data = e.response!.data;
        if (data is Map<String, dynamic>) {
          errorMessage = data["message"] ?? errorMessage;
        } else if (data is String) {
          errorMessage = data;
        }
      }

      state = state.copyWith(isLoading: false, error: errorMessage);
      _showErrorSnackbar(context, errorMessage);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      _showErrorSnackbar(context, e.toString());
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(message, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
