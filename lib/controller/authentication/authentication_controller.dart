
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentry/model/model/registration_model.dart';
import 'package:zentry/model/response/login_response.dart';
import 'package:zentry/service/api_helper.dart';
import 'package:zentry/utils/constants.dart';
import 'package:zentry/views/screen/home/home_screen.dart';
import 'package:zentry/views/screen/login/login.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'dart:async';




class AuthController extends GetxController{
  var isLading = false.obs;
  String prefix = "91";
  String serverName = APIHelper().baseUrl;

  login(String username, String password) async {
    isLading.value = true;
    LoginResponse? loginResponse = await APIHelper().login(username, password);

    if (loginResponse != null) {
      if (loginResponse.success == true) {
        startBackgroundTask();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("email", username);
        prefs.setString("phoneNumber", loginResponse.phoneNumber ?? "NA");
        prefs.setString("userId", loginResponse.userId.toString() ?? "");
        Get.offAll(const Profiledetails());
        isLading.value = false;
      }
      else {
        showToast(message: loginResponse.errorMessage ?? "");
      }
      isLading.value = false;
    }else {
      isLading.value = false;
    }

    isLading.value = false;
  }

  register (RegistrationRequestModel request) async{
    print(request.is_volunteer);
    isLading.value = true;
    dynamic response = await APIHelper().register(request);
    bool result = response["isSuccess"];
    if (result){
      print(result);
      Get.offAll(const LoginScreen());
    }
    isLading.value = false;
  }

  startBackgroundTask() {
    print("background service started");
    Timer.periodic(Duration(minutes: 30), (Timer t) async {
      await APIHelper().updateLiveLocationLink();
    });
    FlutterBackgroundService().startService();
    FlutterBackgroundService().sendData({"action": "start"});
  }




}