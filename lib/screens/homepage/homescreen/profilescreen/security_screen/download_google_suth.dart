// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/google_auth_code.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/security_option.dart';

class DownloadGoogleAuth extends StatefulWidget {
  const DownloadGoogleAuth({Key key}) : super(key: key);

  @override
  State<DownloadGoogleAuth> createState() => _DownloadGoogleAuthState();
}

class _DownloadGoogleAuthState extends State<DownloadGoogleAuth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xff2A6DE6),
          child: Column(children: [
            CustomAppbar(
              title: 'Security',
              leadingIcon: 'images/backicon.svg',
              tailingIconEnabled: false,
              leadingIconOnTap: () => Navigator.pop(context),
            ),
            //next
            Container(
              color: Color(0xff2A6DE6),
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          height: 1.5 //You can set your custom height here
                          ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Link and secure your account with',
                            style: TextStyle(
                                color: Color(0xff76A7FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' Google Authenticator. ',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "Follow the instructions.",
                            style: TextStyle(
                                color: Color(0xff76A7FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
              ),
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
                  SizedBox(height: 16),
                  SecurityOption(
                    leadingIcon: 'images/google_auth_icon.svg',
                    title: 'Download Google Authenticator',
                    tailOption: false,
                    taillingIcon: 'images/forwardicon.svg',
                    onTap: () => Navigator.of(context).push(CustomPageRoute(
                      child: GoogleAuthCode(),
                      direction: AxisDirection.left,
                    )),
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => GoogleAuthCode())),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Color(0xffecebeb),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
