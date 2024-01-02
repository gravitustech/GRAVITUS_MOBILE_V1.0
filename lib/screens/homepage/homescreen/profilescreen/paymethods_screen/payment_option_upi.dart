// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/styles/styles.dart';
import 'package:gravitus_app_v1/textfields/withdraw_textfield.dart';

class PaymentOptionUpi extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _upiController = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _upiIdFoucsNode = FocusNode();

  PaymentOptionUpi({Key key}) : super(key: key);

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
                    Row(
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0, top: 16),
                              child: Text(
                                'Add UPI',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.transparent,
                                  decorationColor: Colors.blue,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -10))
                                  ],
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                ),
                              ),
                            ),
                          ),
                          //
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Name', style: panheadstyle),
                      ),
                    ),
                    //next
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 17.0, right: 16),
                      child: WithdrawTextField(
                        controller: _nameController,
                        // focusNode: _nameFocus,
                        nextNode: _upiIdFoucsNode,
                        textInputType: TextInputType.name,
                        hintText: '',
                      ),
                    ),
                    //next
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 17.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('UPI Id', style: panheadstyle),
                      ),
                    ),
                    //next
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 16),
                      child: WithdrawTextField(
                        controller: _upiController,
                        focusNode: _upiIdFoucsNode,
                        textInputType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                        hintText: '',
                      ),
                    ),
                    //next
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: null,
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffEBEBEB),
                                borderRadius: BorderRadius.circular(2),
                                // border:
                                //     Border.all(color: Color(0XFFB1B1B1)),
                              ),
                              child: Text(
                                'Support',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0XFFB1B1B1)),
                              ),
                            ),
                          )),
                          SizedBox(width: 10),
                          Expanded(
                            child: InkWell(
                              onTap: null,
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff2A6DE6),
                                    borderRadius: BorderRadius.circular(2),
                                    border:
                                        Border.all(color: Color(0XFFB1B1B1))),
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0XFFFFFFFF)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //next
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'images/hinticon.svg',
                            color: Color(0xffB1B1B1),
                          ),
                          //next
                          SizedBox(width: 2),
                          Flexible(
                              child: Text(
                            'Your UPI details will be shown to counter part traders. Please make sure to enter correct details.',
                            style: TextStyle(
                                color: Color(0xff808080),
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                            textAlign: TextAlign.center,
                          ))
                        ],
                      ),
                    )
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
