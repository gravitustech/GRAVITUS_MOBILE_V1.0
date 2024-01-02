// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DepositeCoin extends StatelessWidget {
  Function onTap;
  String title;
  String name;
  String coinTrade;
  String coinTradeValue;
  Color coinTradeColor;
  DepositeCoin({
    this.title,
    this.name,
    this.coinTrade,
    this.coinTradeValue,
    this.onTap,
    this.coinTradeColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff2F2F2F)),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xff2F2F2F)),
                ),
              ],
            ),
          ),
          //next
          SizedBox(height: 6),
          Container(
            margin: EdgeInsets.only(right: 16, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  coinTrade,
                  style: TextStyle(
                      fontSize: 10,
                      color: Color(0xff808080),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  coinTradeValue,
                  style: TextStyle(
                      fontSize: 10,
                      color: coinTradeColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(
            color: Color(0xffecebeb),
          )
        ],
      ),
    );
  }
}
