import 'dart:convert';

class RegistrationRequestModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? emailId;
  String? password;
  bool? is_volunteer;

  RegistrationRequestModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.emailId,
    this.password,
    this.is_volunteer
  });

  RegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    emailId = json['email'];
    password = json['password'];
    is_volunteer = json['is_volunteeer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['email'] = emailId;
    data['password'] = password;
    data['is_volunteeer'] = is_volunteer;
    return data;
  }
}