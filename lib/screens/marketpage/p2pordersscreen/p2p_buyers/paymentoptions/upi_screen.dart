// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/paymentoptions/payment_deatils.dart';

class UpiScreen extends StatefulWidget {
  const UpiScreen({Key key}) : super(key: key);

  @override
  State<UpiScreen> createState() => _UpiScreenState();
}

class _UpiScreenState extends State<UpiScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PaymentDetails(title: 'Name', value: 'NavaneethaKrishnan'),
          PaymentDetails(title: 'UPI ID', value: 'krishnannavaneetha76@paytm'),
        ],
      ),
    );
  }
}
