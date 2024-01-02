// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/wallet_headings.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletscreen/listing_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            return true;
          },
          child: Container(
            color: Color(0xff2A6DE6),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 16),
                  SvgPicture.asset('images/dollarsymbol.svg'),
                  SizedBox(width: 10),
                  const Text(
                    'Total Protfolio',
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              //next
              SizedBox(height: 10),
              Row(
                children: const [
                  SizedBox(width: 16),
                  Text(
                    '1,536.0782',
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'USD',
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              //next
              Padding(
                padding: EdgeInsets.all(20),
                child: WalletHead(),
              ),
              //next
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Color(0xffFFFFFF),
                ),
                child: Row(
                  children: [
                    Container(
                      child: TextButton(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12.0, top: 16),
                          child: Text(
                            'Listings',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.transparent,
                              decorationColor: Colors.blue,
                              shadows: [
                                Shadow(
                                    color: Colors.black, offset: Offset(0, -10))
                              ],
                              decoration: TextDecoration.underline,
                              decorationThickness: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //next
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListingWidget();
                      }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
