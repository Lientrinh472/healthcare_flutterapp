import 'dart:math';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final degrees = 90;
    final angle = degrees * pi / 180;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          ),
          leading: const BackButton(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 91),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 80,
                width: 354,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profilepic.png'),
                      backgroundColor: Colors.lightGreen,
                      radius: 30.0,
                    ),
                  ),
                  const Text('David2986',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
              ),
            ),

            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 50,
                width: 354,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(children: [
                  const SizedBox(width: 20),
                  Transform.rotate(
                      angle: angle,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/logouticon.png'))),
                      )),
                  const SizedBox(width: 15),
                  Container(
                    padding: EdgeInsets.all(0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 17),
                        primary: Colors.black,
                      ),
                      child: Text('Log out'),
                      onPressed: () => showBottomsheet(),
                    ),
                  )
                ]),
              ),
            ),

            // Separator from logout session
            SizedBox(height: 7),
            // Begin setting session
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: 100,
                  width: 354,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(children: [
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.all(25),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/settings.png'))),
                        ),
                        const SizedBox(width: 3),
                        Container(
                          padding: EdgeInsets.all(0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 17),
                              primary: Colors.black,
                            ),
                            child: Text('Setting'),
                            onPressed: (() => {}),
                          ),
                        )
                      ]),
                      Container(
                        color: Color.fromARGB(255, 241, 240, 240),
                        height: 1,
                        width: double.infinity,
                      ),
                      Row(children: const [
                        SizedBox(width: 60),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Language',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                          child: Align(
                            child: Text('English',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                        )
                      ]),
                    ],
                  ),
                )),
          ]),
        )));
  }

  void showBottomsheet() => showModalBottomSheet(
    isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 200,
            child: Column(children: [
              Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Center(
                      child: Text('Logout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                )
              ]),
              Container(
                color: Color.fromARGB(255, 241, 240, 240),
                height: 1,
                width: double.infinity,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text('Are you sure you want to log out?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 175,
                    decoration: BoxDecoration(
                      color: Color(0xFFDDFEEC),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 15),
                        primary: Color(0xFF079D49),
                      ),
                      child: Text('Cancel'),
                      onPressed: (() => {}),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 175,
                    decoration: BoxDecoration(
                      color: Color(0xFF079D49),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 15),
                        primary: Color(0xFFFFFFFF),
                      ),
                      child: Text('Yes, Logout'),
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                    ),
                  ),
                ],
              )
            ]),
          )));
}
