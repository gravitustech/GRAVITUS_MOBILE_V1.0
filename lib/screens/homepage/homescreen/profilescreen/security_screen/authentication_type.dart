// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/authenmtication_typedesign.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/download_google_suth.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/mobile_auth.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/security_option.dart';

class AuthenticationType extends StatefulWidget {
  String authtype;
  AuthenticationType(this.authtype, {Key key}) : super(key: key);

  @override
  State<AuthenticationType> createState() => _AuthenticationTypeState();
}

class _AuthenticationTypeState extends State<AuthenticationType> {
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
                            text: 'Protect your withdrawls and account with',
                            style: TextStyle(
                                color: Color(0xff76A7FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' ${widget.authtype}. ',
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
                  widget.authtype == 'Google Authentication'
                      ? AuthenticationTypeDesign(
                          'images/google_auth_icon.svg',
                          widget.authtype,
                          onTap: (value) {
                            if (value) {
                              Navigator.of(context).push(CustomPageRoute(
                                child: DownloadGoogleAuth(),
                                direction: AxisDirection.left,
                              ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             DownloadGoogleAuth()));
                            }
                          },
                        )
                      : widget.authtype == 'SMS Authentication'
                          ? AuthenticationTypeDesign(
                              'images/sms_auth_icon.svg',
                              widget.authtype,
                              onTap: (value) {
                                if (value) {
                                  Navigator.of(context).push(CustomPageRoute(
                                    child: MobileAuth(),
                                    direction: AxisDirection.left,
                                  ));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => MobileAuth()));
                                }
                              },
                            )
                          : AuthenticationTypeDesign(
                              'images/emailauth1.svg',
                              widget.authtype,
                              onTap: (value) {
                                if (value) {}
                              },
                              switchValue: true,
                            ),
                  //next
                  SizedBox(height: 10),
                  Divider(
                    color: Color(0xffecebeb),
                  ),
                  //next
                  SizedBox(height: 10),
                  //Text('data'),
                  widget.authtype == 'Google Authentication'
                      ? SecurityOption(
                          leadingIcon: 'images/refersh2.svg',
                          title: 'Reset Google Authenticator',
                          tailOption: false,
                          taillingIcon: 'images/forwardicon.svg',
                        )
                      : SizedBox()
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
