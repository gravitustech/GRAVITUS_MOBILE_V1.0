// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoReleasedScreen extends StatelessWidget {
  String icon;
  String message;
  CryptoReleasedScreen({
    this.icon,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon),
          SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(
              height: 1.5,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w700,
              color: Color(0xff2f2f2f),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
