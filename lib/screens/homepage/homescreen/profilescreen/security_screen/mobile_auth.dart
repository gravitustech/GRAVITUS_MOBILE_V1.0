// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last, prefer_final_fields, unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/otp_auth.dart';
import 'package:gravitus_app_v1/styles/styles.dart';

class MobileAuth extends StatelessWidget {
  MobileAuth({Key key}) : super(key: key);
  TextEditingController _phoneController = TextEditingController();
  FocusNode _phoneFocus = FocusNode();

  String _countryDialCode = "+91";
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
                    child: Text('Enter Mobile Number', style: panheadstyle),
                  ),
                  //NEXT
                  SizedBox(height: 10),

                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                        color: Color(0xfff5f5f5),
                        border: Border.all(color: Color(0xffB1B1B1)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        // CodePickerWidget(
                        //   onChanged: (CountryCode countryCode) {
                        //     _countryDialCode = countryCode.dialCode;
                        //   },
                        //   initialSelection: _countryDialCode,
                        //   favorite: [_countryDialCode],
                        //   padding: EdgeInsets.zero,
                        //   showDropDownButton: true,
                        //   showFlagMain: false,
                        //   textStyle: TextStyle(color: Color(0xff808080)),
                        // ),
                        Expanded(
                            child: TextField(
                          controller: _phoneController,
                          cursorColor: Color(0xff808080),
                          focusNode: _phoneFocus,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.phone,
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
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
          ]),
        ),
      ),
    );
  }
}
