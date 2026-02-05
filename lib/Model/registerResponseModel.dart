// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  bool? success;
  String? message;
  Data? data;

  RegisterResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  User? user;
  Tokens? tokens;

  Data({
    this.user,
    this.tokens,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    tokens: json["tokens"] == null ? null : Tokens.fromJson(json["tokens"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "tokens": tokens?.toJson(),
  };
}

class Tokens {
  String? access;

  Tokens({
    this.access,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "access": access,
  };
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? role;
  String? phone;
  Address? address;
  Preferences? preferences;
  bool? isEmailVerified;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.address,
    this.preferences,
    this.isEmailVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    phone: json["phone"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    preferences: json["preferences"] == null ? null : Preferences.fromJson(json["preferences"]),
    isEmailVerified: json["isEmailVerified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "name": name,
    "email": email,
    "role": role,
    "phone": phone,
    "address": address?.toJson(),
    "preferences": preferences?.toJson(),
    "isEmailVerified": isEmailVerified,
  };
}

class Address {
  String? country;

  Address({
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
  };
}

class Preferences {
  bool? newsletter;
  bool? smsNotifications;
  String? currency;
  String? language;
  String? theme;

  Preferences({
    this.newsletter,
    this.smsNotifications,
    this.currency,
    this.language,
    this.theme,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
    newsletter: json["newsletter"],
    smsNotifications: json["smsNotifications"],
    currency: json["currency"],
    language: json["language"],
    theme: json["theme"],
  );

  Map<String, dynamic> toJson() => {
    "newsletter": newsletter,
    "smsNotifications": smsNotifications,
    "currency": currency,
    "language": language,
    "theme": theme,
  };
}
