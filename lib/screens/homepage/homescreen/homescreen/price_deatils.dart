// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/homescreen/coins.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/homescreen/coins_title.dart';

class PriceDeatils extends StatelessWidget {
  const PriceDeatils({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: MediaQuery.of(context).size.height,
      child: ContainedTabBarView(
          tabs: [
            Text('Top'),
            Text('Gainers'),
            Text('Losers'),
          ],
          tabBarProperties: TabBarProperties(
            labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            // labelColor: Colors.white,
            unselectedLabelColor: Color(0xFFB1B1B1),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              color: Color(0xff2A6DE6),
              borderRadius: BorderRadius.circular(5),
            ),
            indicatorPadding:
                EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 14),
          ),
          views: [
            Column(
              children: [
                CoinsTitle(),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CoinsTrade();
                    }),
              ],
            ),
            Column(
              children: [
                CoinsTitle(),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CoinsTrade();
                    }),
              ],
            ),
            Column(
              children: [
                CoinsTitle(),
                ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CoinsTrade();
                    }),
              ],
            ),
          ]),
    );
  }
}
