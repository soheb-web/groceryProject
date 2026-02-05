// To parse this JSON data, do
//
//     final registerBodyModel = registerBodyModelFromJson(jsonString);

import 'dart:convert';

RegisterBodyModel registerBodyModelFromJson(String str) => RegisterBodyModel.fromJson(json.decode(str));

String registerBodyModelToJson(RegisterBodyModel data) => json.encode(data.toJson());

class RegisterBodyModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;

  RegisterBodyModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
  });

  factory RegisterBodyModel.fromJson(Map<String, dynamic> json) => RegisterBodyModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "phone": phone,
  };
}
