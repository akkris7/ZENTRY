import 'package:flutter/material.dart';
import 'package:zentry/controller/authentication/authentication_controller.dart';
import 'package:zentry/model/model/registration_model.dart';
import 'package:zentry/utils/constants.dart';
import 'package:zentry/views/widgets/custom_buton.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _switchValue = false;
  bool isValidPhone = true;
  bool isValidEmail = true;
  bool isValidPassword = true;
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
  }
  bool isValidEmailID(String input) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(input);
  }

  bool isValidPhoneNumber(String input) {
    final phoneRegex = RegExp(r'^\+91\d{10}$');
    // Assumes a 10-digit phone number format
    return phoneRegex.hasMatch(input);
  }

  bool isValidPasswordCheck(String input) {
    final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(input);
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
                        margin: const EdgeInsets.fromLTRB(0, 60, 0, 10),
                        child: Image.asset(
                          Images.splashLogo,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width*0.15,
                          height: MediaQuery.of(context).size.height*0.080,),
                      ),
                      Container(
                        child: const Text("ZENTRY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text("Register", style: TextStyle(color: Colors.grey)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: Text("Register as Volunteer",style: TextStyle(fontSize: 18, color: lightGrey6),textAlign: TextAlign.center),
                            ),
                          Container(
                            child: Switch(
                            inactiveTrackColor: Colors.grey,
                            activeColor: loginUpperCard,
                            value: _switchValue,
                            onChanged: (bool value) {
                                setState(() {
                                  _switchValue = value;
                            });
                        },
                      ))
                        ]
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10,top: 20),
                          width: MediaQuery.of(context).size.width*0.80,
                          height: MediaQuery.of(context).size.height*0.070,
                          child: TextField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.blue,width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: lightGrey2, width: 2)
                              ),
                              hintText: "First Name",
                              fillColor: themeBg,
                              filled: true,
                            ),
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10,top: 10),
                          width: MediaQuery.of(context).size.width*0.80,
                          height: MediaQuery.of(context).size.height*0.070,
                          child: TextField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.blue,width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: lightGrey2, width: 2)
                              ),
                              hintText: "Last Name",
                              fillColor: themeBg,
                              filled: true,
                            ),
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.070,
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a phone number';
                            } else if (!isValidPhoneNumber(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: lightGrey2, width: 2),
                            ),
                            hintText: "Phone Number",
                            fillColor: themeBg,
                            filled: true,
                          ),
                        ),
                      ),

                      // Email TextField
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.070,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter an email';
                            } else if (!isValidEmailID(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: lightGrey2, width: 2),
                            ),
                            hintText: "Email",
                            fillColor: themeBg,
                            filled: true,
                          ),
                        ),
                      ),

                      // Password TextField
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.070,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            } else if (!isValidPasswordCheck(value)) {
                              return 'Please enter a valid password. Ensure the password meets the following criteria: \nContains at least one uppercase letter (A-Z) \nContains at least one lowercase letter (a-z) \nContains at least one digit (0-9) \nHas a minimum length of 8 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: lightGrey2, width: 2),
                            ),
                            hintText: "Password",
                            fillColor: themeBg,
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.070,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm password';
                            } else if (!isValidPasswordCheck(value)) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: lightGrey2, width: 2),
                            ),
                            hintText: "Password",
                            fillColor: themeBg,
                            filled: true,
                          ),
                        ),
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width*0.80,
                        title: "Submit",
                        // isLoading: authController.isLading.value,
                        onTap: () async {
                          if (_formKey.currentState!.validate()){
                            setState(() {});
                            if (passwordController.text == confirmPasswordController.text){
                              await authController.register(RegistrationRequestModel(
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                phoneNumber: phoneController.text.trim(),
                                emailId: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                is_volunteer: _switchValue,
                              ),false);
                            }
                            else{
                              showToast(message: "Please confirm the password");
                            }
                            setState(() {});
                          }

                        },
                      ),
                    ],
                  ),
                )
            ),
          ),
        )
    );
  }
}