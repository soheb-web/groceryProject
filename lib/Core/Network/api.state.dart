import 'package:dio/dio.dart';
import 'package:grocery/Model/Body/loginBodyModel.dart';
import 'package:grocery/Model/Body/supportBodyModel.dart';
import 'package:grocery/Model/Body/updateProfileBodyModel.dart';
import 'package:grocery/Model/fetchProfileResModel.dart';
import 'package:grocery/Model/loginResModel.dart';
import 'package:grocery/Model/supportResModel.dart';
import 'package:grocery/Model/updateProfileResModel.dart';
import 'package:retrofit/retrofit.dart';

import '../../Model/Body/registerBodyModel.dart';
import '../../Model/registerResponseModel.dart';
part 'api.state.g.dart'; // File name ke hisab se .g.dart

//@RestApi(baseUrl: 'http://192.168.1.43:5000/api')
@RestApi(baseUrl: 'https://4vx2jv62-5000.inc1.devtunnels.ms/api')
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;

  @POST('/auth/register')
  Future<RegisterResponseModel> registerUser(@Body() RegisterBodyModel body);

  @POST('/auth/login')
  Future<LoginResModel> loginUser(@Body() LoginBodyModel body);

  @GET("/auth/profile")
  Future<FetchProfileResModel> fetchProfile();

  @PUT("/auth/updateProfile")
  Future<UpdateProfileResModel> updateProfile(
    @Body() UpdateProfileBodyModel body,
  );

  @POST("/user/contactForm")
  Future<SupportResModel> support(@Body() SupportBodyModel body);
}
