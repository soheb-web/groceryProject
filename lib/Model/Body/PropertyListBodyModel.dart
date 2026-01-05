// To parse this JSON data, do
//
//     final propertyListBodyModel = propertyListBodyModelFromJson(jsonString);

import 'dart:convert';

PropertyListBodyModel propertyListBodyModelFromJson(String str) => PropertyListBodyModel.fromJson(json.decode(str));

String propertyListBodyModelToJson(PropertyListBodyModel data) => json.encode(data.toJson());

class PropertyListBodyModel {
  String? sortOrder;
  String? sortBy;
  int? pageNo;
  int? size;

  PropertyListBodyModel({
    this.sortOrder,
    this.sortBy,
    this.pageNo,
    this.size,
  });

  factory PropertyListBodyModel.fromJson(Map<String, dynamic> json) => PropertyListBodyModel(
    sortOrder: json["sortOrder"],
    sortBy: json["sortBy"],
    pageNo: json["pageNo"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "sortOrder": sortOrder,
    "sortBy": sortBy,
    "pageNo": pageNo,
    "size": size,
  };
}
