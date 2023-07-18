import 'dart:convert';

class ContactListResponse {
  String? ErrorMessage;
  bool? IsSuccess;
  List<ContactRecords>? records;

  ContactListResponse(
      {
        this.ErrorMessage,
        this.IsSuccess,
        this.records});

  ContactListResponse.fromJson(Map<String, dynamic> json) {
    ErrorMessage = json['errorMessage'];
    IsSuccess= json['isSuccess'];
    if (json['contacts'] != null) {
      records = <ContactRecords>[];
      json['contacts'].forEach((v) {
        records!.add(ContactRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = ErrorMessage;
    data['isSuccess'] = IsSuccess;
    if (records != null) {
      data['contacts'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactRecords {

  String? PhoneNumber1;
  String? PhoneNumber2;
  String? PhoneNumber3;
  String? PhoneNumber4;
  String? PhoneNumber5;

  ContactRecords(
      {this.PhoneNumber1,
        this.PhoneNumber2,
        this.PhoneNumber3,
        this.PhoneNumber4,
        this.PhoneNumber5,
      });

  ContactRecords.fromJson(Map<String, dynamic> json) {
    PhoneNumber1 = json['firstNumber'];
    PhoneNumber2 = json['secondNumber'];
    PhoneNumber3 = json['thirdNumber'];
    PhoneNumber4 = json['fourthNumber'];
    PhoneNumber5 = json['fifthNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstNumber'] = PhoneNumber1;
    data['secondNumber'] = PhoneNumber2;
    data['thirdNumber'] = PhoneNumber3;
    data['fourthNumber'] = PhoneNumber4;
    data['fifthNumber'] = PhoneNumber5;
    return data;
  }
}
