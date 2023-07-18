import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:zentry/views/screen/home/home_screen.dart';





class Service extends StatelessWidget {
  const Service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Servicenumbers(),
    );
  }
}

class Servicenumbers extends StatefulWidget {
  const Servicenumbers({Key? key}) : super(key: key);

  @override
  State<Servicenumbers> createState() => _ServicenumbersState();
}

class _ServicenumbersState extends State<Servicenumbers> {
  _callNumber(String number) async{

    await FlutterPhoneDirectCaller.callNumber(number);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFDAD9),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Icon(Icons.home, size: 45,shadows: [Shadow(color: Colors.black,blurRadius: 5.0)],
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
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/pexels-suliman-sallehi-1704488.jpg'),
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.contact_mail),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Emergency Services",
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
              InkWell(
                onTap: () => _callNumber('112'),
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: const BoxDecoration(
                    color: Color(0xffF7F0EE),
                    borderRadius: BorderRadius.vertical( top: Radius.circular(20.0)),
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.call_outlined,
                      size: 40.0,
                      color: Color(0xff303030),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text("Call 112",
                      style: TextStyle(
                        color: Color(0xff303030),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Icon(Icons.navigate_next,
                      size: 40.0,
                      color: Color(0xff303030),

                    ),
                  ],
                ),
                  ),
                ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () => _callNumber('100'),
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F0EE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.local_police_outlined,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Call Police",
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Icon(Icons.navigate_next,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () => _callNumber('101'),
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F0EE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.fire_truck_outlined,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Call Fire Station",
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Icon(Icons.navigate_next,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () => _callNumber('108'),
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F0EE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.medical_services_outlined,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Call Ambulance",
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Icon(Icons.navigate_next,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                    ],

                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              InkWell(
                onTap: () => _callNumber('1091'),
                child: Container(
                  height: 70,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F0EE),
                    borderRadius: BorderRadius.vertical( bottom: Radius.circular(20.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.female_outlined,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Call Women Helpline",
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.navigate_next,
                        size: 40.0,
                        color: Color(0xff303030),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
