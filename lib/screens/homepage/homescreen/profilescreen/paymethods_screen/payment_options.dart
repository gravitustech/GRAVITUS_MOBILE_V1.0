// ignore_for_file: prefer_const_constructors, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentOption extends StatelessWidget {
  Function onTap;
  String leadingIcon;
  Color leadingIconColor;
  String title;
  bool tailOption = true;
  String tailingTitle;
  Color tailingColor;
  String taillingIcon;
  String message;

  PaymentOption({
    Key key,
    this.onTap,
    this.leadingIcon,
    this.title,
    this.tailOption,
    this.tailingTitle,
    this.tailingColor,
    this.taillingIcon,
    this.leadingIconColor,
    this.message,
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
          title: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff808080),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xffB1B1B1),
                    fontWeight: FontWeight.w500,
                  ),
                ), //upi/imps
              ],
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
