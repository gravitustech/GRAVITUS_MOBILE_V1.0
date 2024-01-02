// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/paymentoptions/upi_imps_tabbar.dart';

class PaymentInfo1 extends StatefulWidget {
  const PaymentInfo1({Key key}) : super(key: key);

  @override
  State<PaymentInfo1> createState() => _PaymentInfo1State();
}

class _PaymentInfo1State extends State<PaymentInfo1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          SizedBox(height: 10),
          SvgPicture.asset('images/closeicon.svg'),
          //NEXT
          SizedBox(height: 10),
          UpiImpstababr(),
        ],
      ),
    );
  }
}
