// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/wallet_headings.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletscreen/external_internal.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletscreen/individual_ordercontainer.dart';

class IndividualCoinWallet extends StatefulWidget {
  const IndividualCoinWallet({Key key}) : super(key: key);

  @override
  State<IndividualCoinWallet> createState() => _IndividualCoinWalletState();
}

class _IndividualCoinWalletState extends State<IndividualCoinWallet> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                leading: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                  ),
                  child: GestureDetector(
                    child: SvgPicture.asset('images/backicon.svg'),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                leadingWidth: 30,
                title: Text(
                  'EPX (Gravitus)',
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                backgroundColor: Color(0xff2A6DE6),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Tron Main',
                          style: TextStyle(
                            color: Color(0xff8EB6FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                        SvgPicture.asset('images/hinticon.svg')
                      ],
                    ),
                  )
                ],
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: IndividualCoinWalletSliverDelegate(
                  context: context,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    color: Color(0xff2A6DE6),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Available balance',
                            style: TextStyle(
                              color: Color(0xffF0F0F0),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        //next
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '2500.00',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 5),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 8,
                              ),
                              child: Text(
                                'Epx',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //next
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              '17.06534',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffffffff),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'USD',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        // SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              //next
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xff2A6DE6),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IndividualOrderContainer(
                            icon: 'images/spoticon.svg',
                            title: 'Spot',
                            message1: 'In Orders',
                            message1_value: '0',
                            message2: 'In Vesting',
                            message2_value: '12.0375',
                            OnTap: null,
                            // OnTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>  (),
                            //     )),
                          ),
                          SizedBox(width: 16),
                          IndividualOrderContainer(
                            icon: 'images/p2picon.svg',
                            title: 'P2P',
                            message1: 'In Listings',
                            message1_value: '46.075',
                            message2: 'In Listings',
                            message2_value: '46.075',
                            // OnTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             )),
                          ),
                        ],
                      ),
                      //next
                      SizedBox(height: 25),
                      WalletHead(),
                      //next
                      SizedBox(height: 25),
                      Row(
                        children: [
                          SvgPicture.asset('images/hinticon.svg'),
                          SizedBox(width: 5),
                          Text(
                            'Last 25 transactions',
                            style: TextStyle(
                                color: Color(0xff8EB6FF),
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              //next
              SliverToBoxAdapter(
                child: Container(
                    color: Color(0xff2A6DE6), child: ExternalInternal()),
              ),
            ],
          )
        ],
      )),
    );
  }
}

class IndividualCoinWalletSliverDelegate
    extends SliverPersistentHeaderDelegate {
  Widget child;
  BuildContext context;
  IndividualCoinWalletSliverDelegate(
      {@required this.context, @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(IndividualCoinWalletSliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 120 ||
        oldDelegate.minExtent != 120 ||
        child != oldDelegate.child;
  }
}
