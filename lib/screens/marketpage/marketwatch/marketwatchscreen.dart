// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:gravitus_app_v1/screens/marketpage/marketwatch/chart.dart';
import 'package:gravitus_app_v1/screens/marketpage/marketwatch/orderbooktrades_tabbar.dart';
import 'package:gravitus_app_v1/screens/marketpage/marketwatch/pricevol.dart';
import 'package:gravitus_app_v1/screens/tradepage/tradescreen/trade_screen.dart';

class MarketWatchScreen extends StatefulWidget {
  String title;

  MarketWatchScreen(
    this.title,
  );

  @override
  State<MarketWatchScreen> createState() => _MarketWatchScreenState();
}

class _MarketWatchScreenState extends State<MarketWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            leadingWidth: 30,
            title: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0XFFFFFFFF)),
            ),
            backgroundColor: Color(0XFF2A6DE6),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    StarButton(
                      isStarred: false,
                      iconSize: 32,
                      iconColor: Color(0xffFFCA00),
                      iconDisabledColor: Colors.white,
                      valueChanged: null,
                      // valueChanged: (_isStarred) {
                      //   print('Is Starred : $_isStarred');
                      // },
                    ),
                  ],
                ),
              ),
            ],
          ),
          //
          SliverToBoxAdapter(
            child: Pricevolume(),
          ),
          //
          SliverToBoxAdapter(
            child: Chartspace(),
          ),
          //
          SliverToBoxAdapter(
            child: OpenbookTradestabbarView(),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            const SizedBox(height: 55, width: 5),
            SizedBox(
              width: 185,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF2EBD85),
                  ),
                ),
                onPressed: () {
                  //  Navigator.pushNamed(context, '/');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TradeScreen('BTC/USDT')));
                },
                child: Text(
                  'BUY',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50, width: 10),
            SizedBox(
              width: 185,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFFF4343)),
                ),
                onPressed: () {},
                child: Text(
                  'SELL',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
