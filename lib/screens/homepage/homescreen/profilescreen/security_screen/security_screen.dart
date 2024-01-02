// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/authentication_type.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/security_option.dart';

class Securitypage extends StatefulWidget {
  const Securitypage({Key key}) : super(key: key);

  @override
  State<Securitypage> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<Securitypage> {
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
            Container(
              color: Color(0xff2A6DE6),
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          height: 1.5 //You can set your custom height here
                          ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Secure your account by enabling',
                            style: TextStyle(
                                color: Color(0xff76A7FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' 2-Factor Authentication. ',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "Enable minimum two features.",
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
            //NEXT
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
              child: Column(
                children: [
                  SizedBox(height: 16),
                  SecurityOption(
                    leadingIcon: 'images/g_auth_unverified.svg',
                    title: 'Google Authenticator',
                    tailOption: false,
                    taillingIcon: 'images/forwardicon.svg',
                    onTap: () => Navigator.of(context).push(CustomPageRoute(
                      child: AuthenticationType('Google Authentication'),
                      direction: AxisDirection.left,
                    )),
                    //      Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) =>
                    //         AuthenticationType('Google Authentication'))),
                  ),
                  //next
                  SizedBox(height: 10),
                  Divider(
                    color: Color(0xffecebeb),
                  ),
                  //next
                  SizedBox(height: 16),
                  SecurityOption(
                    leadingIcon: 'images/sms_auth_icon.svg',
                    title: 'SMS Authentication',
                    tailOption: false,
                    taillingIcon: 'images/forwardicon.svg',
                    onTap: () => Navigator.of(context).push(CustomPageRoute(
                      child: AuthenticationType('SMS Authentication'),
                      direction: AxisDirection.left,
                    )),

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             AuthenticationType('SMS Authentication'))),
                  ),
                  //next
                  SizedBox(height: 10),
                  Divider(
                    color: Color(0xffecebeb),
                  ),
                  SizedBox(height: 16),
                  SecurityOption(
                    leadingIcon: 'images/email_verified.svg',
                    title: 'Email Authentication',
                    tailOption: false,
                    taillingIcon: 'images/forwardicon.svg',
                    onTap: () => Navigator.of(context).push(CustomPageRoute(
                      child: AuthenticationType('Email Authentication'),
                      direction: AxisDirection.left,
                    )),

                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             AuthenticationType('Email Authentication'))),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Color(0xffecebeb),
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
