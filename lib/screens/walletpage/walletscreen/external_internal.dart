// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

class ExternalInternal extends StatelessWidget {
  const ExternalInternal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: Color(0xffFFFFFFF),
      ),
      height: MediaQuery.of(context).size.height * 0.8,
      child: ContainedTabBarView(
          tabs: [
            Text('External'),
            Text('Internal'),
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
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  Image.asset('images/notfound.png'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  Image.asset('images/notfound.png'),
                ],
              ),
            ),
          ]),
    );
  }
}
