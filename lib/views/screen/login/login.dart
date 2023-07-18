import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentry/controller/authentication/authentication_controller.dart';
import 'package:zentry/service/api_urls.dart';
import 'package:zentry/utils/colors.dart';
import 'package:zentry/utils/images.dart';
import 'package:zentry/views/screen/home/home_screen.dart';
import 'package:zentry/views/screen/login/register.dart';
import 'package:zentry/views/widgets/custom_buton.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {


  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  bool _isLoading = false;
  bool _switchValue = false;
  String hint = "username";
  String title = "Login";
  bool isVisible = true;


  @override
  void initState(){
    checkTokenExists();
    super.initState();
  }
  checkTokenExists() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? phoneNumber = preferences.getString("phoneNumber");
    print(phoneNumber);
    if (phoneNumber !=null && phoneNumber!= ""){
      Get.offAll(const Profiledetails());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBg,
        body: authController.isLading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                        child: Image.asset(
                          Images.splashLogo,
                          alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width*0.25,
                        height: MediaQuery.of(context).size.height*0.15,),
                      ),
                      Container(
                        child: const Text("ZENTRY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text("Welcome Back", style: TextStyle(color: Colors.grey)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10,top: 40),
                          width: MediaQuery.of(context).size.width*0.80,
                          height: MediaQuery.of(context).size.height*0.070,
                          child: TextField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.blue,width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: lightGrey2, width: 2)
                              ),
                              hintText: "Email",
                              fillColor: themeBg,
                              filled: true,
                            ),
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 25,top: 10),
                          width: MediaQuery.of(context).size.width*0.80,
                          height: MediaQuery.of(context).size.height*0.070,
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.blue,width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: lightGrey2, width: 2)
                              ),
                              hintText: "Password",
                              fillColor: themeBg,
                              filled: true,
                            ),
                          )
                      ),
                      Obx(() => CustomButton(
                        width: MediaQuery.of(context).size.width*0.80,
                        title: "Submit",
                        isLoading: authController.isLading.value,
                        onTap: () async {
                            if (_formKey.currentState!.validate()){
                              setState(() {});
                              await authController.login(userNameController.text.trim(), passwordController.text.trim());
                              setState(() {});
                            }

                        },
                      ),),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.3, 10, MediaQuery.of(context).size.width*0.3, 10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              alignment: Alignment.center,
                              child: const Text("New here?"),
                            ),
                            GestureDetector(
                              child: const Text("Register", style: TextStyle(color: Colors.blueAccent),),
                              onTap: () => Get.to(RegisterScreen()),
                            )
                          ],
                        ),
                      ),
                      Text(APIUrls.apiURL),
                    ],
                  ),
                )
            ),
          ),
        )
    );
  }
}
