// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/walletpage/walletheading/depositscreen/deposit_coins.dart';

class DepositeBottomSheet extends StatefulWidget {
  Function onTap;
  DepositeBottomSheet({this.onTap});
  @override
  State<DepositeBottomSheet> createState() => _DepositeBottomSheetState();
}

class _DepositeBottomSheetState extends State<DepositeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        SizedBox(height: 10),
        SvgPicture.asset('images/closeicon.svg'),
        //next
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 16),
            SvgPicture.asset('images/egicon.svg'),
            SizedBox(width: 6),
            Text(
              'Select the coin to deposit',
              style: TextStyle(color: Color(0xff76A7FF), fontSize: 12),
            ),
          ],
        ),
        //next
        SizedBox(height: 10),
        Divider(
          color: Color(0xffecebeb),
        ),
        //next
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return DepositeCoin(
                onTap: widget.onTap,
                title: 'BitCoin',
                name: 'Smart Chain',
                coinTrade: 'BTC',
                coinTradeValue: 'Network Info',
                coinTradeColor: Color(0xff808080),
              );
            }),
          ),
        ),
      ]),
    );
  }
}
