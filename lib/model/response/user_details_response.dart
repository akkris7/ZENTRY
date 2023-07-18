class UserDetailsResponse {
  String? errorMessage;
  bool? isSuccess;
  List<ProfileRecord>? details;

  UserDetailsResponse(
      {this.errorMessage,
        this.isSuccess,
        this.details});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'];
    isSuccess = json['isSuccess'];
    details = json['details'];
    if (json['details'] != null) {
      details = <ProfileRecord>[];
      json['details'].forEach((v) {
        details!.add(ProfileRecord.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = errorMessage;
    data['isSuccess'] = isSuccess;
    data['details'] = details;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileRecord {

  String? emailId;
  bool? isVolunteer;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;

  ProfileRecord(
      {this.emailId,
        this.password,
        this.phoneNumber,
        this.lastName,
        this.firstName,
        this.isVolunteer});

  ProfileRecord.fromJson(Map<String, dynamic> json) {
    emailId = json['email'];
    isVolunteer = json['isVolunteer'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = emailId;
    data['isVolunteer'] = isVolunteer;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}