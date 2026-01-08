// To parse this JSON data, do
//
//     final homeBookingServiceBodyModel = homeBookingServiceBodyModelFromJson(jsonString);

import 'dart:convert';

HomeBookingServiceBodyModel homeBookingServiceBodyModelFromJson(String str) =>
    HomeBookingServiceBodyModel.fromJson(json.decode(str));

String homeBookingServiceBodyModelToJson(HomeBookingServiceBodyModel data) =>
    json.encode(data.toJson());

class HomeBookingServiceBodyModel {
  String address;
  String? message;
  String serviceType;

  HomeBookingServiceBodyModel({
    required this.address,
    this.message,
    required this.serviceType,
  });

  factory HomeBookingServiceBodyModel.fromJson(Map<String, dynamic> json) =>
      HomeBookingServiceBodyModel(
        address: json["address"],
        message: json["message"],
        serviceType: json["serviceType"],
      );

  Map<String, dynamic> toJson() => {
    "address": address,
    "message": message,
    "serviceType": serviceType,
  };
}
