// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_field, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/styles/styles.dart';
import 'package:gravitus_app_v1/textfields/withdraw_textfield.dart';

class PaymentOptionIMPS extends StatelessWidget {
  PaymentOptionIMPS({Key key}) : super(key: key);

  TextEditingController _acNameController = TextEditingController();
  TextEditingController _acNumberController = TextEditingController();
  TextEditingController _ifscController = TextEditingController();
  TextEditingController _bankNameController = TextEditingController();

  FocusNode _acNameFocus = FocusNode();
  FocusNode _acNumberFocus = FocusNode();
  FocusNode _ifscFocus = FocusNode();
  FocusNode _bankNameFocus = FocusNode();
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
                                'Add IMPS',
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
                        child: Text('A/C Holder Name', style: panheadstyle),
                      ),
                    ),
                    //next
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 16),
                      child: WithdrawTextField(
                        controller: _acNameController,
                        // focusNode: _acNameFocus,
                        nextNode: _acNumberFocus,
                        textInputType: TextInputType.name,
                        hintText: '',
                      ),
                    ),
                    //next
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('A/C Number', style: panheadstyle),
                      ),
                    ),
                    //next
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 16),
                      child: WithdrawTextField(
                        controller: _acNumberController,
                        focusNode: _acNumberFocus,
                        nextNode: _ifscFocus,
                        textInputType: TextInputType.name,
                        hintText: '',
                      ),
                    ),
                    //next
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('IFSC Code', style: panheadstyle),
                      ),
                    ),
                    //next
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 16),
                      child: WithdrawTextField(
                        controller: _ifscController,
                        focusNode: _ifscFocus,
                        nextNode: _bankNameFocus,
                        textInputType: TextInputType.name,
                        hintText: '',
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Bank Name', style: panheadstyle),
                      ),
                    ),
                    //next
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0, right: 16),
                      child: WithdrawTextField(
                        controller: _bankNameController,
                        focusNode: _bankNameFocus,
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
                          SizedBox(width: 1),
                          Flexible(
                              child: Text(
                            'Your Bank details will be shown to counter part traders. Please make sure to enter correct details.',
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
