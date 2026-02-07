import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/Core/Network/api.state.dart';
import 'package:grocery/Core/Utils/preety.dio.dart';
import '../Model/CategoryModel.dart';

final getCategoryController = FutureProvider<CategoryModel>((ref) async {

  final service = APIStateNetwork(createDio());
  return await service.categories();

}
);
