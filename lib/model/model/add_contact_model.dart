import 'dart:convert';

class ContactRequestModel {
  String? userId;
  String? firstNumber;
  String? secondNumber;
  String? thirdNumber;
  String? forthNumber;
  String? fifthNumber;

  ContactRequestModel({
    this.userId,
    this.firstNumber,
    this.secondNumber,
    this.thirdNumber,
    this.forthNumber,
    this.fifthNumber
  });

  ContactRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fifthNumber = json['emergency_number_five'];
    forthNumber = json['emergency_number_four'];
    thirdNumber = json['emergency_number_three'];
    secondNumber = json['emergency_number_two'];
    firstNumber = json['emergency_number_one'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['emergency_number_one'] = firstNumber;
    data['emergency_number_two'] = secondNumber;
    data['emergency_number_three'] = thirdNumber;
    data['emergency_number_four'] = forthNumber;
    data['emergency_number_fifth'] = fifthNumber;
    return data;
  }
}