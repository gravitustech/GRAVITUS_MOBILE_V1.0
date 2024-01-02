// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/paymethods_screen/payment_option_imps.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/paymethods_screen/payment_option_upi.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/paymethods_screen/payment_options.dart';

class PaymentMethodsOptions extends StatefulWidget {
  const PaymentMethodsOptions({Key key}) : super(key: key);

  @override
  State<PaymentMethodsOptions> createState() => _PaymentMethodsOptionsState();
}

class _PaymentMethodsOptionsState extends State<PaymentMethodsOptions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leadingWidth: 30,
            title: Text(
              'Payment Methods',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color(0xff2A6DE6),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xff2A6DE6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Color(0xffffffff),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    PaymentOption(
                      leadingIcon: 'images/upiicon.svg',
                      title: 'UPI',
                      message: 'Update UPI Id',
                      tailOption: false,
                      taillingIcon: 'images/forwardicon.svg',
                      onTap: () => Navigator.of(context).push(CustomPageRoute(
                        child: PaymentOptionUpi(),
                        direction: AxisDirection.left,
                      )),
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PaymentOptionUpi())),
                    ),
                    //next
                    SizedBox(height: 10),
                    Divider(
                      color: Color(0xffecebeb),
                    ),
                    //next
                    SizedBox(height: 16),
                    PaymentOption(
                      leadingIcon: 'images/impsicon.svg',
                      title: 'IMPS',
                      message: 'Update Bank details',
                      tailOption: false,
                      taillingIcon: 'images/forwardicon.svg',
                      onTap: () => Navigator.of(context).push(CustomPageRoute(
                        child: PaymentOptionIMPS(),
                        direction: AxisDirection.left,
                      )),
                      //   Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) => PaymentOptionIMPS())),
                    ),
                    //next
                    SizedBox(height: 10),
                    Divider(
                      color: Color(0xffecebeb),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
