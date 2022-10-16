// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose(){
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: userNameTextController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        hintText: 'Username'
                      ),
                    ),
                  )),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  )),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(354, 55),
                    textStyle: TextStyle(fontSize: 16),
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff079D49),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50), // <-- Radius
                    ),
                  ),
                  child: Text('Login'),
                  onPressed: (() {
                    if(userNameTextController.text=='admin' &&passwordTextController.text=='admin'){
                    Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => const SecondRoute()),
                    );
                    }
                    // if user name && password  = true
                    // then login to other page
                    // else
                    // Do nothing or show something to user that notifi the username and password not right
                  }),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
