import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api.state.g.dart'; // File name ke hisab se .g.dart

@RestApi(baseUrl: 'https://api.propertyleinnovation.com/api/v1')
//@RestApi(baseUrl: 'http://192.168.1.22:9999/api/v1')

abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;



}
