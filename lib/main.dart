import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zentry/utils/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zentry/views/screen/splash%20screen/splash.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Zentry',
          theme: AppTheme.appTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
