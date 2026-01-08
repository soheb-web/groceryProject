// To parse this JSON data, do
//
//     final myBookingServiceRequestResModel = myBookingServiceRequestResModelFromJson(jsonString);

import 'dart:convert';

MyBookingServiceRequestResModel myBookingServiceRequestResModelFromJson(String str) => MyBookingServiceRequestResModel.fromJson(json.decode(str));

String myBookingServiceRequestResModelToJson(MyBookingServiceRequestResModel data) => json.encode(data.toJson());

class MyBookingServiceRequestResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    MyBookingServiceRequestResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory MyBookingServiceRequestResModel.fromJson(Map<String, dynamic> json) => MyBookingServiceRequestResModel(
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
    List<ListElement>? list;
    int? total;

    Data({
        this.list,
        this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "total": total,
    };
}

class ListElement {
    String? id;
    UserId? userId;
    String? address;
    ServiceType? serviceType;
    String? message;
    String? status;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    int? v;
    ServiceBoy? serviceBoy;
    String? serviceProviderArrivalTime;
    String? rejectedReason;

    ListElement({
        this.id,
        this.userId,
        this.address,
        this.serviceType,
        this.message,
        this.status,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.serviceBoy,
        this.serviceProviderArrivalTime,
        this.rejectedReason,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        address: json["address"],
        serviceType: json["serviceType"] == null ? null : ServiceType.fromJson(json["serviceType"]),
        message: json["message"],
        status: json["status"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        serviceBoy: json["serviceBoy"] == null ? null : ServiceBoy.fromJson(json["serviceBoy"]),
        serviceProviderArrivalTime: json["serviceProviderArrivalTime"],
        rejectedReason: json["rejectedReason"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "address": address,
        "serviceType": serviceType?.toJson(),
        "message": message,
        "status": status,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "serviceBoy": serviceBoy?.toJson(),
        "serviceProviderArrivalTime": serviceProviderArrivalTime,
        "rejectedReason": rejectedReason,
    };
}

class ServiceBoy {
    String? id;
    String? name;
    String? phone;

    ServiceBoy({
        this.id,
        this.name,
        this.phone,
    });

    factory ServiceBoy.fromJson(Map<String, dynamic> json) => ServiceBoy(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
    };
}

class ServiceType {
    ServiceTypeId? id;
    ServiceTypeName? name;
    String? image;

    ServiceType({
        this.id,
        this.name,
        this.image,
    });

    factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: serviceTypeIdValues.map[json["_id"]]!,
        name: serviceTypeNameValues.map[json["name"]]!,
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": serviceTypeIdValues.reverse[id],
        "name": serviceTypeNameValues.reverse[name],
        "image": image,
    };
}

enum ServiceTypeId {
    THE_6942501_ED4_E8_A55841_FEE062,
    THE_69425_CE1_CB4_E5371_E2_D03_F41,
    THE_69425_D19_CB4_E5371_E2_D03_F44
}

final serviceTypeIdValues = EnumValues({
    "6942501ed4e8a55841fee062": ServiceTypeId.THE_6942501_ED4_E8_A55841_FEE062,
    "69425ce1cb4e5371e2d03f41": ServiceTypeId.THE_69425_CE1_CB4_E5371_E2_D03_F41,
    "69425d19cb4e5371e2d03f44": ServiceTypeId.THE_69425_D19_CB4_E5371_E2_D03_F44
});

enum ServiceTypeName {
    CARPENTER,
    PLUMBER,
    SECURITY_GUARD
}

final serviceTypeNameValues = EnumValues({
    "Carpenter": ServiceTypeName.CARPENTER,
    "Plumber": ServiceTypeName.PLUMBER,
    "Security Guard": ServiceTypeName.SECURITY_GUARD
});

class UserId {
    UserIdId? id;
    UserIdName? name;
    String? phone;
    Email? email;
    String? image;

    UserId({
        this.id,
        this.name,
        this.phone,
        this.email,
        this.image,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: userIdIdValues.map[json["_id"]]!,
        name: userIdNameValues.map[json["name"]]!,
        phone: json["phone"],
        email: emailValues.map[json["email"]]!,
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": userIdIdValues.reverse[id],
        "name": userIdNameValues.reverse[name],
        "phone": phone,
        "email": emailValues.reverse[email],
        "image": image,
    };
}

enum Email {
    RAJDHAKAD077_GMAIL_COM,
    SAHILJOYA_GMAIL_COM
}

final emailValues = EnumValues({
    "rajdhakad077@gmail.com": Email.RAJDHAKAD077_GMAIL_COM,
    "sahiljoya@gmail.com": Email.SAHILJOYA_GMAIL_COM
});

enum UserIdId {
    THE_6938_FF734_B0788_D952_CBDDB0,
    THE_695927_C105_C0_A9838_FB2956_F
}

final userIdIdValues = EnumValues({
    "6938ff734b0788d952cbddb0": UserIdId.THE_6938_FF734_B0788_D952_CBDDB0,
    "695927c105c0a9838fb2956f": UserIdId.THE_695927_C105_C0_A9838_FB2956_F
});

enum UserIdName {
    RAJ,
    SAHIL_KHAN
}

final userIdNameValues = EnumValues({
    "raj": UserIdName.RAJ,
    "Sahil khan": UserIdName.SAHIL_KHAN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
