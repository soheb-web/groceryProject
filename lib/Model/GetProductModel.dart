// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'dart:convert';

GetProductModel getProductModelFromJson(String str) => GetProductModel.fromJson(json.decode(str));

String getProductModelToJson(GetProductModel data) => json.encode(data.toJson());

class GetProductModel {
  bool? success;
  List<Datum>? data;
  Pagination? pagination;

  GetProductModel({
    this.success,
    this.data,
    this.pagination,
  });

  factory GetProductModel.fromJson(Map<String, dynamic> json) => GetProductModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Datum {
  String? id;
  String? name;
  int? v;
  String? category;
  double? cost;
  int? createdAt;
  int? date;
  String? description;
  int? discount;
  String? image;
  bool? inStock;
  bool? isDeleted;
  bool? isDisable;
  int? month;
  double? price;
  int? quantity;
  List<String>? tags;
  String? unit;
  int? updatedAt;
  int? year;

  Datum({
    this.id,
    this.name,
    this.v,
    this.category,
    this.cost,
    this.createdAt,
    this.date,
    this.description,
    this.discount,
    this.image,
    this.inStock,
    this.isDeleted,
    this.isDisable,
    this.month,
    this.price,
    this.quantity,
    this.tags,
    this.unit,
    this.updatedAt,
    this.year,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    v: json["__v"],
    category: json["category"]!,
    cost: json["cost"]?.toDouble(),
    createdAt: json["createdAt"],
    date: json["date"],
    description: json["description"],
    discount: json["discount"],
    image: json["image"],
    inStock: json["inStock"],
    isDeleted: json["isDeleted"],
    isDisable: json["isDisable"],
    month: json["month"],
    price: json["price"]?.toDouble(),
    quantity: json["quantity"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    unit: json["unit"]!,
    updatedAt: json["updatedAt"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "__v": v,
    "category":category,
    "cost": cost,
    "createdAt": createdAt,
    "date": date,
    "description": description,
    "discount": discount,
    "image": image,
    "inStock": inStock,
    "isDeleted": isDeleted,
    "isDisable": isDisable,
    "month": month,
    "price": price,
    "quantity": quantity,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "unit": unit,
    "updatedAt": updatedAt,
    "year": year,
  };
}

enum Unit {
  LB,
  THE_4_PIECE,
  UNIT
}

final unitValues = EnumValues({
  "lb": Unit.LB,
  "4 piece": Unit.THE_4_PIECE,
  "unit": Unit.UNIT
});

class Pagination {
  int? currentPage;
  int? totalPages;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPrevPage;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.totalCount,
    this.hasNextPage,
    this.hasPrevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    totalCount: json["totalCount"],
    hasNextPage: json["hasNextPage"],
    hasPrevPage: json["hasPrevPage"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "totalPages": totalPages,
    "totalCount": totalCount,
    "hasNextPage": hasNextPage,
    "hasPrevPage": hasPrevPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
