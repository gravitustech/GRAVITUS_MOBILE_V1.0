// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/notificationscreen/expandable_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          leadingWidth: 30,
          title: Text(
            'Notification',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xff2A6DE6),
        ),
        //next
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
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: ListTile(
                              leading: Text(
                                'Heading',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xff0000000),
                                ),
                              ),
                              //next
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '16 Nov 2022 05:30 PM',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff2f2f2f),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SvgPicture.asset(
                                      'images/notifyread.svg') //logic code
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: ExpandableText(
                                text:
                                    'Hello, and welcome to our application process. We are excited to review your qualifications and experience.Our process is designed to give you the best opportunity to showcase your skills and qualifications. We ask that you provide your contact information, resume, and a cover letter explaining your interest in the position.We will review your application and contact you if we feel you are a good fit for the position. Thank you for your interest in joining our team.,'),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    })),
          ),
        ),
      ]),
    ));
  }
}
