// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, missing_required_param, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DepositCoinAddressBottomSheet extends StatefulWidget {
  String coinAddress = "0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c";
  @override
  State<DepositCoinAddressBottomSheet> createState() =>
      _DepositCoinAddressBottomSheetState();
}

class _DepositCoinAddressBottomSheetState
    extends State<DepositCoinAddressBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.only(right: 10),
      child: Column(children: [
        SizedBox(height: 10),
        SvgPicture.asset('images/closeicon.svg'),
        //next
        SizedBox(height: 15),
        Row(children: [
          Container(
            child: TextButton(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0, top: 16),
                child: Text(
                  'Deposit Bitcoin',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.transparent,
                    decorationColor: Color(0xff2A6DE6),
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -10))
                    ],
                    decoration: TextDecoration.underline,
                    decorationThickness: 4,
                  ),
                ),
              ),
            ),
          ),
          //next
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset('images/shareicon.svg'),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'Share',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(
                          0xffB1B1B1,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ]),
        //next
        SizedBox(height: 31),
        Image.asset(
          'images/qrcode.png',
          height: 144,
          width: 144,
          fit: BoxFit.fill,
        ),
        //next
        SizedBox(
          height: 24,
        ),
        Text(
          'Scan QR',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xffB1B1B1)),
        ),
        //next
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'BTC Address',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff808080),
                  fontSize: 14),
            ),
          ),
        ),
        //next
        SizedBox(height: 14),
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xffF8F8F8),
            border: Border.all(color: Color(0xffB1B1B1)),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                widget.coinAddress,
                style: TextStyle(color: Color(0xff000000), fontSize: 11),
              )),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: SvgPicture.asset('images/copyicon.svg'),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: widget.coinAddress));
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
        //next
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              'images/egicon2.svg',
              color: Color(0xff7C7C7C),
            ),
            SizedBox(
              width: 5,
            ),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Select',
                      style: TextStyle(color: Color(0xff808080), fontSize: 10)),
                  TextSpan(
                      text: '  BTC MAINNET ',
                      style: TextStyle(
                          color: Color(0xff2F2F2F),
                          fontWeight: FontWeight.w700,
                          fontSize: 10)),
                  TextSpan(
                      text: " at sender's wallet",
                      style: TextStyle(color: Color(0xff808080), fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
      ]),
    );
  }
}
