// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Tradersreport extends StatefulWidget {
  const Tradersreport({Key key, child}) : super(key: key);

  @override
  State<Tradersreport> createState() => _TradersreportState();
}

class _TradersreportState extends State<Tradersreport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        children: [
          Text(
            '17 Jul, 08 : 35 PM',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 80),
          Text(
            '0.052512',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 10,
              color: const Color(0xFF00BBAB),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            '150',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
