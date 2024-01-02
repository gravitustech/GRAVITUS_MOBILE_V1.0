// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/frontscreen/newpassword_page.dart';

class OtpForgetPassword extends StatefulWidget {
  const OtpForgetPassword({Key key}) : super(key: key);

  @override
  State<OtpForgetPassword> createState() => _OtpForgetPasswordState();
}

class _OtpForgetPasswordState extends State<OtpForgetPassword> {
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
            //   const SizedBox(
            //     width: 130,
            //   ),
            //   SvgPicture.asset('images/smalllogo1.svg'),
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
                child: SvgPicture.asset('images/otp1.svg'),
              ),
              const SizedBox(
                height: 54,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 350,
                    child: Text(
                      "Enter OTP",
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
                  "An 5 digit code has been sent to krishnannavaneetha76@gmail.com",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF808080),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                width: 350,
                child: buildemailotp(),
              ),
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
                      child: const newPassword(),
                      direction: AxisDirection.left,
                    ));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const newPassword(),
                    // ));
                  },
                  child: Text(
                    'Verify OTP',
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

  Widget buildemailotp() => Container(
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
            hintText: 'Enter OTP',
            hintStyle: TextStyle(
              fontSize: 12,
              color: Color(0xFFB1B1B1),
              fontWeight: FontWeight.w500,
              fontFamily: 'poppins',
            ),
            prefixIcon: Icon(
              Icons.password_outlined,
              color: Color(0xFF2969DA),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      );
}
