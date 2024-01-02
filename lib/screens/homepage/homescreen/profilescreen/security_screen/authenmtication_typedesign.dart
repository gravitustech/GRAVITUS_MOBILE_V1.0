// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, must_be_immutable, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthenticationTypeDesign extends StatefulWidget {
  String leadingIcon;
  Color leadingIconColor;
  String title;
  Function onTap;
  bool switchValue;

  AuthenticationTypeDesign(
    this.leadingIcon,
    this.title, {
    Key key,
    this.leadingIconColor,
    this.onTap,
    this.switchValue = false,
  }) : super(key: key);

  @override
  State<AuthenticationTypeDesign> createState() =>
      _AuthenticationTypeDesignState();
}

class _AuthenticationTypeDesignState extends State<AuthenticationTypeDesign> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -4),
      leading: SvgPicture.asset(
        widget.leadingIcon,
        height: 23,
        width: 65,
      ),
      title: Text(
        widget.title,
        style: TextStyle(
            color: Color(0xff808080),
            fontWeight: FontWeight.bold,
            fontSize: 12),
      ),
      trailing: CupertinoSwitch(
        value: widget.switchValue,
        onChanged: (value) {
          setState(() {
            widget.switchValue = value;
            widget.onTap(value);
            print('-------------------------${value}');
          });
        },
      ),
    );
  }
}
