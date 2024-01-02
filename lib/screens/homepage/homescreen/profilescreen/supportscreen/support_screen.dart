// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/supportscreen/create_screen.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            return true;
          },
          child: Stack(
            children: [
              CustomScrollView(controller: _scrollController, slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 25.0),
                          color: Color(0xFF2A6DE6),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                child: SvgPicture.asset('images/backicon.svg'),
                                onTap: () => Navigator.pop(context),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Support',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0),
                          color: Color(0xFF2A6DE6),
                          // height: MediaQuery.of(context).size.height * 0.1,
                          height: 697,
                          child: ContainedTabBarView(
                              tabs: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text('Create'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text('History'),
                                ),
                              ],
                              tabBarProperties: TabBarProperties(
                                labelStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700),
                                unselectedLabelStyle: TextStyle(fontSize: 14.0),
                                labelColor: Colors.white,
                                unselectedLabelColor: Color(0xFF82AFFF),
                                indicatorColor: Colors.white,
                                indicatorPadding:
                                    EdgeInsets.only(top: 40, bottom: 0),
                                indicatorSize: TabBarIndicatorSize.label,
                              ),
                              views: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      color: Colors.white),
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: SingleChildScrollView(
                                    child: CreateScreen(),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      color: Colors.white),
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: SingleChildScrollView(),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
