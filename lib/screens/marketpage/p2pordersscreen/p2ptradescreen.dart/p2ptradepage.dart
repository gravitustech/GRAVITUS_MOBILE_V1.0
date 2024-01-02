// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2ptradescreen.dart/p2ptabbarview.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2ptradescreen.dart/p2ptradewidget.dart';

class P2ptradepage extends StatefulWidget {
  const P2ptradepage({Key key}) : super(key: key);

  @override
  State<P2ptradepage> createState() => _P2ptradepageState();
}

class _P2ptradepageState extends State<P2ptradepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            leadingWidth: 30,
            title: Text(
              'Peer 2 Peer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Color(0xff2A6DE6),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xff2A6DE6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Color(0xffFFFFFF),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    P2PTradeWidgets(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: P2pTabbarView(),
          ),
        ]),
      ),
    );
  }
}
