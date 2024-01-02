// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/tradepage/drawerscreen/drawer_screen.dart';
import 'package:gravitus_app_v1/screens/tradepage/tradescreen/openorderhistory_tabbar.dart';
import 'package:gravitus_app_v1/screens/tradepage/tradescreen/trade_widgets.dart';

class TradeScreen extends StatefulWidget {
  String title;

  TradeScreen(
    this.title,
  );

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: DrawerScreen(),
        body: RefreshIndicator(
          onRefresh: () async {
            return true;
          },
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      child: Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        color: const Color(0xFF2A6DE6),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16,
                            ),
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //next
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    elevation: 0,
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    title: TextButton(
                      onPressed: () {
                        _key.currentState.openDrawer(); //<-- SEE HERE
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'images/titleicon.svg',
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Color(0xff2A6DE6),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 10,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('images/tradegraph.svg'),
                        ),
                      )
                    ],
                  ),
                  //next
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            TradeWidgets(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //next
                  SliverToBoxAdapter(
                    child: TabbarView(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegateTrade extends SliverPersistentHeaderDelegate {
  Widget child;
  BuildContext context;
  SliverDelegateTrade({@required this.context, @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverDelegateTrade oldDelegate) {
    return oldDelegate.maxExtent != 48 ||
        oldDelegate.minExtent != 48 ||
        child != oldDelegate.child;
  }
}
