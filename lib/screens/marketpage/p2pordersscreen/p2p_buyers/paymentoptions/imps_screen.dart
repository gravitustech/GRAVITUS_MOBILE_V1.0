// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/screens/marketpage/p2pordersscreen/p2p_buyers/paymentoptions/payment_deatils.dart';

class ImpsScreen extends StatefulWidget {
  const ImpsScreen({Key key}) : super(key: key);

  @override
  State<ImpsScreen> createState() => _ImpsScreenState();
}

class _ImpsScreenState extends State<ImpsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PaymentDetails(title: 'Name', value: 'NavaneethaKrishnan'),
          PaymentDetails(title: 'Account No', value: '918508275959'),
          PaymentDetails(title: 'IFSC', value: 'PYTM0123456'),
          PaymentDetails(title: 'Branch', value: 'Salem'),
        ],
      ),
    );
  }
}
