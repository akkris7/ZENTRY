class LoginResponse {
  String? errorMessage;
  bool? success;
  int? userId;
  String? email;
  String? phoneNumber;

  LoginResponse(
      {this.userId,
        this.phoneNumber,
        this.email,
        this.errorMessage,
        this.success
        });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    success = json['isSuccess'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['errorMessage'] = errorMessage;
    data['isSuccess'] = success;
    return data;
  }
}