// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/styles/styles.dart';

class Pricevolume extends StatefulWidget {
  const Pricevolume({Key key}) : super(key: key);

  @override
  State<Pricevolume> createState() => _PricevolumeState();
}

class _PricevolumeState extends State<Pricevolume> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2A6DE6),
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$52.65352',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0XFFFFFFFF)),
                ),
                SizedBox(height: 10),
                Text(
                  '0.156 %',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF2EBD85)),
                ),
              ],
            ),
            SizedBox(width: 90),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$52.65352',
                  textDirection: TextDirection.rtl,
                  style: marketwatchprice,
                ),
                SizedBox(height: 5),
                Text(
                  '\$0.028',
                  textDirection: TextDirection.rtl,
                  style: marketwatchprice,
                ),
                SizedBox(height: 5),
                Text(
                  '\$0.026',
                  textDirection: TextDirection.rtl,
                  style: marketwatchprice,
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '24h Vol',
                    textDirection: TextDirection.rtl,
                    style: marketwatchtitle,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'High',
                    textDirection: TextDirection.rtl,
                    style: marketwatchtitle,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Low',
                    textDirection: TextDirection.rtl,
                    style: marketwatchtitle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
