import 'dart:convert';

class RegistrationRequestModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? emailId;
  String? password;
  bool? is_volunteer;
  int? userId;

  RegistrationRequestModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.emailId,
    this.password,
    this.is_volunteer,
    this.userId,
  });

  RegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    emailId = json['email'];
    password = json['password'];
    is_volunteer = json['is_volunteeer'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['email'] = emailId;
    data['password'] = password;
    data['is_volunteeer'] = is_volunteer;
    data['user_id'] = userId;
    return data;
  }
}