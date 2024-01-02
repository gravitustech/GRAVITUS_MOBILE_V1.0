// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key key}) : super(key: key);
  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int value = 0;
  Widget CustomRadioButton(String text, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          value = index;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 4, // space between underline and text
            ),
            decoration: (value == index)
                ? BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                    color: Colors.blue, // Text colour here
                    width: 3.0, // Underline width
                  )))
                : BoxDecoration(),
            child: InkWell(
              onTap: null,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight:
                      (value == index) ? FontWeight.w700 : FontWeight.w700,
                  fontSize: (value == index) ? 14 : 12,
                  color:
                      (value == index) ? Color(0xff2F2F2F) : Color(0xff808080),
                  // decorationColor:
                  //     (value == index) ? Colors.blue : Color(0xffffffff),
                  // decoration: TextDecoration.underline,
                  // decorationThickness: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomRadioButton("1m", 0),
          CustomRadioButton("15m", 1),
          CustomRadioButton("30m", 2),
          CustomRadioButton("1h", 3),
          CustomRadioButton("1d", 4),
        ],
      ),
    );
  }
}
