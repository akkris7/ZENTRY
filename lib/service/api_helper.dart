import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentry/model/model/add_contact_model.dart';
import 'package:zentry/model/model/registration_model.dart';
import 'package:zentry/model/response/contact_response.dart';
import 'package:zentry/model/response/login_response.dart';
import 'package:zentry/service/api_service.dart';
import 'package:zentry/service/api_urls.dart';
import 'package:zentry/service/exception_handler.dart';
import 'package:zentry/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:http_parser/src/media_type.dart';
import 'package:geolocator/geolocator.dart';

class APIHelper
{
  String baseUrl = APIUrls.apiURL;
  final Map<String, String> headers = {'Content-Type':'application/json'};

  Future<LoginResponse?> login(String username, String password) async {
    final String url = baseUrl + APIUrls.loginUrl;

    String body = json.encode({"email": username, "password": password});

    try {
      Response? response = await APIService().postAPICall(url, body, headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200){
        return LoginResponse.fromJson(responseData);
      } else if (responseData != null && responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      }
      else{
        showToast(message: "Something went wrong");
        return null;
      }
    }
    catch (e) {
      if (kDebugMode) {
        print("Error type: ${e.runtimeType..toString()}");
      }
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
    }
  }

  Future<dynamic> register(RegistrationRequestModel registrationRequestModel) async {
    final String url = baseUrl + APIUrls.register;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      const JsonEncoder encoder = JsonEncoder();
      String body = encoder.convert({
      "first_name": registrationRequestModel.firstName,
      "last_name": registrationRequestModel.lastName,
      "phone_number": registrationRequestModel.phoneNumber,
      "email": registrationRequestModel.emailId,
      "password": registrationRequestModel.password,
      "is_volunteeer":  registrationRequestModel.is_volunteer
      });
      Response? response = await APIService().postAPICall(url, body, headers);

      var responseData = json.decode(response!.body);



      if (response.statusCode == 200) {
        return responseData;
      }else if (responseData != null && responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong!");
      }
      return null;

    } catch (e) {
      print("Error type: ${e.runtimeType..toString()}");
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
    }
  }

  Future<dynamic> sendImageToApi(XFile imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    int parsedUserId = int.parse(userId!);
    print(imageFile.name);
    final String url = '$baseUrl/File/upload/image/$parsedUserId';



    var request = http.MultipartRequest('POST', Uri.parse(url));
    var file = await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      contentType: MediaType('image', 'yuv420'),
    );
    print(imageFile.path);
    print(request.url);
    request.files.add(file);

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image sent successfully');
        return response.statusCode;
      } else {
        print('Failed to send image. Error code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending image: $e');
    }
  }

  Future<dynamic> sendAudioToApi(String audioFilePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    int parsedUserId = int.parse(userId!);
    final String url = '$baseUrl/File/upload/audio/$parsedUserId';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    var audioFile = await http.MultipartFile.fromPath(
      'file',
      audioFilePath,
      contentType: MediaType('audio', 'x-aac'),
    );

    request.files.add(audioFile);

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Audio file sent successfully');
        return response.statusCode;
      } else {
        print('Failed to send audio file. Error code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending audio file: $e');
    }
  }

  Future<dynamic> getLiveLocationLink() async {

    final String url = baseUrl + APIUrls.AddorUpdateLocation;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    int parsedUserId = int.parse(userId!);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print("Location services are not enabled");
        return null;
      }


      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        print("Location permission is permanently denied");
        return null;
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return null;
        }
      }


      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );


      String latitude = position.latitude.toString();
      String longitude = position.longitude.toString();
      String liveLocationLink = 'https://www.google.com/maps?q=$latitude,$longitude';
      print(liveLocationLink);
      const JsonEncoder encoder = JsonEncoder();
      String body = encoder.convert({
        "record_id": 0,
        "user_id": parsedUserId,
        "longitude" : longitude,
        "latitude" : latitude
      });
      Response? response = await APIService().postAPICall(url, body, headers);

      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        sendAlert();
        return response.statusCode;
      }else if (responseData != null && responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong!");
      }
      print("-----------------------------");
      return null;

    } catch (e) {
      print('Error obtaining live location: $e');
      return null;
    }


  }

  Future<dynamic> sendAlert() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    int parsedUserId = int.parse(userId!);
    final url = '$baseUrl/sendmessage?userId=$userId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('Message sent successfully');
      } else {
        print('Failed to send message. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while sending message: $error');
    }
  }

  Future<dynamic> addContact(ContactRequestModel requestModel) async {
    final String url = baseUrl + APIUrls.AddContact;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    int parsedUserId = int.parse(userId!);

    try {
      const JsonEncoder encoder = JsonEncoder();
      String body = encoder.convert({
        "user_id": parsedUserId,
        "emergency_number_one": requestModel.firstNumber,
        "emergency_number_two": requestModel.secondNumber,
        "emergency_number_three": requestModel.thirdNumber,
        "emergency_number_four": requestModel.forthNumber,
        "emergency_number_five" : requestModel.fifthNumber,
      });
      Response? response = await APIService().postAPICall(url, body, headers);

      var responseData = json.decode(response!.body);



      if (response.statusCode == 200) {
        return responseData;
      }else if (responseData != null && responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong!");
      }
      print("-----------------------------");
      return null;

    } catch (e) {
      print("Error type: ${e.runtimeType..toString()}");
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
    }
  }

  Future<ContactListResponse?> getContact() async {

    try {
      final String url = baseUrl + APIUrls.getContact;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("userId");
      int parsedUserId = int.parse(userId!);

      String body = json.encode({"user_id": parsedUserId});

      Response? response = await APIService().postAPICall(url, body, headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        print("Success");
        return ContactListResponse.fromJson(responseData);
      } else if (responseData != null && responseData.contains("ErrorMessage")) {
        showToast(message: responseData["ErrorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong");
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error type: ${e.runtimeType..toString()}");
      }
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
      return null;
    }
  }

  Future<dynamic> updateLiveLocationLink() async {

    final String url = baseUrl + APIUrls.AddorUpdateLocation;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    int parsedUserId = int.parse(userId!);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print("Location services are not enabled");
        return null;
      }


      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        print("Location permission is permanently denied");
        return null;
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return null;
        }
      }


      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );


      String latitude = position.latitude.toString();
      String longitude = position.longitude.toString();
      String liveLocationLink = 'https://www.google.com/maps?q=$latitude,$longitude';
      print(liveLocationLink);
      const JsonEncoder encoder = JsonEncoder();
      String body = encoder.convert({
        "record_id": 0,
        "user_id": parsedUserId,
        "longitude" : longitude,
        "latitude" : latitude
      });
      Response? response = await APIService().postAPICall(url, body, headers);

      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        return response.statusCode;
      }else if (responseData != null && responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong!");
      }
      print("-----------------------------");
      return null;

    } catch (e) {
      print('Error obtaining live location: $e');
      return null;
    }


  }

}