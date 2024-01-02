// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class MarketCoin extends StatelessWidget {
  String icon;
  String title;
  String title2;
  String volume;
  String marketPrice;
  String hvolume;
  int page;
  Function onTap;

  MarketCoin(
      {Key key,
      this.icon,
      this.marketPrice,
      this.title,
      this.title2,
      this.volume,
      this.page,
      this.hvolume,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: [
          Image.asset(icon),
          //next
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff2F2F2F),
                          fontWeight: FontWeight.bold)),
                  Text(title2,
                      style: TextStyle(fontSize: 12, color: Color(0xffB1B1B1))),
                ],
              ),
              Text(hvolume,
                  style: TextStyle(fontSize: 10, color: Color(0xff808080))),
            ],
          ),
        ],
      ),
      //next
      trailing: Wrap(
        spacing: 35,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              marketPrice,
              style: TextStyle(fontSize: 14, color: Color(0xff808080)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xff00BBAB),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 1)),
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Text(
                volume,
                style: TextStyle(fontSize: 14, color: Color(0xffFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
