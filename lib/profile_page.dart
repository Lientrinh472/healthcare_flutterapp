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
                  const Text('Log out',
                      style: TextStyle(fontSize: 17, color: Colors.black)),
                ]),
              ),
            ),
          ]),
        )));
  }
}
