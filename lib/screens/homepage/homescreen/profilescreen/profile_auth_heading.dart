// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profilehead extends StatelessWidget {
  String image;
  String title;
  String tailingIcon;
  Function onTap;

  Profilehead(
    this.image,
    this.title,
    this.tailingIcon,
    this.onTap,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 163,
          height: 43,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: Color(0xff3978EA),
          ),
          child: ListTile(
            visualDensity: VisualDensity(vertical: -4),
            minLeadingWidth: 29,
            leading: SvgPicture.asset(image),
            title: Text(
              title,
              style: TextStyle(
                color: Color(0xffFFFFFFF),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
            trailing: SvgPicture.asset(tailingIcon),
          ),
        ),
      ),
    );
  }
}
