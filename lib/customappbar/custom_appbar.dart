// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget {
  String title;
  String leadingIcon;
  Function leadingIconOnTap;
  Function tailingIconOnTap;
  String tailingIcon;
  bool tailingIconEnabled;
  CustomAppbar({
    Key key,
    @required this.title,
    this.leadingIcon,
    this.tailingIcon,
    this.tailingIconEnabled = true,
    this.leadingIconOnTap,
    this.tailingIconOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Color(0xff2A6DE6),
      child: Row(
        children: [
          SizedBox(width: 16),
          InkWell(
            child: SvgPicture.asset(leadingIcon),
            onTap: leadingIconOnTap,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
          tailingIconEnabled
              ? InkWell(
                  child: SvgPicture.asset(tailingIcon),
                  onTap: tailingIconOnTap,
                )
              : SizedBox(),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
