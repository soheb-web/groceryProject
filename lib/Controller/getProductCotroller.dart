import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery/Core/Network/api.state.dart';
import 'package:grocery/Core/Utils/preety.dio.dart';
import '../Model/GetProductModel.dart';

final getProductController = FutureProvider<GetProductModel>((ref) async {

  final service = APIStateNetwork(createDio());
  return await service.getProduct();

}
);
