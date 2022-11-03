// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import '../homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? userNameValue = '';
  String? pwValue = '';

  // Search Gg what is GlobalKey, FormState, ScaffoldState
  // ======================================================

  final _storage = const FlutterSecureStorage();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _ScaffoldState = GlobalKey<ScaffoldState>();
  bool _savePassword = true;

  // Read data from saved Storage
  Future<void> _readFromStorage() async {
    userNameTextController.text =
        await _storage.read(key: "KEY_USERNAME") ?? '';
    // the line above equal to lines below:
    // if (await _storage.read(key: "KEY_USERNAME") == null){
    //   userNameTextController.text = '';
    // } else{
    //   userNameTextController.text = await _storage.read(key: "KEY_USERNAME")
    // }
    passwordTextController.text =
        await _storage.read(key: "KEY_PASSWORD") ?? '';
  }

  // Write data into local storage
  _onFormSubmit() async {
    if (_formState.currentState?.validate() == false) {
      if (_savePassword) {
        // process save data into storage
        await _storage.write(
            key: "KEY_USERNAME", value: userNameTextController.text);
        await _storage.write(
            key: "KEY_PASSWORD", value: passwordTextController.text);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
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
                  height: 59,
                  width: 354,
                  decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: userNameTextController,
                      decoration: InputDecoration(
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none,
                          hintText: 'Username'),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                  height: 59,
                  width: 354,
                  decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.remove_red_eye,
                          ),
                        ),
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.lock,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            CheckboxListTile(
                title: Text("Remember me"),
                value: _savePassword,
                onChanged: (value) {
                  setState(() {
                    _savePassword = value ?? false;
                  });
                }),

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
                    if (userNameTextController.text == 'admin' &&
                        passwordTextController.text == 'admin') {
                      if (_savePassword == true){
                        _onFormSubmit();
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    }
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
