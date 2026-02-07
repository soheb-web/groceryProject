// To parse this JSON data, do
//
//     final supportResModel = supportResModelFromJson(jsonString);

import 'dart:convert';

SupportResModel supportResModelFromJson(String str) => SupportResModel.fromJson(json.decode(str));

String supportResModelToJson(SupportResModel data) => json.encode(data.toJson());

class SupportResModel {
    bool? success;
    String? message;
    String? contactId;

    SupportResModel({
        this.success,
        this.message,
        this.contactId,
    });

    factory SupportResModel.fromJson(Map<String, dynamic> json) => SupportResModel(
        success: json["success"],
        message: json["message"],
        contactId: json["contactId"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "contactId": contactId,
    };
}
