// To parse this JSON data, do
//
//     final loanQueryBodyModel = loanQueryBodyModelFromJson(jsonString);

import 'dart:convert';

LoanQueryBodyModel loanQueryBodyModelFromJson(String str) => LoanQueryBodyModel.fromJson(json.decode(str));

String loanQueryBodyModelToJson(LoanQueryBodyModel data) => json.encode(data.toJson());

class LoanQueryBodyModel {
    String phone;
    bool finalize;
    String amount;
    String city;

    LoanQueryBodyModel({
        required this.phone,
        required this.finalize,
        required this.amount,
        required this.city,
    });

    factory LoanQueryBodyModel.fromJson(Map<String, dynamic> json) => LoanQueryBodyModel(
        phone: json["phone"],
        finalize: json["finalize"],
        amount: json["amount"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "finalize": finalize,
        "amount": amount,
        "city": city,
    };
}
