// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:zentry/home.dart';
// import 'package:zentry/main.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// final FirebaseAuth _auth = FirebaseAuth.instance;
// class Register extends StatelessWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Reg(),
//     );
//   }
// }
// class Reg extends StatefulWidget {
//   const Reg({Key? key}) : super(key: key);
//
//   @override
//
//   State<Reg> createState() => _RegState();
// }
//
// class _RegState extends State<Reg> {
//
//   final TextEditingController _emailController=TextEditingController();
//   final TextEditingController _passwordController=TextEditingController();
//   late bool _sucess;
//   late String _userEmail;
//   void _register() async {
//     final User? user = (
//         await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)
//     ).user;
//
//     if(user != null) {
//       setState(() {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context)=> Profiledetails())
//         );
//       });
//     } else {
//       setState(() {
//         Alert(
//             context: context,
//             title: "Alert",
//             desc: "invalid credentials").show();
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffFFDAD9),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 110,
//               ),
//               SizedBox(
//                 height: 100,
//                 width: 150,
//                 child: Image(image: AssetImage('assets/clipart2712790.png')
//                 ),
//               ),
//               Text('ZENTRY',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.normal,
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text('Register',
//                 style: TextStyle(
//                   color: Colors.black26,
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 310,
//                 child: TextField(
//                   //controller: widget._weightController,
//                   decoration: InputDecoration(
//                     fillColor: Color(0xffFFDAD9),
//                     filled: true,
//                     labelText: 'First Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 310,
//                 child: TextField(
//                   decoration: InputDecoration(
//                     fillColor: Color(0xffFFDAD9),
//                     filled: true,
//                     labelText: 'Last Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 310,
//                 child: TextField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     fillColor: Color(0xffFFDAD9),
//                     filled: true,
//                     labelText: 'Email Address',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 310,
//                 child: TextField(
//                   controller: _passwordController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     labelText: 'Create Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 310,
//                 child: TextField(
//                   // controller: widget._weightController,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Column(
//                 children: [
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0),
//                             side: BorderSide(color: Colors.blue)
//                         ),
//                       ),
//                     ),
//                     onPressed: (
//                         ){
//                       _register();
//                     },
//                     child: SizedBox(
//                       height: 50,
//                       width: 260,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Register',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20,
//
//                             ),),
//                         ],
//                       ),
//                     ),
//
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
