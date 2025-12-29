import 'package:dio/dio.dart';
import 'package:realstate/Model/Body/userResister.dart';
import 'package:realstate/Model/loginWithPhoneBodyModel.dart';
import 'package:realstate/Model/registerResModel.dart';
import 'package:realstate/Model/verifyBodyModel.dart';
import 'package:realstate/Model/verifyResModel.dart';
import 'package:retrofit/retrofit.dart';

part 'api.state.g.dart'; // File name ke hisab se .g.dart

@RestApi(baseUrl: 'https://api.propertyleinnovation.com/api/v1')
//@RestApi(baseUrl: 'http://192.168.1.22:9999/api/v1')
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @POST('/user/userRegister')
  Future<RegisterResModel> userRegister(@Body() UserResisterBodyModel body);

  @POST("/user/verifyOtp")
  Future<VerifyResModel> verifyUser(@Body() VerifyBodyModel body);

  @POST("/user/userLogin")
  Future<RegisterResModel> loginUser(@Body() LoginWithPhoneBodyModel body);
}
