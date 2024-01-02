// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletscreen/individual_coin.dart';

class ListingWidget extends StatefulWidget {
  const ListingWidget({Key key}) : super(key: key);

  @override
  State<ListingWidget> createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(CustomPageRoute(
                    child: IndividualCoinWallet(),
                    direction: AxisDirection.left,
                  ));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => IndividualCoinWallet()));
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Bitcoin',
                            style: TextStyle(
                              color: Color(0xff2F2F2F),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        //next
                        Flexible(
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    '0.00189',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Color(0xff2F2F2F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  )),
                              //next
                              SizedBox(width: 6),
                              Text(
                                'BTC',
                                style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    //next
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Smart chain',
                            style: TextStyle(
                                color: Color(0xff808080), fontSize: 10),
                          ),
                        ),
                        //next
                        Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      '41.07',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff808080),
                                          fontWeight: FontWeight.w700),
                                    ))
                              ],
                            )),
                        SizedBox(width: 2),
                        Text(
                          'USD',
                          style: TextStyle(
                              color: Color(0xffB1B1B1),
                              fontSize: 10,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Positioned(
          child: SvgPicture.asset(
            'images/refershicon.svg',
            height: 15,
            width: 15,
          ),
          top: 10,
          right: 20,
        ),
        Positioned(
          child: Image.asset(
            'images/btc1.png',
            height: 25,
            width: 25,
          ),
          top: 7,
          left: 20,
        ),
      ],
    );
  }
}
