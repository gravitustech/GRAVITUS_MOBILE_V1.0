// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        leadingWidth: 30,
        title: Text(
          'About',
          style: TextStyle(
              fontSize: 16,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff2A6DE6),
      ),
      SliverToBoxAdapter(
          child: Container(
              width: double.infinity,
              color: Color(0xff2A6DE6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Color(0xffffffff),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 16, right: 16),
                  child: Column(
                    children: const [
                      Center(
                          child: Text(
                        'Crypto Exchange For Budding Traders',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff2f2f2f),
                            fontSize: 14),
                      )),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'We are bunch of crypto currency enthusiasts, traders, and blockchain developers. With Internet era beginning to saturate and next big technology BLOCKCHAIN, which is poised to revolutionize the world. A need for global crypto platform is inevitable.',
                        style: TextStyle(
                            color: Color(0xff808080),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            height: 2.5),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                          child: Text(
                        'Version 137',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )),
                    ],
                  ),
                ),
              )))
    ])));
  }
}
