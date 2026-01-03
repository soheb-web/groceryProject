/*
// To parse this JSON data, do
//
//     final CreatePropertyResponseModel = CreatePropertyResponseModelFromJson(jsonString);

import 'dart:convert';

CreatePropertyResponseModel CreatePropertyResponseModelFromJson(String str) => CreatePropertyResponseModel.fromJson(json.decode(str));

String CreatePropertyResponseModelToJson(CreatePropertyResponseModel data) => json.encode(data.toJson());

class CreatePropertyResponseModel {
  String? message;
  int? code;
  bool? error;
  Data? data;

  CreatePropertyResponseModel({
    this.message,
    this.code,
    this.error,
    this.data,
  });

  factory CreatePropertyResponseModel.fromJson(Map<String, dynamic> json) => CreatePropertyResponseModel(
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
  String? property;
  String? propertyType;
  String? listingCategory;
  String? localityArea;
  String? city;
  String? price;
  String? area;
  String? bedRoom;
  List<String>? amenities;
  String? permitNo;
  String? rera;
  String? ded;
  String? brn;
  String? bathrooms;
  String? furnishing;
  String? description;
  List<AroundProject>? aroundProject;
  AveneuOverView? aveneuOverView;
  String? fullName;
  String? email;
  String? phone;
  String? propertyAddress;
  List<String>? uploadedPhotos;
  String? status;
  bool? isDisable;
  bool? isDeleted;
  String? id;
  int? date;
  int? month;
  int? year;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;

  Data({
    this.property,
    this.propertyType,
    this.listingCategory,
    this.localityArea,
    this.city,
    this.price,
    this.area,
    this.bedRoom,
    this.amenities,
    this.permitNo,
    this.rera,
    this.ded,
    this.brn,
    this.bathrooms,
    this.furnishing,
    this.description,
    this.aroundProject,
    this.aveneuOverView,
    this.fullName,
    this.email,
    this.phone,
    this.propertyAddress,
    this.uploadedPhotos,
    this.status,
    this.isDisable,
    this.isDeleted,
    this.id,
    this.date,
    this.month,
    this.year,
    this.createdAt,
    this.updatedAt,
    this.slug,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    property: json["property"],
    propertyType: json["propertyType"],
    listingCategory: json["listingCategory"],
    localityArea: json["localityArea"],
    city: json["city"],
    price: json["price"],
    area: json["area"],
    bedRoom: json["bedRoom"],
    amenities: json["amenities"] == null ? [] : List<String>.from(json["amenities"]!.map((x) => x)),
    permitNo: json["permitNo"],
    rera: json["rera"],
    ded: json["ded"],
    brn: json["brn"],
    bathrooms: json["bathrooms"],
    furnishing: json["furnishing"],
    description: json["description"],
    aroundProject: json["aroundProject"] == null ? [] : List<AroundProject>.from(json["aroundProject"]!.map((x) => AroundProject.fromJson(x))),
    aveneuOverView: json["aveneuOverView"] == null ? null : AveneuOverView.fromJson(json["aveneuOverView"]),
    fullName: json["fullName"],
    email: json["email"],
    phone: json["phone"],
    propertyAddress: json["propertyAddress"],
    uploadedPhotos: json["uploadedPhotos"] == null ? [] : List<String>.from(json["uploadedPhotos"]!.map((x) => x)),
    status: json["status"],
    isDisable: json["isDisable"],
    isDeleted: json["isDeleted"],
    id: json["_id"],
    date: json["date"],
    month: json["month"],
    year: json["year"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "property": property,
    "propertyType": propertyType,
    "listingCategory": listingCategory,
    "localityArea": localityArea,
    "city": city,
    "price": price,
    "area": area,
    "bedRoom": bedRoom,
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x)),
    "permitNo": permitNo,
    "rera": rera,
    "ded": ded,
    "brn": brn,
    "bathrooms": bathrooms,
    "furnishing": furnishing,
    "description": description,
    "aroundProject": aroundProject == null ? [] : List<dynamic>.from(aroundProject!.map((x) => x.toJson())),
    "aveneuOverView": aveneuOverView?.toJson(),
    "fullName": fullName,
    "email": email,
    "phone": phone,
    "propertyAddress": propertyAddress,
    "uploadedPhotos": uploadedPhotos == null ? [] : List<dynamic>.from(uploadedPhotos!.map((x) => x)),
    "status": status,
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "_id": id,
    "date": date,
    "month": month,
    "year": year,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "slug": slug,
  };
}

class AroundProject {
  String? name;
  String? details;
  String? id;

  AroundProject({
    this.name,
    this.details,
    this.id,
  });

  factory AroundProject.fromJson(Map<String, dynamic> json) => AroundProject(
    name: json["name"],
    details: json["details"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "details": details,
    "_id": id,
  };
}

class AveneuOverView {
  String? projectArea;
  String? size;
  String? projectSize;
  String? launchDate;
  String? possessionStart;

  AveneuOverView({
    this.projectArea,
    this.size,
    this.projectSize,
    this.launchDate,
    this.possessionStart,
  });

  factory AveneuOverView.fromJson(Map<String, dynamic> json) => AveneuOverView(
    projectArea: json["projectArea"],
    size: json["size"],
    projectSize: json["projectSize"],
    launchDate: json["launchDate"],
    possessionStart: json["possessionStart"],
  );

  Map<String, dynamic> toJson() => {
    "projectArea": projectArea,
    "size": size,
    "projectSize": projectSize,
    "launchDate": launchDate,
    "possessionStart": possessionStart,
  };
}
*/


// To parse this JSON data, do
//
//     final CreatePropertyResponseModel = CreatePropertyResponseModelFromJson(jsonString);

import 'dart:convert';

CreatePropertyResponseModel CreatePropertyResponseModelFromJson(String str) =>
    CreatePropertyResponseModel.fromJson(json.decode(str));

String CreatePropertyResponseModelToJson(CreatePropertyResponseModel data) =>
    json.encode(data.toJson());

class CreatePropertyResponseModel {
  String? message;
  int? code;
  bool? error;
  Data? data;

  CreatePropertyResponseModel({
    this.message,
    this.code,
    this.error,
    this.data,
  });

  factory CreatePropertyResponseModel.fromJson(Map<String, dynamic> json) => CreatePropertyResponseModel(
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
  String? property;
  String? propertyType;
  String? listingCategory;
  String? localityArea;
  String? city;
  String? price;
  String? area;
  String? bedRoom;
  List<String>? amenities;
  String? permitNo;
  String? rera;
  String? ded;
  String? brn;
  String? bathrooms;
  String? furnishing;
  String? description;
  List<AroundProject>? aroundProject;
  AveneuOverView? aveneuOverView;
  String? fullName;
  String? email;
  String? phone;
  String? propertyAddress;
  List<String>? uploadedPhotos;
  String? status;
  bool? isDisable;
  bool? isDeleted;
  String? id;
  int? date;
  int? month;
  int? year;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? slug;

  Data({
    this.property,
    this.propertyType,
    this.listingCategory,
    this.localityArea,
    this.city,
    this.price,
    this.area,
    this.bedRoom,
    this.amenities,
    this.permitNo,
    this.rera,
    this.ded,
    this.brn,
    this.bathrooms,
    this.furnishing,
    this.description,
    this.aroundProject,
    this.aveneuOverView,
    this.fullName,
    this.email,
    this.phone,
    this.propertyAddress,
    this.uploadedPhotos,
    this.status,
    this.isDisable,
    this.isDeleted,
    this.id,
    this.date,
    this.month,
    this.year,
    this.createdAt,
    this.updatedAt,
    this.slug,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    property: json["property"],
    propertyType: json["propertyType"],
    listingCategory: json["listingCategory"],
    localityArea: json["localityArea"],
    city: json["city"],
    price: json["price"]?.toString(),           // ← safe convert
    area: json["area"]?.toString(),
    bedRoom: json["bedRoom"]?.toString(),
    amenities: json["amenities"] == null
        ? []
        : List<String>.from(json["amenities"].map((x) => x.toString())),
    permitNo: json["permitNo"]?.toString(),
    rera: json["rera"]?.toString(),
    ded: json["ded"]?.toString(),
    brn: json["brn"]?.toString(),
    bathrooms: json["bathrooms"]?.toString(),
    furnishing: json["furnishing"],
    description: json["description"],
    aroundProject: json["aroundProject"] == null
        ? []
        : List<AroundProject>.from(json["aroundProject"].map((x) => AroundProject.fromJson(x))),
    aveneuOverView: json["aveneuOverView"] == null
        ? null
        : AveneuOverView.fromJson(json["aveneuOverView"]),
    fullName: json["fullName"],
    email: json["email"],
    phone: json["phone"],
    propertyAddress: json["propertyAddress"],
    uploadedPhotos: json["uploadedPhotos"] == null
        ? []
        : List<String>.from(json["uploadedPhotos"].map((x) => x.toString())),
    status: json["status"],
    isDisable: json["isDisable"],
    isDeleted: json["isDeleted"],
    id: json["_id"],
    date: json["date"],
    month: json["month"],
    year: json["year"],
    // ← यहाँ बदलाव: API से int timestamp आ रहा है
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json["createdAt"] is int
        ? json["createdAt"]
        : (json["createdAt"] as num).toInt()),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json["updatedAt"] is int
        ? json["updatedAt"]
        : (json["updatedAt"] as num).toInt()),
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "property": property,
    "propertyType": propertyType,
    "listingCategory": listingCategory,
    "localityArea": localityArea,
    "city": city,
    "price": price,
    "area": area,
    "bedRoom": bedRoom,
    "amenities": amenities,
    "permitNo": permitNo,
    "rera": rera,
    "ded": ded,
    "brn": brn,
    "bathrooms": bathrooms,
    "furnishing": furnishing,
    "description": description,
    "aroundProject": aroundProject?.map((x) => x.toJson()).toList(),
    "aveneuOverView": aveneuOverView?.toJson(),
    "fullName": fullName,
    "email": email,
    "phone": phone,
    "propertyAddress": propertyAddress,
    "uploadedPhotos": uploadedPhotos,
    "status": status,
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "_id": id,
    "date": date,
    "month": month,
    "year": year,
    "createdAt": createdAt?.millisecondsSinceEpoch,
    "updatedAt": updatedAt?.millisecondsSinceEpoch,
    "slug": slug,
  };
}

class AroundProject {
  String? name;
  String? details;
  String? id;

  AroundProject({this.name, this.details, this.id});

  factory AroundProject.fromJson(Map<String, dynamic> json) => AroundProject(
    name: json["name"],
    details: json["details"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "details": details,
    "_id": id,
  };
}

class AveneuOverView {
  String? projectArea;
  String? size;
  String? projectSize;
  String? launchDate;
  String? possessionStart;

  AveneuOverView({
    this.projectArea,
    this.size,
    this.projectSize,
    this.launchDate,
    this.possessionStart,
  });

  factory AveneuOverView.fromJson(Map<String, dynamic> json) => AveneuOverView(
    projectArea: json["projectArea"]?.toString(),
    size: json["size"]?.toString(),
    projectSize: json["projectSize"]?.toString(),
    launchDate: json["launchDate"],
    possessionStart: json["possessionStart"],
  );

  Map<String, dynamic> toJson() => {
    "projectArea": projectArea,
    "size": size,
    "projectSize": projectSize,
    "launchDate": launchDate,
    "possessionStart": possessionStart,
  };
}