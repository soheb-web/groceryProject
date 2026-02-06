import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/Core/Network/api.state.dart';
import 'package:grocery/Core/Utils/preety.dio.dart';
import 'package:grocery/Model/Body/supportBodyModel.dart';
import 'package:riverpod/riverpod.dart';

class SupportState {
  final bool isLoading;
  final String? message;
  final String? error;

  const SupportState({this.isLoading = false, this.message, this.error});

  SupportState copyWith({bool? isLoading, String? message, String? error}) {
    return SupportState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}

final apiSerivceProvider = Provider<APIStateNetwork>((ref) {
  final dio = createDio();
  return APIStateNetwork(dio);
});

final supportProvider = StateNotifierProvider<SupportNotifier, SupportState>((
  ref,
) {
  final api = ref.read(apiSerivceProvider);
  return SupportNotifier(api);
});

class SupportNotifier extends StateNotifier<SupportState> {
  final APIStateNetwork api;

  SupportNotifier(this.api) : super(const SupportState());

  Future<bool> support(
    String name,
    String email,
    String type,
    String subject,
    String message,
    BuildContext context,
  ) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final body = SupportBodyModel(
        email: email,
        name: name,
        message: message,
        queryType: type,
        subject: subject,
      );

      final response = await api.support(body);

      if (response.success == true) {
        state = state.copyWith(
          isLoading: false,
          message: response.message ?? "Message Sent",
        );
        Navigator.pop(context);

        Fluttertoast.showToast(
          msg: state.message!,
          backgroundColor: const Color(0xFF169545),
          textColor: Colors.white,
        );

        return true; // 🔥 success
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? "Message Failed",
        );

        _showError(context, state.error!);
        return false;
      }
    } on DioException catch (e) {
      String errorMessage = "Server error";

      if (e.response?.data is Map<String, dynamic>) {
        errorMessage = e.response?.data["message"] ?? errorMessage;
      } else if (e.response?.data is String) {
        errorMessage = e.response?.data;
      }

      state = state.copyWith(isLoading: false, error: errorMessage);
      _showError(context, errorMessage);
      return false;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void _showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(msg, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
