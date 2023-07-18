import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zentry/controller/authentication/authentication_controller.dart';
import 'package:zentry/model/model/registration_model.dart';
import 'package:zentry/model/response/user_details_response.dart';
import 'package:zentry/utils/constants.dart';
import 'package:zentry/views/widgets/custom_buton.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';



class profilepage extends StatelessWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class profdetails extends StatefulWidget {
  const profdetails({Key? key}) : super(key: key);

  @override
  State<profdetails> createState() => _profdetailsState();
}

class _profdetailsState extends State<profdetails> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _switchValue = false;
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  UserDetailsResponse? userDetailsResponse;
  var records = <ProfileRecord?>[].obs;
  List<ProfileRecord> contactList = <ProfileRecord>[];

  @override
  void initState() {

    super.initState();
    retreivedetails();
  }

  Future<void> retreivedetails() async  {
    userDetailsResponse = await authController.getUserDetails();
    contactList = userDetailsResponse?.details ?? [];
    if(contactList.isNotEmpty){
      ProfileRecord? profile = contactList[0];
      firstNameController.text = profile.firstName!;
      lastNameController.text = profile.lastName!;
      phoneController.text = profile.phoneNumber!;
      emailController.text = profile.emailId!;
      passwordController.text = profile.password!;
      _switchValue = profile.isVolunteer!;
    }

    setState(() {
      
    });
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
                        child: const Text("Edit Profile", style: TextStyle(color: Colors.grey)),
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
                          margin: const EdgeInsets.only(bottom: 10,top: 10),
                          width: MediaQuery.of(context).size.width*0.80,
                          height: MediaQuery.of(context).size.height*0.070,
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.blue,width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: lightGrey2, width: 2)
                              ),
                              hintText: "Phone Number",
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
                            controller: emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.blue,width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: lightGrey2, width: 2)
                              ),
                              hintText: "Email Id",
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
                      Container(
                          margin: const EdgeInsets.only(bottom: 10,top: 10),
                          width: MediaQuery.of(context).size.width*0.80,
                          height: MediaQuery.of(context).size.height*0.070,
                          child: TextField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: Colors.blue,width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: lightGrey2, width: 2)
                              ),
                              hintText: "Confirm Password",
                              fillColor: themeBg,
                              filled: true,
                            ),
                          )
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width*0.80,
                        title: "Save",
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
                                userId: 0,
                              ),true);
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
