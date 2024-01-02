// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/otp_auth.dart';

class GoogleAuthCode extends StatelessWidget {
  const GoogleAuthCode({Key key}) : super(key: key);

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
                            text: 'Save your',
                            style: TextStyle(
                                color: Color(0xff76A7FF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' Google Secret key ',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text:
                                "in paper. This key will allow you to restore your account incase of phone lost.",
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
                  SizedBox(height: 20),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xffF8F8F8),
                      border: Border.all(color: Color(0xffb1b1b1)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                            child: Text(
                          'GNZGQSZ70J2CCKRI',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )),
                        SizedBox(width: 10),
                        InkWell(
                          child: SvgPicture.asset('images/copyicon.svg'),
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: 'GNZGQSZ70J2CCKRI'));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Copied",
                                textAlign: TextAlign.center,
                              ),
                            ));
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(CustomPageRoute(
                          child: OTPAuth(),
                          direction: AxisDirection.left,
                        ));
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => OTPAuth()));
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
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
