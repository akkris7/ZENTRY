import 'dart:convert';

class UserDetailsResponse {
  String? ErrorMessage;
  bool? IsSuccess;
  List<ProfileRecords>? records;

  UserDetailsResponse(
      {
        this.ErrorMessage,
        this.IsSuccess,
        this.records});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    ErrorMessage = json['errorMessage'];
    IsSuccess= json['isSuccess'];
    if (json['details'] != null) {
      records = <ProfileRecords>[];
      json['details'].forEach((v) {
        records!.add(ProfileRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = ErrorMessage;
    data['isSuccess'] = IsSuccess;
    if (records != null) {
      data['details'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileRecords {

  String? email;
  bool? isVolunteer;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? passWord;

  ProfileRecords(
      {this.email,
        this.isVolunteer,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.passWord
      });

  ProfileRecords.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    isVolunteer = json['isVolunteer'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    passWord = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['isVolunteer'] = isVolunteer;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['password'] = passWord;
    return data;
  }
}
