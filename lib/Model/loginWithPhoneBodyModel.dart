// To parse this JSON data, do
//
//     final loginWithPhoneBodyModel = loginWithPhoneBodyModelFromJson(jsonString);

import 'dart:convert';

LoginWithPhoneBodyModel loginWithPhoneBodyModelFromJson(String str) =>
    LoginWithPhoneBodyModel.fromJson(json.decode(str));

String loginWithPhoneBodyModelToJson(LoginWithPhoneBodyModel data) =>
    json.encode(data.toJson());

class LoginWithPhoneBodyModel {
  String phone;
  String? password;

  LoginWithPhoneBodyModel({required this.phone, this.password});

  factory LoginWithPhoneBodyModel.fromJson(Map<String, dynamic> json) =>
      LoginWithPhoneBodyModel(phone: json["phone"], password: json['password']);

  Map<String, dynamic> toJson() => {"phone": phone, "password": password};
}
