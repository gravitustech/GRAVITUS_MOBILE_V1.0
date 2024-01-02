// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/styles/styles.dart';

class IndividualOrderContainer extends StatelessWidget {
  String icon;
  String title;
  String message1;
  String message1_value;
  String message2;
  String message2_value;
  Function OnTap;

  IndividualOrderContainer({
    this.icon,
    this.message1,
    this.message1_value,
    this.message2,
    this.message2_value,
    this.title,
    this.OnTap,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: InkWell(
        onTap: OnTap,
        child: Container(
          width: 86,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: Color(0xff4783EF)),
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 90,
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(icon),
                  SizedBox(width: 10),
                  Text(title, style: orderContainer),
                ],
              ),
              //next
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(message1, style: orderContainer),
                  Text(message1_value, style: orderContainer),
                ],
              ),
              //next
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(message2, style: orderContainer),
                  Text(message2_value, style: orderContainer),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
