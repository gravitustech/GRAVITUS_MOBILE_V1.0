// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetails extends StatelessWidget {
  String title;
  String value;

  PaymentDetails({
    @required this.title,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity(vertical: -3),
      leading: Text(
        title,
        style: TextStyle(
            color: Color(0xff808080),
            fontSize: 10,
            fontWeight: FontWeight.w700),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
                color: Color(0xff2F2F2F),
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            child: SvgPicture.asset('images/copyicon.svg'),
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Copied",
                  textAlign: TextAlign.center,
                ),
              ));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
