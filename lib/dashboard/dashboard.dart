// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/marketpage/market_screen.dart';
import 'package:gravitus_app_v1/screens/tradepage/tradescreen/trade_screen.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletscreen/wallet_screen.dart';
import '../screens/homepage/homescreen/homescreen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  final tabs = [
    HomeScreen(),
    MarketScreen(),
    TradeScreen('BTC/USDT'),
    WalletScreen(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index; //onTap code
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff2A6DE6), //flutterapp statusbar app
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          tabs[currentIndex],
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: BottomNavigationBar(
              onTap: onTap,
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xffffffff),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: getBottomWidget(),
            ),
          )
        ],
      ),
    );
  }

  //baritem widget
  BottomNavigationBarItem barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset(
          icon,
          height: 20,
          width: 20,
        ),
      ),
      label: label,
    );
  }

  //getBottomWidget widget
  List<BottomNavigationBarItem> getBottomWidget() {
    List<BottomNavigationBarItem> list = [];
    list.add(barItem(
        currentIndex == 0
            ? 'images/dashboardicons/homeactive.svg'
            : 'images/dashboardicons/homeinactive.svg',
        'Home',
        0));
    list.add(barItem(
        currentIndex == 1
            ? 'images/dashboardicons/marketactive.svg'
            : 'images/dashboardicons/marketinactive.svg',
        'Markets',
        1));
    list.add(barItem(
        currentIndex == 2
            ? 'images/dashboardicons/tradeactive.svg'
            : 'images/dashboardicons/tradeinactive.svg',
        'Trades',
        2));
    list.add(barItem(
        currentIndex == 3
            ? 'images/dashboardicons/walletactive.svg'
            : 'images/dashboardicons/walletinactive.svg',
        'Wallets',
        3));

    return list;
  }
}
