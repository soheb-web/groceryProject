// To parse this JSON data, do
//
//     final fetchProfileResModel = fetchProfileResModelFromJson(jsonString);

import 'dart:convert';

FetchProfileResModel fetchProfileResModelFromJson(String str) => FetchProfileResModel.fromJson(json.decode(str));

String fetchProfileResModelToJson(FetchProfileResModel data) => json.encode(data.toJson());

class FetchProfileResModel {
    bool? success;
    String? message;
    User? user;

    FetchProfileResModel({
        this.success,
        this.message,
        this.user,
    });

    factory FetchProfileResModel.fromJson(Map<String, dynamic> json) => FetchProfileResModel(
        success: json["success"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
    };
}

class User {
    String? id;
    String? firstName;
    String? lastName;
    String? name;
    String? email;
    String? phone;
    Address? address;
    String? role;
    bool? isActive;
    bool? isDeleted;
    bool? isEmailVerified;
    List<dynamic>? paymentMethods;
    Preferences? preferences;
    DateTime? lastActivity;
    int? sessionCount;
    List<dynamic>? refreshTokens;
    List<dynamic>? loginHistory;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    DateTime? lastLogin;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.role,
        this.isActive,
        this.isDeleted,
        this.isEmailVerified,
        this.paymentMethods,
        this.preferences,
        this.lastActivity,
        this.sessionCount,
        this.refreshTokens,
        this.loginHistory,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.lastLogin,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        role: json["role"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        isEmailVerified: json["isEmailVerified"],
        paymentMethods: json["paymentMethods"] == null ? [] : List<dynamic>.from(json["paymentMethods"]!.map((x) => x)),
        preferences: json["preferences"] == null ? null : Preferences.fromJson(json["preferences"]),
        lastActivity: json["lastActivity"] == null ? null : DateTime.parse(json["lastActivity"]),
        sessionCount: json["sessionCount"],
        refreshTokens: json["refreshTokens"] == null ? [] : List<dynamic>.from(json["refreshTokens"]!.map((x) => x)),
        loginHistory: json["loginHistory"] == null ? [] : List<dynamic>.from(json["loginHistory"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        lastLogin: json["lastLogin"] == null ? null : DateTime.parse(json["lastLogin"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address?.toJson(),
        "role": role,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "isEmailVerified": isEmailVerified,
        "paymentMethods": paymentMethods == null ? [] : List<dynamic>.from(paymentMethods!.map((x) => x)),
        "preferences": preferences?.toJson(),
        "lastActivity": lastActivity?.toIso8601String(),
        "sessionCount": sessionCount,
        "refreshTokens": refreshTokens == null ? [] : List<dynamic>.from(refreshTokens!.map((x) => x)),
        "loginHistory": loginHistory == null ? [] : List<dynamic>.from(loginHistory!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "lastLogin": lastLogin?.toIso8601String(),
    };
}

class Address {
    String? street;
    String? city;
    String? state;
    String? zipCode;
    String? country;

    Address({
        this.street,
        this.city,
        this.state,
        this.zipCode,
        this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "zipCode": zipCode,
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
