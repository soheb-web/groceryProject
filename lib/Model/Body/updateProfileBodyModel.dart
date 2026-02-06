// To parse this JSON data, do
//
//     final updateProfileBodyModel = updateProfileBodyModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileBodyModel updateProfileBodyModelFromJson(String str) => UpdateProfileBodyModel.fromJson(json.decode(str));

String updateProfileBodyModelToJson(UpdateProfileBodyModel data) => json.encode(data.toJson());

class UpdateProfileBodyModel {
    String? firstName;
    String? lastName;
    String? phone;
    Address? address;

    UpdateProfileBodyModel({
        this.firstName,
        this.lastName,
        this.phone,
        this.address,
    });

    factory UpdateProfileBodyModel.fromJson(Map<String, dynamic> json) => UpdateProfileBodyModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "address": address?.toJson(),
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
