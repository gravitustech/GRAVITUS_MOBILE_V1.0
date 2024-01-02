// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gravitus_app_v1/screens/tradepage/drawerscreen/drawer_coins.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: ListView(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              SvgPicture.asset(
                'images/egmark.svg',
                color: Color(0xff76A7FF),
              ),
              SizedBox(width: 6),
              Text(
                'Select the pair you want to trade',
                style: TextStyle(
                  color: Color(0xff8EB6FF),
                  fontSize: 12,
                ),
              )
            ],
          ),
          //next
          ListTile(
            visualDensity: VisualDensity(horizontal: -3),
            leading: Padding(
              padding: EdgeInsets.only(left: 2),
              child: Text(
                'Name',
                style: TextStyle(
                    color: Color(0xffB1B1B1),
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            trailing: Text(
              'Market Price/Change%',
              style: TextStyle(
                  color: Color(0xffB1B1B1),
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
          //next
          ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return DrawerCoins(
                  title: 'BTC/USDT',
                  name: '19.828.73',
                  coinTrade: 'Bitcoin',
                  coinTradeValue: '-4.91%',
                  coinTradeColor: Color(0xffFF4343),
                );
              }),

          DrawerCoins(
            title: 'BNB/USDT',
            name: '524.87',
            coinTrade: 'Binance',
            coinTradeValue: '-0.02%',
            coinTradeColor: Color(0xffFF4343),
          ),

          DrawerCoins(
            title: 'ETH/USDT',
            name: '3,744.00',
            coinTrade: 'Ethereum',
            coinTradeValue: '+0.002%',
            coinTradeColor: Color(0xff2EBD85),
          ),

          DrawerCoins(
            title: 'EPX/USDT',
            name: '0.0476',
            coinTrade: 'Gravitus',
            coinTradeValue: '+1.23%',
            coinTradeColor: Color(0xff2EBD85),
          ),

          DrawerCoins(
            title: 'TRX/USDT',
            name: '0.0678',
            coinTrade: 'Tron',
            coinTradeValue: '-3.67%',
            coinTradeColor: Color(0xffFF4343),
          ),
        ],
      ),
    );
  }
}
