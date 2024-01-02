// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/screens/marketpage/marketwatch/radiobutton.dart';
import 'package:gravitus_app_v1/styles/styles.dart';

class Chartspace extends StatefulWidget {
  const Chartspace({Key key}) : super(key: key);

  @override
  State<Chartspace> createState() => _ChartspaceState();
}

class _ChartspaceState extends State<Chartspace> {
  bool pressed = true;
  bool smapressed = true;
  bool emapressed = true;
  bool volpressed = true;
  bool macdpressed = true;
  bool rsipressed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2A6DE6),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Color(0xffffffff),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(children: [
            RadioButton(),
            SizedBox(height: 400),
            // Container(
            //   color: Color.fromARGB(255, 217, 24, 24),
            //   width: 430,
            //   height: 400,
            //   child: Text('data'),
            // ),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      smapressed = !smapressed;
                    });
                  },
                  child: Text('SMA',
                      style:
                          smapressed ? marketwatchchange1 : marketwatchchange2),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      emapressed = !emapressed;
                    });
                  },
                  child: Text('EMA',
                      style:
                          emapressed ? marketwatchchange2 : marketwatchchange1),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      volpressed = !volpressed;
                    });
                  },
                  child: Text('VOL',
                      style:
                          volpressed ? marketwatchchange2 : marketwatchchange1),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      macdpressed = !macdpressed;
                    });
                  },
                  child: Text('MACD',
                      style: macdpressed
                          ? marketwatchchange2
                          : marketwatchchange1),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      rsipressed = !rsipressed;
                    });
                  },
                  child: Text('RSI',
                      style:
                          rsipressed ? marketwatchchange2 : marketwatchchange1),
                ),
              ],
            ),
          ])),
    );
  }
}
