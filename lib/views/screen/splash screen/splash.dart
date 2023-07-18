import 'dart:async';
import 'package:zentry/utils/colors.dart';
import 'package:zentry/views/screen/login/login.dart';

import '../../../../utils/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBg,
      body: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                Images.splashLogo,
                alignment: Alignment.center,
              ))),
    );
  }
}