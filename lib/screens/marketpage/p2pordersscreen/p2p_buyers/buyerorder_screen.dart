// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields, unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/customappbar/custom_appbar.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/crypto_releasedscreen.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/lastmesage/last_message.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/paymentoptions/paymentInfo_screen.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/yesno_button.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_sellers/message_screen.dart';
import 'package:gravitus_app_v1/textfields/validator.dart';
import 'package:gravitus_app_v1/textfields/withdraw_textfield.dart';

class BuyorderDeatils extends StatefulWidget {
  const BuyorderDeatils({Key key}) : super(key: key);
  @override
  State<BuyorderDeatils> createState() => _BuyorderDeatilsState();
}

class _BuyorderDeatilsState extends State<BuyorderDeatils> {
  //condition
  bool wantType = true;

  //error string
  String utrError = '';

  //Textfield
  TextEditingController _utr_controller = TextEditingController();
  FocusNode _utr_node = FocusNode();

  //button
  _showButton() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        )),
        builder: (BuildContext context) {
          return PaymentInfo1();
        }).whenComplete(() => {});
  }

  //onpressedbutton validator & dialogbox
  Future UtrNumber() async {
    if (!Validator.Utrerror(_utr_controller.text)) {
      setState(() {
        utrError = '*Enter UTR Number';
      });
    } else {
      setState(() {
        utrError = '';
      });
      confirm();
    }
  }

  //dialogbox
  void confirm() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              icon: SvgPicture.asset(
                'images/confirmation_icon.svg',
              ),
              title: Text(
                'Do you want to Proceed?',
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
                      onTap: () {
                        setState(() {
                          wantType = false;
                          Navigator.pop(context);
                        });
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
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Color(0xff2A6DE6),
          child: Column(
            children: [
              CustomAppbar(
                title: 'Order Details',
                leadingIcon: 'images/backicon.svg',
                leadingIconOnTap: () {
                  Navigator.pop(context);
                },
                tailingIcon: 'images/chaticon.svg',
                tailingIconOnTap: () {
                  Navigator.of(context).push(CustomPageRoute(
                    child: MessageScreen(),
                    direction: AxisDirection.left,
                  ));
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MessageScreen()));
                },
              ),
              //next
              Container(
                color: Color(0xff2A6DE6),
                child: LastMessage1(),
              ),
              SizedBox(height: 16),
              //next
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
                              text: 'Bought',
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
                            'Seller ID',
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
                      wantType != false
                          ? Container(
                              color: Color(0xffffffff),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 25),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xffF6F6F6)),
                                        child: InkWell(
                                          onTap: () => _showButton(),
                                          child: ListTile(
                                            visualDensity:
                                                VisualDensity(vertical: -2),
                                            contentPadding: EdgeInsets.zero,
                                            tileColor: Color(0xffF6F6F6),
                                            leading: SvgPicture.asset(
                                              'images/paymethoicon.svg',
                                              color: Color(0xff76A7FF),
                                            ),
                                            title: Text(
                                              'Choose Payment Options',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff808080),
                                              ),
                                            ),
                                            trailing: SvgPicture.asset(
                                              'images/forwardicon.svg',
                                              color: Color(0xff76A7FF),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //next
                                      SizedBox(height: 25),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Enter UTR No.',
                                          style: TextStyle(
                                              color: Color(0xff2F2F2F),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12),
                                        ),
                                      ),
                                      //NEXT
                                      SizedBox(
                                        height: 10,
                                      ),
                                      WithdrawTextField(
                                        controller: _utr_controller,
                                        nextNode: _utr_node,
                                        textInputType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        hintText: 'Enter the UTR Number',
                                      ),
                                      const SizedBox(height: 5),
                                      buildemailerror(),
                                    ],
                                  ),
                                  SizedBox(height: 97),
                                  TextButton(
                                    onPressed: UtrNumber,
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                    ),
                                    child: Container(
                                      height: 45,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF2969DA),
                                          boxShadow: const [
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
                                  ),
                                ],
                              ),
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
                      SizedBox(
                        height: 25,
                      ),
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

  Widget buildemailerror() => Container(
        margin: EdgeInsets.only(right: 15),
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              utrError,
              style: const TextStyle(color: Colors.red, fontSize: 10),
              textAlign: TextAlign.end,
            )),
      );
}
