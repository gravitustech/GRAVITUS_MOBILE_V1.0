// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/homescreen/banner_screen.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/homescreen/home_categories.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/homescreen/price_deatils.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/notificationscreen/notification_screen.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2A6DE6),
        body: RefreshIndicator(
          onRefresh: () async {
            return true;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                foregroundColor: Color(0xFF2A6DE6),
                pinned: true,
                floating: true,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                leading: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: SvgPicture.asset(
                    'images/labellogo.svg',
                    // height: 22,
                    // width: 20,
                  ),
                ),
                leadingWidth: 46,
                backgroundColor: Color(0xFF2A6DE6),
                actions: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(CustomPageRoute(
                              child: ProfileScreen(),
                              direction: AxisDirection.left,
                            ));
                          },
                          icon: SvgPicture.asset(
                            'images/profileicon1.svg',
                            // width: 28,
                          )),
                      Positioned(
                          top: 15,
                          right: 30,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 2, bottom: 2),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF7C7C7C),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                              ),
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 16, right: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute(
                          child: NotificationScreen(),
                          direction: AxisDirection.left,
                        ));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NotificationScreen()));
                      },
                      child: Row(
                        children: [
                          Stack(children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xFF2A6DE6),
                              child: ClipOval(
                                  child: SvgPicture.asset(
                                'images/bell.svg',
                              )),
                            ),
                            //logic code
                            Positioned(
                              right: 10,
                              bottom: 19,
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: Color(0xffFF4343),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //next
              SliverPersistentHeader(
                  pinned: false,
                  floating: false,
                  delegate: SliverDelegate(
                    context: context,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      color: Color(0xff2A6DE6),
                      alignment: Alignment.center,
                      child: BannersScreen(),
                    ),
                  )),
              //next
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                  context: context,
                  child: Container(
                    color: Color(0xff2A6DE6),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Color(0xffFFFFFF),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          HomeCategories(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //next
              SliverToBoxAdapter(
                child: PriceDeatils(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  BuildContext context;
  SliverDelegate({@required this.context, @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => MediaQuery.of(context).size.width * 0.5;

  @override
  double get minExtent => MediaQuery.of(context).size.width * 0.5;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != MediaQuery.of(context).size.width * 0.5 ||
        oldDelegate.minExtent != MediaQuery.of(context).size.width * 0.5 ||
        child != oldDelegate.child;
  }
}
