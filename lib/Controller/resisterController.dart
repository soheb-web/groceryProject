/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/network/api.state.dart';
import '../../core/utils/preety.dio.dart';

final getUserProvider = FutureProvider.family
    .autoDispose<Map<String, dynamic>, Map<String, dynamic>>((ref, data) async {
  final dio = await createDio();
  final service = APIStateNetwork(dio);
  final response = await service.getFindUserProfile(data);

  if (response.response.statusCode != 200) {
    Fluttertoast.showToast(msg: "Failed to fetch user profile");
    throw Exception('Failed to fetch user profile');
  }

  return response.data;
});*/

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/Body/userResister.dart';
import '../Model/registerResModel.dart';
import '../core/network/api.state.dart';
import '../core/utils/preety.dio.dart';

// final getFindProfileProvider = FutureProvider.autoDispose
//     .family<dynamic, UserResisterBodyModel>((ref, storeData) async {
//       final dio = await createDio();
//       final apiService = APIStateNetwork(dio);
//       try {
//         print("Fetching profile with data: ${storeData.toJson()}");
//         final response = await apiService.userRegister(storeData);
//         print(
//           "Fetch profile response: ${response.response.statusCode}, data: ${response.data}",
//         );
//         if (response.response.statusCode == 200 ||
//             response.response.statusCode == 201) {
//           final message = response.data.message?.toString() ?? "Success";
//           Fluttertoast.showToast(msg: message);
//           return response.data; // Return the API response data
//         } else {
//           final message =
//               response.data.message?.toString() ??
//               "Failed to fetch profile: ${response.response.statusCode}";
//           Fluttertoast.showToast(msg: message);
//           throw Exception(message);
//         }
//       } catch (e) {
//         print("Error in getFindProfileProvider: $e");
//         final errorMessage = e.toString();
//         Fluttertoast.showToast(msg: errorMessage);
//         throw Exception(errorMessage);
//       }
//     });

final userRegisterController =
    FutureProvider.family<RegisterResModel, UserResisterBodyModel>((
      ref,
      body,
    ) async {
      final registerService = APIStateNetwork(createDio());

      return await registerService.userRegister(body);
    });
