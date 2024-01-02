// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileOption extends StatelessWidget {
  Function onTap;
  String leadingIcon;
  Color leadingIconColor;
  String title;
  bool tailOption = true;
  String tailingTitle;
  Color tailingColor;
  String taillingIcon;

  ProfileOption({
    Key key,
    this.onTap,
    this.leadingIcon,
    this.title,
    this.tailOption,
    this.tailingTitle,
    this.tailingColor,
    this.taillingIcon,
    this.leadingIconColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
          visualDensity: VisualDensity(vertical: -4),
          leading: SvgPicture.asset(
            leadingIcon,
            color: leadingIconColor,
          ),
          //next
          title: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff808080),
              fontWeight: FontWeight.w700,
            ),
          ),
          //next
          trailing: tailOption
              ? Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: Color(0xffF8F8F8),
                  ),
                  child: Text(
                    tailingTitle,
                    style: TextStyle(
                        color: tailingColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                )
              : SvgPicture.asset(taillingIcon)),
    );
  }
}
