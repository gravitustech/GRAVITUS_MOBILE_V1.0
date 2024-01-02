// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinsTrade extends StatelessWidget {
  const CoinsTrade({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //tileColor: Colors.black,
      title: Row(
        children: [
          SvgPicture.asset(
            'images/btc.svg',
          ),
          SizedBox(
            width: 10,
          ),
          Text('Bitcoin',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff000000),
              )),
        ],
      ),
      trailing: Wrap(
        spacing: 35,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '19,828.73',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff808080),
              ),
            ),
          ),
          Container(
            //logic code
            decoration: BoxDecoration(
                color: Color(0xff00BBAB),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 1)), // changes position of shadow
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Text(
                //logic code
                '+0.02%',
                style: TextStyle(fontSize: 14, color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
