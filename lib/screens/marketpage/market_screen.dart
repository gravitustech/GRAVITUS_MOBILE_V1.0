// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/marketpage/market_coins.dart';
import 'package:gravitus_app_v1/screens/marketpage/market_conis_title.dart';
import 'package:gravitus_app_v1/screens/marketpage/marketwatch/marketwatchscreen.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2ptradescreen.dart/p2ptradepage.dart';

class MarketScreen extends StatelessWidget {
  MarketScreen({Key key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            return true;
          },
          child: CustomScrollView(controller: _scrollController, slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    color: Color(0xFF2A6DE6),
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        SvgPicture.asset(
                          'images/egmark.svg',
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Select the pair you want to trade',
                          style: TextStyle(
                            color: Color(0xff8EB6FF),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //next
                  Container(
                    color: Color(0xFF2A6DE6),
                    height: MediaQuery.of(context).size.height,
                    //height: 700,
                    child: ContainedTabBarView(
                        tabs: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text('USDT'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text('INR'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text('P2P'),
                          ),
                        ],
                        tabBarProperties: TabBarProperties(
                          labelStyle: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                          unselectedLabelStyle: TextStyle(fontSize: 16.0),
                          labelColor: Colors.white,
                          unselectedLabelColor: Color(0xFF82AFFF),
                          indicatorColor: Colors.white,
                          indicatorPadding: EdgeInsets.only(top: 40, bottom: 0),
                          indicatorSize: TabBarIndicatorSize.label,
                        ),
                        //next
                        views: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                color: Colors.white),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  MarketCoinsTitle(),
                                  ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return MarketCoin(
                                          icon: 'images/btc.png',
                                          title: 'BTC',
                                          title2: ' / USDT',
                                          volume: '+0.42%',
                                          marketPrice: '19,256',
                                          hvolume: '24H Vol --',
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(CustomPageRoute(
                                              child:
                                                  MarketWatchScreen('BTC/USDT'),
                                              direction: AxisDirection.left,
                                            ));
                                          },
                                        );
                                      }),
                                  MarketCoin(
                                    icon: 'images/bnb.png',
                                    title: 'BNB',
                                    title2: ' / USDT',
                                    volume: '+0.02%',
                                    marketPrice: '524.8',
                                    hvolume: '24H Vol --',
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(CustomPageRoute(
                                        child: MarketWatchScreen('BNB/USDT'),
                                        direction: AxisDirection.left,
                                      ));
                                    },
                                  ),
                                  MarketCoin(
                                    icon: 'images/eth.png',
                                    title: 'ETH',
                                    title2: ' / USDT',
                                    volume: '+1.22%',
                                    marketPrice: '3,744.00',
                                    hvolume: '24H Vol --',
                                    onTap: null,
                                  ),
                                  MarketCoin(
                                    icon: 'images/epx.png',
                                    title: 'EPX',
                                    title2: ' / USDT',
                                    volume: '+0.72%',
                                    marketPrice: '0.0476',
                                    hvolume: '24H Vol --',
                                    onTap: null,
                                  ),
                                  MarketCoin(
                                    icon: 'images/trx.png',
                                    title: 'TRX',
                                    title2: ' / USDT',
                                    volume: '+24.2%',
                                    marketPrice: '0.0678',
                                    hvolume: '24H Vol --',
                                    onTap: null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //next
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                color: Colors.white),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  MarketCoinsTitle(),
                                  ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return MarketCoin(
                                          icon: 'images/epx.png',
                                          title: 'EPX',
                                          title2: ' / INR',
                                          volume: '+10.2%',
                                          marketPrice: '2.68',
                                          hvolume: '24H Vol --',
                                          onTap: null,
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                          //next
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                color: Colors.white),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  MarketCoinsTitle(),
                                  ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return MarketCoin(
                                          icon: 'images/usdt.png',
                                          title: 'USDT',
                                          title2: ' / INR',
                                          volume: '+2.02%',
                                          marketPrice: '86.02',
                                          hvolume: '24H Vol --',
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(CustomPageRoute(
                                              child: P2ptradepage(),
                                              direction: AxisDirection.left,
                                            ));
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         P2ptradepage(),
                                            //   ),
                                            // );
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
