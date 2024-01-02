// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/screens/marketpage/marketwatch/tradersreport.dart';
import 'package:gravitus_app_v1/styles/styles.dart';

class OpenbookTradestabbarView extends StatelessWidget {
  const OpenbookTradestabbarView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      height: MediaQuery.of(context).size.height,
      child: ContainedTabBarView(
          tabs: [
            Text('Order book'),
            Text('Trades'),
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
            Column(children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Qty', style: qtyprice),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130.0),
                    child: Text('Price', style: qtyprice),
                  ),
                  SizedBox(width: 15),
                  Flexible(
                      fit: FlexFit.tight,
                      child: Text('Price', style: qtyprice)),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Text('Qty', style: qtyprice),
                  ),
                ],
              ),
              //
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [
                            0.3, // percentage value 0.5 = 50%
                            0.01,
                          ],
                          colors: [
                            // the color you need to fill,
                            Colors.white,
                            Color(0x2600BBAB), //container base color
                          ],
                        ),
                      ),
                      height: 24,
                      child: Row(
                        children: const [
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 130),
                          Text(
                            '0.001',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF00BBAB),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [
                            0.3, // percentage value 0.5 = 50%
                            0.01,
                          ],
                          colors: [
                            // the color you need to fill,
                            Colors.white,
                            Color(0x26FF5E3B), //container base color
                          ],
                        ),
                      ),
                      height: 24,
                      child: Row(
                        children: [
                          Text(
                            '0.0012',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFFFF5E3B),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 125),
                          Text(
                            '100',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            //

            ListView.builder(
                itemCount: 1,
                shrinkWrap: false,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Time', style: qtyprice),
                            Text('Price',
                                textDirection: TextDirection.rtl,
                                style: qtyprice),
                            Text('Quanity', style: qtyprice),
                          ],
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Tradersreport(),
                      ),
                    ],
                  );
                }),
          ]),
    );
  }
}
