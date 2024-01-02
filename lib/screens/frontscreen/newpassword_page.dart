// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'passwordsuccess_page.dart';

class newPassword extends StatefulWidget {
  const newPassword({Key key}) : super(key: key);

  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> {
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
              Padding(
                padding: const EdgeInsets.only(top: 53),
                child: SvgPicture.asset('images/newpassword1.svg'),
              ),
              const SizedBox(
                height: 54,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      "Create",
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
                      "New Password",
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
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  "Please enter your new password below.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF808080),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              //newpassword fieldtext
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: buildnewpassword(),
              ),
              //confirmnew passwored fieldtext
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: buildPassword(),
              ),
              //subbit button
              const SizedBox(
                height: 16,
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
                      child: const Passwordsuccess(),
                      direction: AxisDirection.left,
                    ));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const Passwordsuccess(),
                    // ));
                  },
                  child: Text(
                    'Submit',
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

  Widget buildnewpassword() => Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, bottom: 15),
            labelStyle: TextStyle(
              fontSize: 35,
              decorationColor: Colors.red,
            ),
            hintText: 'New Password',
            hintStyle: TextStyle(
              fontSize: 12,
              color: Color(0xFFB1B1B1),
              fontWeight: FontWeight.w500,
              fontFamily: 'poppins',
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xFF2969DA),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget buildPassword() => Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 20, bottom: 15),
            labelStyle: TextStyle(
              fontSize: 35,
              decorationColor: Colors.red,
            ),
            hintText: 'Confirm a new Password',
            //errorText: 'Password is wrong',
            hintStyle: TextStyle(
              fontSize: 12,
              color: Color(0xFFB1B1B1),
              fontWeight: FontWeight.w500,
              fontFamily: 'poppins',
            ),

            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xFF2969DA),
            ),

            suffixIcon: IconButton(
              icon: isPasswordVisible
                  ? const Icon(
                      Icons.visibility_off,
                      color: Color(0x802969DA),
                    )
                  : const Icon(
                      Icons.visibility,
                      color: Color(0x802969DA),
                    ),
              onPressed: () => setState(() {
                isPasswordVisible = !isPasswordVisible;
              }),
            ),
          ),
          obscureText: isPasswordVisible,
        ),
      );
}
