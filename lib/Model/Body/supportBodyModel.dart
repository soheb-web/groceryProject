// To parse this JSON data, do
//
//     final supportBodyModel = supportBodyModelFromJson(jsonString);

import 'dart:convert';

SupportBodyModel supportBodyModelFromJson(String str) => SupportBodyModel.fromJson(json.decode(str));

String supportBodyModelToJson(SupportBodyModel data) => json.encode(data.toJson());

class SupportBodyModel {
    String? name;
    String? email;
    String? queryType;
    String? subject;
    String? message;

    SupportBodyModel({
        this.name,
        this.email,
        this.queryType,
        this.subject,
        this.message,
    });

    factory SupportBodyModel.fromJson(Map<String, dynamic> json) => SupportBodyModel(
        name: json["name"],
        email: json["email"],
        queryType: json["queryType"],
        subject: json["subject"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "queryType": queryType,
        "subject": subject,
        "message": message,
    };
}
