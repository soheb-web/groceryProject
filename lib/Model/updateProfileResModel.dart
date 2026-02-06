// To parse this JSON data, do
//
//     final updateProfileResModel = updateProfileResModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileResModel updateProfileResModelFromJson(String str) => UpdateProfileResModel.fromJson(json.decode(str));

String updateProfileResModelToJson(UpdateProfileResModel data) => json.encode(data.toJson());

class UpdateProfileResModel {
    bool? success;
    String? message;

    UpdateProfileResModel({
        this.success,
        this.message,
    });

    factory UpdateProfileResModel.fromJson(Map<String, dynamic> json) => UpdateProfileResModel(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
