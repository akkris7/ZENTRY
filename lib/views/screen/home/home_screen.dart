import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zentry/controller/authentication/authentication_controller.dart';
import 'package:zentry/settings.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'package:zentry/emergecyservice.dart';
import 'package:zentry/views/screen/emergency%20screens/shake_detect_page.dart';
import 'package:zentry/views/screen/login/login.dart';
import 'package:zentry/views/widgets/custom_buton.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profiledetails(),
    );
  }
}

class Profiledetails extends StatefulWidget {
  const Profiledetails({Key? key}) : super(key: key);

  @override
  State<Profiledetails> createState() => _ProfiledetailsState();
}

class _ProfiledetailsState extends State<Profiledetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _shakeCount = 0;
  late AccelerometerEvent _accelerometerValues;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _accelerometerValues = AccelerometerEvent(0, 0, 0);
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
          setState(() {
            _accelerometerValues = event;
          });
        });
    _controller = AnimationController(vsync: this);
  }

  final Uri _url = Uri.parse('https://www.google.com/maps/search/police+station+near+me/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double acceleration = sqrt(pow(_accelerometerValues.x, 2) +
        pow(_accelerometerValues.y, 2) +
        pow(_accelerometerValues.z, 2));
    print(acceleration);
    if (acceleration > 29) {
      _shakeCount += 1;
      if (_shakeCount == 3) {
        _shakeCount = 0;
        Future.delayed(const Duration(milliseconds: 500), () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TimerPage();
            },
          );
        }
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFDAD9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> const Editdetails()),
                      );
                    },
                    child: const Icon(
                      Icons.settings,
                      size: 44,
                      shadows: [Shadow(color: Colors.black, blurRadius: 5.0)],
                      color: Color(0xff305D9F),
                    ),
                  ),
                  const SizedBox(width: 70),
                  const Text(
                    'ZENTRY',
                    style: TextStyle(
                      wordSpacing: 10,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 70),
                  const CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage('assets/pexels-suliman-sallehi-1704488.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F0EE),
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Servicenumbers()),
                          );
                        },
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          height: 70,
                          width: 350,
                          decoration: BoxDecoration(
                            color: const Color(0xffD5E9BA),
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SizedBox(width: 20),
                              Icon(
                                Icons.contact_emergency,
                                size: 40.0,
                                color: Color(0xff303030),
                              ),
                              SizedBox(width: 30),
                              Text(
                                "Emergency service",
                                style: TextStyle(
                                  color: Color(0xff303030),
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => _launchUrl(),
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          height: 70,
                          width: 350,
                          decoration: BoxDecoration(
                            color: const Color(0xffD3E2FF),
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SizedBox(width: 20),
                              Icon(
                                Icons.local_police_outlined,
                                size: 40.0,
                                color: Color(0xff303030),
                              ),
                              SizedBox(width: 30),
                              Text(
                                "Police Stations near me",
                                style: TextStyle(
                                  color: Color(0xff303030),
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => _launchUrl(),
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: const Color(0xff305DA8),
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.timelapse,
                              size: 40.0,
                              color: Color(0xffF7F0EE),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Schedule Safety",
                              style: TextStyle(
                                color: Color(0xffF7F0EE),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> const TimerPage())
                        );
                      },
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: const Color(0xffC5221F),
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.emergency_share,
                              color: Color(0xffF7F0EE),
                              size: 40.0,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Panic Button",
                              style: TextStyle(
                                color: Color(0xffF7F0EE),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width*0.80,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: CustomButton(title: "Logout",
                        onTap: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }),
                                (route) => false,
                          );
                        },
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}





void main() {
  runApp(const Profile());
}
