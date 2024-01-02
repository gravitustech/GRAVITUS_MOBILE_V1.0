// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/styles/styles.dart';
import 'package:gravitus_app_v1/textfields/otp_textfield.dart';

class OTPAuth extends StatefulWidget {
  const OTPAuth({Key key}) : super(key: key);

  @override
  State<OTPAuth> createState() => _OTPAuthState();
}

class _OTPAuthState extends State<OTPAuth> {
  TextEditingController _mobileAuthController = TextEditingController();
  TextEditingController _emailAuthController = TextEditingController();
  TextEditingController _googleAuthController = TextEditingController();

  FocusNode _mobileAuthFoucus = FocusNode();
  FocusNode _emailAuthFocus = FocusNode();
  FocusNode _googleAuthFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xff2A6DE6),
          child: Column(
            children: [
              CustomAppbar(
                title: 'Security',
                leadingIcon: 'images/backicon.svg',
                tailingIconEnabled: false,
                leadingIconOnTap: () => Navigator.pop(context),
              ),

              //next
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Color(0xffffffff)),
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(children: [
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('OTP will be sent to 8508275959',
                          style: panheadstyle),
                    ),
                    //next
                    SizedBox(height: 10),
                    OTPTextField(
                      controller: _mobileAuthController,
                      focusNode: _mobileAuthFoucus,
                      nextNode: _emailAuthFocus,
                      textInputType: TextInputType.number,
                      buttonTap: () => {},
                    ),
                    //next
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'OTP will be sent to krishnannavaneetha76@gmail.com',
                          style: panheadstyle),
                    ),
                    //next
                    SizedBox(height: 10),
                    OTPTextField(
                      controller: _emailAuthController,
                      focusNode: _emailAuthFocus,
                      nextNode: _googleAuthFocus,
                      textInputType: TextInputType.number,
                      buttonTap: () => {},
                    ),
                    //next
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Google Authenticator Code',
                          style: panheadstyle),
                    ),
                    //next
                    SizedBox(height: 10),
                    OTPTextField(
                      controller: _googleAuthController,
                      focusNode: _googleAuthFocus,
                      textInputType: TextInputType.number,
                      buttonTap: () => {},
                    ),
                    //next
                    SizedBox(height: 32),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => null));
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff2A6DE6),
                        ),
                      ),
                    ),
                    //next
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/hinticon.svg',
                          color: Color(0xffB1B1B1),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                            child: Text(
                          'Verification code unavailable',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff808080)),
                          textAlign: TextAlign.center,
                        ))
                      ],
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
