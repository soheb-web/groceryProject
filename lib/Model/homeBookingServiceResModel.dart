// To parse this JSON data, do
//
//     final homeBookingServiceResModel = homeBookingServiceResModelFromJson(jsonString);

import 'dart:convert';

HomeBookingServiceResModel homeBookingServiceResModelFromJson(String str) => HomeBookingServiceResModel.fromJson(json.decode(str));

String homeBookingServiceResModelToJson(HomeBookingServiceResModel data) => json.encode(data.toJson());

class HomeBookingServiceResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    HomeBookingServiceResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory HomeBookingServiceResModel.fromJson(Map<String, dynamic> json) => HomeBookingServiceResModel(
        message: json["message"],
        code: json["code"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "error": error,
        "data": data?.toJson(),
    };
}

class Data {
    String? userId;
    String? address;
    String? serviceType;
    String? message;
    String? status;
    bool? isDisable;
    bool? isDeleted;
    String? id;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;

    Data({
        this.userId,
        this.address,
        this.serviceType,
        this.message,
        this.status,
        this.isDisable,
        this.isDeleted,
        this.id,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        address: json["address"],
        serviceType: json["serviceType"],
        message: json["message"],
        status: json["status"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "address": address,
        "serviceType": serviceType,
        "message": message,
        "status": status,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "_id": id,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
