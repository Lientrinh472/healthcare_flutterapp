// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  //   late Box box1;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   createOpenBox();
  // }
  // void createOpenBox()async{
  //   box1 = await Hive.openBox('logindata');
  //   getdata();
  // }
  // void getdata()async{
  //   if(box1.get('email')!=null){
  //     email.text = box1.get('email');
  //     isChecked = true;
  //     setState(() {
  //     });
  //   }
  //   if(box1.get('pass')!=null){
  //     pass.text = box1.get('pass');
  //     isChecked = true;
  //     setState(() {
  //     });
  //   }
  // }
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
            // Text(
            //   'Hello Nghia',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 24,
            //   )
            //   ),
            // SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
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
                        hintText: 'Username',
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Remember Me",
                  style: TextStyle(color: Colors.black),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    isChecked = value!;
                    setState(() {});
                  },
                ),
              ],
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
                  }),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
  // void login(){
  //   if(isChecked){
  //     box1.put('email', email.value.text);
  //     box1.put('pass', pass.value.text);
  //   }
  // }
}
