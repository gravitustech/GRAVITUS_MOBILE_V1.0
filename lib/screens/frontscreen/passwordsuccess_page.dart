// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/frontscreen/login_page.dart';

class Passwordsuccess extends StatefulWidget {
  const Passwordsuccess({Key key}) : super(key: key);

  @override
  State<Passwordsuccess> createState() => _PasswordsuccessState();
}

class _PasswordsuccessState extends State<Passwordsuccess> {
  String password = "";

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2969DA),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              "Reset Password",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 125.0),
              child: SvgPicture.asset(
                'images/smalllogo1.svg',
              ),
            ),

            // const SizedBox(
            //   width: 130,
            // ),
            // SvgPicture.asset('images/smalllogo1.svg'),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Column(
            children: [
              SizedBox(
                width: 330.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 53),
                child: SvgPicture.asset('images/passwordsuccess1.svg'),
              ),
              const SizedBox(
                height: 54,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      "Password",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xFF2969DA),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      "Reset Successfully",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xFF2969DA),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      "Your password has been successfully reset. Please enter new password while log in.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: const Color(0xFF2969DA),
                    elevation: 0.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(CustomPageRoute(
                      child: const Login(),
                      direction: AxisDirection.left,
                    ));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const Login(),
                    // ));
                  },
                  child: Text(
                    'Okay',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                    ),
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
