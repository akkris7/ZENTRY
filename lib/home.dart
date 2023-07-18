//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:zentry/settings.dart';
//
// import 'package:sensors_plus/sensors_plus.dart';
//
// import 'package:zentry/emergecyservice.dart';
//
// import 'views/screen/emergency screens/shake_detect_page.dart';
//
// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Profiledetails(),
//
//     );
//   }
// }
// class Profiledetails extends StatefulWidget {
//   const Profiledetails({Key? key}) : super(key: key);
//
//   @override
//   State<Profiledetails> createState() => _ProfiledetailsState();
// }
//
// class _ProfiledetailsState extends State<Profiledetails> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   int _shakeCount = 0;
//   late AccelerometerEvent _accelerometerValues;
//
//
//   @override
//   void initState() {
//     super.initState();
//     accelerometerEvents.listen((AccelerometerEvent event) {
//       setState(() {
//         _accelerometerValues = event;
//       });
//     });
//     _controller = AnimationController(vsync: this);
//   }
//
//
//   final Uri _url = Uri.parse('https://www.google.com/maps/search/police+station+near+me/');
//   Future<void> _launchUrl() async {
//     if (!await launchUrl(_url)) {
//       throw Exception('Could not launch $_url');
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double acceleration = sqrt(pow(_accelerometerValues.x, 2) +
//         pow(_accelerometerValues.y, 2) +
//         pow(_accelerometerValues.z, 2));
//     print(acceleration);
//     if (acceleration > 29) {
//       _shakeCount += 1;
//       if (_shakeCount == 3) {
//         _shakeCount = 0;
//         Future.delayed(const Duration(milliseconds: 500), () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return pomodoro();
//             },
//           );
//         }
//         );
//       }
//     }
//
//     return Scaffold(
//       backgroundColor: Color(0xffFFDAD9),
//       body:
//       SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 15,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context)=> Editdetails())
//                       );
//                     },
//                     child: Icon(Icons.settings, size: 44,shadows: [Shadow(color: Colors.black,blurRadius: 5.0)],
//                       color: Color(0xff305D9F),
//
//                     ),
//                   ),
//                   SizedBox(
//                     width: 70,
//                   ),
//                   Text('ZENTRY',
//                     style: TextStyle(
//                       wordSpacing: 10,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                       fontStyle: FontStyle.normal,
//                       fontSize: 20,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 70,
//                   ),
//                   CircleAvatar(
//                     radius: 21,
//                     backgroundImage: AssetImage('assets/pexels-suliman-sallehi-1704488.jpg'),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 370,
//                 width: 390,
//                 decoration: BoxDecoration(
//                   color: Color(0xffF7F0EE),
//                   borderRadius: BorderRadius.circular(36.0),
//                 ),
//                 child: Column(
//
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     InkWell(
//                       onTap: ()  {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context)=> Servicenumbers())
//                         );
//                       },
//                       borderRadius: BorderRadius.circular(50.0),
//                       child: Container(
//                         height: 70,
//                         width: 350,
//                         decoration: BoxDecoration(
//                           color: Color(0xffD5E9BA),
//                           borderRadius: BorderRadius.circular(22.0),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Icon(Icons.contact_emergency,
//                               size: 40.0,
//                               color: Color(0xff303030),
//                             ),
//                             SizedBox(
//                               width: 30,
//                             ),
//                             Text("Emergency service",
//                               style: TextStyle(
//                                 color: Color(0xff303030),
//                                 fontWeight: FontWeight.bold,
//                                 fontStyle: FontStyle.normal,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     InkWell(
//                       onTap: () => _launchUrl(),
//                       borderRadius: BorderRadius.circular(50.0),
//                       child: Container(
//                         height: 70,
//                         width: 350,
//                         decoration: BoxDecoration(
//                           color: Color(0xffD3E2FF),
//                           borderRadius: BorderRadius.circular(22.0),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Icon(Icons.local_police_outlined,
//                               size: 40.0,
//                               color: Color(0xff303030),
//                             ),
//                             SizedBox(
//                               width: 30,
//                             ),
//                             Text("Police Stations near me",
//                               style: TextStyle(
//                                 color: Color(0xff303030),
//                                 fontWeight: FontWeight.bold,
//                                 fontStyle: FontStyle.normal,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     borderRadius: BorderRadius.circular(50.0),
//                     child: Container(
//                       height: 150,
//                       width: 180,
//                       decoration: BoxDecoration(
//                         color: Color(0xff305DA8),
//                         borderRadius: BorderRadius.circular(36.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(Icons.timelapse,
//                             size: 40.0,
//                             color: Color(0xffF7F0EE),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text("Shadule Saftey",
//                             style: TextStyle(
//                               color: Color(0xffF7F0EE),
//                               fontWeight: FontWeight.bold,
//                               fontStyle: FontStyle.normal,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context)=> TimerPage())
//                       );
//                     },
//                     borderRadius: BorderRadius.circular(30.0),
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 150,
//                       width: 180,
//                       decoration: BoxDecoration(
//                         color: Color(0xffC5221F),
//                         borderRadius: BorderRadius.circular(36.0),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Icon(Icons.emergency_share,
//                             color: Color(0xffF7F0EE),
//                             size: 40.0,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text("Panic Button",
//                             style: TextStyle(
//                               color: Color(0xffF7F0EE),
//                               fontWeight: FontWeight.bold,
//                               fontStyle: FontStyle.normal,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }