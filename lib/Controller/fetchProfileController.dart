import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/Core/Network/api.state.dart';
import 'package:grocery/Core/Utils/preety.dio.dart';
import 'package:grocery/Model/fetchProfileResModel.dart';

final fechProfileController = FutureProvider<FetchProfileResModel>((ref) async {
  final service = APIStateNetwork(createDio());
  return await service.fetchProfile();
});
