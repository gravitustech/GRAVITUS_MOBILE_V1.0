// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/crypto_releasedscreen.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/lastmesage/last_message.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/yesno_button.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_sellers/message_screen.dart';

class SellerOrder extends StatefulWidget {
  const SellerOrder({Key key}) : super(key: key);

  @override
  State<SellerOrder> createState() => _SellerOrderState();
}

class _SellerOrderState extends State<SellerOrder>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  //condition
  bool wantType = true;
  bool yesType = true;

  void confirm() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: SvgPicture.asset(
              'images/confirmation_icon.svg',
            ),
            title: Text(
              'Hope you have received the payment. Are you sure release Crypto?',
              style: TextStyle(
                  height: 1.5,
                  letterSpacing: 1.0,
                  fontSize: 14,
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 10),
                  YesorNoButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonText: 'No',
                    borderRadiusEnable: true,
                    buttonHeight: 30,
                    buttonColor: null,
                  ),
                  SizedBox(width: 10),
                  YesorNoButton(
                    onTap: () => {
                      Navigator.pop(context),
                      yesType = false,
                      confirm1(),
                    },
                    buttonText: 'Yes',
                    selected: true,
                    borderRadiusEnable: true,
                    buttonColor: Color(0xff2A6DE6),
                    buttonHeight: 30,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          );
        },
      );
    });
  }

  void confirm1() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: SvgPicture.asset(
              'images/success_icon.svg',
            ),
            title: Column(
              children: [
                Text(
                  'Success',
                  style: TextStyle(
                      height: 1.5,
                      letterSpacing: 1.0,
                      fontSize: 14,
                      color: Color(0xff808080),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Crypto released successfully',
                  style: TextStyle(
                    height: 1.5, // the height between text, default is null
                    letterSpacing: 1.0,
                    fontSize:
                        14, // the white space between letter, default is 0.0
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  YesorNoButton(
                    onTap: () => {
                      Navigator.pop(context),
                      yesType = false,
                    },
                    buttonText: 'Okay',
                    selected: true,
                    borderRadiusEnable: true,
                    buttonColor: Color(0xff2A6DE6),
                    buttonHeight: 30,
                  ),
                ],
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xff2A6DE6),
          child: Column(
            children: [
              CustomAppbar(
                title: 'Order Deatils',
                leadingIcon: 'images/backicon.svg',
                leadingIconOnTap: () {
                  Navigator.pop(context);
                },
                tailingIcon: 'images/chaticon.svg',
                tailingIconOnTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MessageScreen()));
                },
              ),
              //next
              Container(
                color: Color(0xff2A6DE6),
                child: LastMessage1(),
              ),
              //next
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('images/countericon.svg'),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '01:00',
                              style: TextStyle(
                                color: Color(0xffB1B1B1),
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Placed on',
                                style: TextStyle(
                                    color: Color(0xffB1B1B1),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 02,
                              ),
                              Text(
                                '07 June, 09:15 Am',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff808080),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                      //next
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Sold',
                              style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                                text: ' 100 TRX ',
                                style: TextStyle(
                                    color: Color(0xff2F2F2F),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: "@5.24 INR Price Per Unit",
                              style: TextStyle(
                                color: Color(0xff808080),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )),
                      ),
                      //next
                      SizedBox(
                        height: 35,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Text(
                            'Amount',
                            style: TextStyle(
                              color: Color(0xff808080),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          trailing: Text(
                            '524.00 INR',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff2F2F2F),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      //next
                      SizedBox(
                        height: 35,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Text(
                            'Buyer ID',
                            style: TextStyle(
                              color: Color(0xff808080),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'images/greendot.svg',
                                height: 8,
                                width: 8,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '1234567',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff2F2F2F),
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      //next

                      yesType != false
                          ? Container(
                              color: Color(0xffffffff),
                              child: Column(children: [
                                Column(children: [
                                  SizedBox(height: 275),
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffF6F6F6)),
                                      child: TextButton(
                                        onPressed: confirm,
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.all(0),
                                        ),
                                        child: Container(
                                          height: 45,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF2969DA),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x0D000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 1),
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(
                                            'Confirm',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                        ),
                                      ))
                                ]),
                              ]),
                            )
                          : CryptoReleasedScreen(
                              icon: 'images/success_icon.svg',
                              message:
                                  'Order executed successfully,\ncrypto released.',
                            ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/helplineicon.svg',
                              width: 30,
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => null)),
                              child: Text(
                                'Support',
                                style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
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
