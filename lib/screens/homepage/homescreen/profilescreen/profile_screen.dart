// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gravitus_app_v1/navigatorpageroute/navigatordirectionpageroute.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/about_screen/about_screen.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/paymethods_screen/payment_methods_options.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/profile_auth_heading.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/profile_options.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/security_screen/security_screen.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/supportscreen/support_screen.dart';
import 'package:gravitus_app_v1/screens/homepage/homescreen/profilescreen/useridentity_screen/user_identity_upload.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

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
                'Account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0XFFFFFFFF)),
              ),
              backgroundColor: Color(0XFF2A6DE6),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('images/shareiconwhite.svg'),
                      )
                    ],
                  ),
                )
              ],
            ),
            //next
            SliverToBoxAdapter(
              child: Container(
                color: Color(0xff2A6DE6),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff2A6DE6),
                              radius: 45,
                              child: ClipOval(
                                  child: SvgPicture.asset(
                                'images/profileimage.svg',
                                height: 60,
                                width: 160,
                              )),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: '1234567',
                                      // '${Provider.of<AuthProvider>(context, listen: false).getUserId()}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: '   ID  ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFFFFF),
                                      ),
                                    ),
                                  ]),
                                ),
                                //next
                                SizedBox(height: 10),
                                Text(
                                  'Krishnannavaneetha76@gmail.com',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffFFFFFF)),
                                )
                              ],
                            )
                          ],
                        ),
                        Positioned(
                            top: 10,
                            left: 60,
                            child: SvgPicture.asset('images/profileverify.svg'))
                      ],
                    ),
                    //next
                    Row(
                      children: [
                        Profilehead(
                          'images/emailicon.svg',
                          'Email',
                          'images/greentick.svg',
                          () => null,
                          // () => Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => null)),
                        ),
                        Profilehead(
                          'images/phoneicon.svg',
                          'Phone',
                          'images/greentick.svg',
                          () => null,
                          // () => Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => null)),
                        ),
                      ],
                    ),
                    //next

                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Color(0xffFFFFFF),
                      ),
                      child: (Column(
                        children: [
                          SizedBox(height: 10),
                          //identity
                          ProfileOption(
                            leadingIcon: 'images/identityicon.svg',
                            title: 'User Identity',
                            tailOption: true,
                            tailingColor: Colors.red,
                            tailingTitle: 'Pending',
                            onTap: () =>
                                Navigator.of(context).push(CustomPageRoute(
                              child: UserIdentityUpload(),
                              direction: AxisDirection.left,
                            )),
                            //  Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             UserIdentityUpload())),
                          ),
                          //payment
                          SizedBox(height: 20),
                          ProfileOption(
                            leadingIcon: 'images/paymethoicon.svg',
                            title: 'Payment Methods',
                            tailOption: true,
                            tailingTitle: '1 no',
                            onTap: () =>
                                Navigator.of(context).push(CustomPageRoute(
                              child: PaymentMethodsOptions(),
                              direction: AxisDirection.left,
                            )),
                            //  Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             PaymentMethodsOptions())),
                          ),
                          // 'Security',
                          SizedBox(height: 20),
                          ProfileOption(
                            leadingIcon: 'images/securityicon.svg',
                            title: 'Security',
                            tailOption: false,
                            taillingIcon: 'images/forwardicon.svg',
                            onTap: () =>
                                Navigator.of(context).push(CustomPageRoute(
                              child: Securitypage(),
                              direction: AxisDirection.left,
                            )),
                            //  Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Securitypage())),
                          ),
                          //'Support Ticket',
                          SizedBox(height: 20),
                          ProfileOption(
                            leadingIcon: 'images/support.svg',
                            title: 'Support Ticket',
                            tailOption: false,
                            taillingIcon: 'images/forwardicon.svg',
                            onTap: () =>
                                Navigator.of(context).push(CustomPageRoute(
                              child: SupportScreen(),
                              direction: AxisDirection.left,
                            )),
                            //  Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SupportScreen())),
                          ),
                          //about
                          SizedBox(height: 20),
                          ProfileOption(
                            leadingIcon: 'images/abouticon.svg',
                            title: 'About',
                            tailOption: false,
                            taillingIcon: 'images/forwardicon.svg',
                            onTap: () =>
                                Navigator.of(context).push(CustomPageRoute(
                              child: AboutScreen(),
                              direction: AxisDirection.left,
                            )),
                            //  Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => AboutScreen())),
                          ),
                          //"FAQ's",
                          SizedBox(height: 20),
                          ProfileOption(
                            leadingIcon: 'images/faqicon.svg',
                            title: "FAQ's",
                            tailOption: false,
                            taillingIcon: 'images/forwardicon.svg',
                            onTap: () => null,
                          ),
                          Container(
                            height: 64,
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color(0xffF8F8F8),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'images/helplineicon.svg',
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Feel Free To Ask, We Ready To Help',
                                  style: TextStyle(
                                      color: Color(0xff808080),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff2A6DE6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
