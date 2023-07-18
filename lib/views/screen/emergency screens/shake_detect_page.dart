import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zentry/controller/media/media_controller.dart';
import 'package:zentry/views/screen/home/home_screen.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class TimerPage extends StatefulWidget {
  final Function? callBack;
  const TimerPage({super.key,
      this.callBack});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  final MediaController mediaController = Get.put(MediaController());
  double percent = 0;
  int timeInSeconds = 30;

  late Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (timeInSeconds > 0) {
          timeInSeconds--;
        } else {
          timer.cancel();
          setState(() {
          });
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context)=> const Profiledetails())
          // );
          takePictureAndNavigate();
        }
      });
    });
  }

  Future<void> takePictureAndNavigate() async {
    // Get the available cameras
    final cameras = await availableCameras();

    // Select the first camera as the default
    final camera = cameras.first;

    // Create a CameraController instance
    final cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.jpeg
    );

    try {
      // Initialize the camera controller
      await cameraController.initialize();

      // Take a picture
      final picture = await cameraController.takePicture();
      await mediaController.saveImage(picture);

      // Process the picture or save it to storage if needed

      // Navigate to the Profiledetails page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Profiledetails()),
      );
    } catch (e) {
      // Handle camera errors
      print('Error taking picture: $e');
    } finally {
      // Dispose the camera controller
      cameraController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFDAD9),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffFFDAD9),
          ),
          width: double.infinity,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Alert! Sending message In",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40.0,
                  ),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: 170,
                  lineWidth: 30,
                  percent: timeInSeconds / 30,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: Colors.red,
                  center: Text(
                    "$timeInSeconds",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 100.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  timer?.cancel();
                  Navigator.pop(context, true);
                },
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color(0xffC5221F),
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.cancel,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
