// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/paymentoptions/imps_screen.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/paymentoptions/upi_screen.dart';

class UpiImpstababr extends StatelessWidget {
  const UpiImpstababr({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: 300,
      child: ContainedTabBarView(
          tabs: [
            Text('UPI'),
            Text('IMPS'),
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
            UpiScreen(),
            ImpsScreen(),
          ]),
    );
  }
}
