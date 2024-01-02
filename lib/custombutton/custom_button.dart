// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final bool isBuy;

  CustomButton({
    this.onTap,
    @required this.buttonText,
    this.isBuy = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
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
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w600,
            fontFamily: 'poppins',
          ),
        ),
      ),
    );
  }
}
