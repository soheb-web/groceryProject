// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    bool? success;
    String? message;
    Data? data;

    LoginResModel({
        this.success,
        this.message,
        this.data,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
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
    String? refresh;

    Tokens({
        this.access,
        this.refresh,
    });

    factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: json["access"],
        refresh: json["refresh"],
    );

    Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
    };
}

class User {
    String? id;
    String? firstName;
    String? lastName;
    String? name;
    String? email;
    String? role;
    Preferences? preferences;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.name,
        this.email,
        this.role,
        this.preferences,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        preferences: json["preferences"] == null ? null : Preferences.fromJson(json["preferences"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "name": name,
        "email": email,
        "role": role,
        "preferences": preferences?.toJson(),
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
