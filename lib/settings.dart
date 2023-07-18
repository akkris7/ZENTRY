import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentry/controller/contact/contact_controller.dart';
import 'package:zentry/model/model/add_contact_model.dart';
import 'package:zentry/model/response/contact_response.dart';
import 'package:zentry/utils/colors.dart';
import 'package:zentry/views/screen/home/home_screen.dart';
import 'package:zentry/views/widgets/custom_buton.dart';

class Editdetails extends StatefulWidget {
  const Editdetails({Key? key}) : super(key: key);

  @override
  State<Editdetails> createState() => _EditdetailsState();
}

class _EditdetailsState extends State<Editdetails> {

  final ContactController contactController = Get.put(ContactController());
  List<ContactRecords> contactList = <ContactRecords>[];
  TextEditingController phonefirstController = TextEditingController();
  TextEditingController phonesecondController = TextEditingController();
  TextEditingController phonethirdController = TextEditingController();
  TextEditingController phonefourthController = TextEditingController();
  TextEditingController phonefifthController = TextEditingController();
  ContactListResponse? contactListResponse;
  var records = <ContactRecords>[].obs;

  @override
  void initState() {
    super.initState();
    print("Inside Init");
    contactList = [];
    getAndPrefillData();
    print("After init");
  }

  Future<void> getAndPrefillData() async {
    contactListResponse = await contactController.getContact();
    contactList = contactListResponse?.records ?? [];

    if (contactList.isNotEmpty) {
      print("inside if");
      ContactRecords contacts = contactList[0];
      phonefirstController.text = contacts.PhoneNumber1!;
      print(phonefirstController.text);
      phonesecondController.text = contacts.PhoneNumber2!;
      phonethirdController.text = contacts.PhoneNumber3!;
      phonefourthController.text = contacts.PhoneNumber4!;
      phonefifthController.text = contacts.PhoneNumber5!;
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    if (contactController.isLading.value == true){
      Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
        backgroundColor: Color(0xffFFDAD9),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                SingleChildScrollView(  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            color: themeBg,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> Profiledetails())
                                    );
                                  },
                                  child: Icon(Icons.home, size: 44,shadows: [Shadow(color: Colors.black,blurRadius: 5.0)],
                                    color: Color(0xff305D9F),
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text('ZENTRY',
                                  style: TextStyle(
                                    wordSpacing: 10,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                CircleAvatar(
                                  radius: 21,
                                  backgroundImage: AssetImage('assets/pexels-suliman-sallehi-1704488.jpg'),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.contact_mail),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Edit Emergency Contacts",
                                  style: TextStyle(
                                    color: Color(0xff303030),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                margin: const EdgeInsets.only(bottom: 10,top: 10),
                                width: MediaQuery.of(context).size.width*0.80,
                                height: MediaQuery.of(context).size.height*0.070,
                                child: TextField(
                                  controller: phonefirstController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.blue,width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: lightGrey2, width: 2)
                                    ),
                                    hintText: "Phone Number of 1st Person",
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
                                  controller: phonesecondController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.blue,width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: lightGrey2, width: 2)
                                    ),
                                    hintText: "Phone Number of 2nd Person",
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
                                  controller: phonethirdController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.blue,width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: lightGrey2, width: 2)
                                    ),
                                    hintText: "Phone Number of 3rd Person",
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
                                  controller: phonefourthController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.blue,width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: lightGrey2, width: 2)
                                    ),
                                    hintText: "Phone Number of 4th Person",
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
                                  controller: phonefifthController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.blue,width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: lightGrey2, width: 2)
                                    ),
                                    hintText: "Phone Number of 5th Person",
                                    fillColor: themeBg,
                                    filled: true,
                                  ),
                                )
                            ),
                            CustomButton(
                              width: MediaQuery.of(context).size.width*0.80,
                              title: "Submit",
                              // isLoading: authController.isLading.value,
                              onTap: () async {
                                await contactController.saveContact(ContactRequestModel(
                                  firstNumber: phonefirstController.text.trim().isEmpty ? null : phonefirstController.text.trim(),
                                  secondNumber: phonesecondController.text.trim().isEmpty ? null : phonesecondController.text.trim(),
                                  thirdNumber: phonethirdController.text.trim().isEmpty ? null : phonethirdController.text.trim(),
                                  forthNumber: phonefourthController.text.trim().isEmpty ? null : phonefourthController.text.trim(),
                                  fifthNumber: phonefifthController.text.trim().isEmpty ? null : phonefifthController.text.trim(),
                                ));

                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ),
        ),
      );
  }
}
