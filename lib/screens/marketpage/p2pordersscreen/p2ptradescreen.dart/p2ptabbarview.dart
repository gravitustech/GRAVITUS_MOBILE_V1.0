// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2ptradescreen.dart/p2pbuysellcards.dart';

class P2pTabbarView extends StatelessWidget {
  const P2pTabbarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: MediaQuery.of(context).size.height,
      child: ContainedTabBarView(
          tabs: [
            Text('Open Orders'),
            Text('History'),
          ],
          tabBarProperties: const TabBarProperties(
            labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
            labelColor: Color(0xFF2F2F2F),
            unselectedLabelColor: Color(0xFF808080),
            indicatorColor: Color(0xFF5693FF),
            indicatorPadding: EdgeInsets.only(top: 0, bottom: 10),
            indicatorSize: TabBarIndicatorSize.label,
          ),
          views: [
            ListView.builder(
                itemCount: 40,
                shrinkWrap: false,
                // physics: BouncingScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return P2pBuySellCards();
                }),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: false,
                // physics: BouncingScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return P2pBuySellCards();
                }),
          ]),
    );
  }
}
