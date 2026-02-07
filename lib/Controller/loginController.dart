import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/Core/Network/api.state.dart';
import 'package:grocery/Core/Utils/preety.dio.dart';
import 'package:grocery/Model/Body/loginBodyModel.dart';
import 'package:grocery/Model/loginResModel.dart';
import 'package:grocery/Pages/Home/homePage.dart';
import 'package:hive/hive.dart';

final loginController = FutureProvider.family<LoginResModel, LoginBodyModel>((
  ref,
  body,
) async {
  final serivce = APIStateNetwork(createDio());
  return await serivce.loginUser(body);
});

/////////////// login state

class LoginState {
  final bool isLoading;
  final String? error;
  final String? token;

  const LoginState({this.isLoading = false, this.error, this.token});

  LoginState copyWith({bool? isLoading, String? error, String? token}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      token: token ?? this.token,
    );
  }
}

final apiServiceProvider = Provider<APIStateNetwork>((ref) {
  final dio = createDio();
  return APIStateNetwork(dio);
});

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
      final api = ref.read(apiServiceProvider);
      return LoginNotifier(api);
    });

class LoginNotifier extends StateNotifier<LoginState> {
  final APIStateNetwork api;

  LoginNotifier(this.api) : super(const LoginState());

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await api.loginUser(
        LoginBodyModel(email: email, password: password),
      );

      if (response.success == true) {
        var box = Hive.box("userdata");
        await box.clear();
        final token = response.data?.tokens?.access;
        await box.put("token", response.data!.tokens!.access);
        await box.put("firstName", response.data!.user!.firstName);
        await box.put("lastName", response.data!.user!.lastName);
        await box.put("email", response.data!.user!.email);
        await box.put("name", response.data!.user!.name);
        await box.put("id", response.data!.user!.id);
        state = state.copyWith(isLoading: false, token: token, error: null);
        Fluttertoast.showToast(
          msg: response.message ?? "Login Complete",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFF169545), 
          textColor: Colors.white,
          fontSize: 16.0,
        );
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeBottom()),
            (route) => false,
          );
        }
        ;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.message ?? "Login failed",
        );

        /// ❌ Error Snackbar → red
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            margin: EdgeInsets.only(left: 10.r, right: 10.r, bottom: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            content: Text(
              response.message ?? "Login failed",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
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

      /// ❌ Dio error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          margin: EdgeInsets.only(left: 10.r, right: 10.r, bottom: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          content: Text(errorMessage, style: TextStyle(color: Colors.white)),
        ),
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
