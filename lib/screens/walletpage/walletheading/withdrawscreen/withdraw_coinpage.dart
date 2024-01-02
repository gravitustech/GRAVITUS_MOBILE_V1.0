// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, sort_child_properties_last, missing_required_param, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/screens/tradepage/tradescreen/trade_screen.dart';
import 'package:gravitus_app_v1/styles/styles.dart';
import 'package:gravitus_app_v1/textfields/withdraw_textfield.dart';

class WithdrawCoin extends StatefulWidget {
  const WithdrawCoin({Key key}) : super(key: key);

  @override
  State<WithdrawCoin> createState() => _WithdrawCoinState();
}

class _WithdrawCoinState extends State<WithdrawCoin> {
  TextEditingController _coinAddressController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _totalamountController = TextEditingController();
  FocusNode _coinAddressNode = FocusNode();
  FocusNode _amountNode = FocusNode();
  FocusNode _totalamountNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 16, top: 26),
                    child: GestureDetector(
                      child: SvgPicture.asset('images/backicon.svg'),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  leadingWidth: 30,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      'Withdraw Bitcoin',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  backgroundColor: Color(0xff2A6DE6),
                ),
                //next
                SliverToBoxAdapter(
                  child: Container(
                    color: Color(0xff2A6DE6),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(height: 1.5),
                                  children: [
                                    TextSpan(
                                        text: 'Enter',
                                        style: TextStyle(
                                            color: Color(0xff76A7FF),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: ' BTC MAINNET',
                                        style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    TextSpan(
                                        text:
                                            ' wallet address. Lorem ipsum dolor sit amet, consectetur.',
                                        style: TextStyle(
                                            color: Color(0xff76A7FF),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                  ]),
                            ),
                          ),
                        ),
                        //next
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: ListTile(
                                  visualDensity: VisualDensity(vertical: -4),
                                  leading:
                                      Text('BTC Address', style: addressstyle),
                                  //next
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Network:', style: networkstyle),
                                      SizedBox(width: 8),
                                      Text('BTC smart chain', style: pricestyle)
                                    ],
                                  ),
                                ),
                              ),
                              //next
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: WithdrawTextField(
                                  hintText: 'Enter BNB address',
                                  controller: _coinAddressController,
                                  focusNode: _coinAddressNode,
                                  nextNode: _amountNode,
                                  icon: 'images/scanicon.svg',
                                  iconTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             QrScanScreen()));
                                  },
                                ),
                              ),
                              //next
                              SizedBox(height: 12),
                              ListTile(
                                visualDensity: VisualDensity(vertical: -4),
                                leading: Text('Amount', style: addressstyle),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Available Balance:',
                                        style: networkstyle),
                                    SizedBox(width: 8),
                                    Text('1.000326 BTC', style: pricestyle),
                                  ],
                                ),
                              ),
                              //next
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: WithdrawTextField(
                                  hintText: 'Enter Amount',
                                  controller: _amountController,
                                  focusNode: _amountNode,
                                  nextNode: _totalamountNode,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              //next
                              SizedBox(height: 12),
                              ListTile(
                                visualDensity: VisualDensity(vertical: -4),
                                leading:
                                    Text('Total Amount', style: addressstyle),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Estimated fees:',
                                        style: networkstyle),
                                    SizedBox(width: 8),
                                    Text('0.000235 BTC', style: pricestyle),
                                  ],
                                ),
                              ),
                              //next
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: WithdrawTextField(
                                  hintText: 'Total Amount',
                                  controller: _totalamountController,
                                  focusNode: _totalamountNode,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              //next
                              SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'SUBMIT',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff2A6DE6)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //NEXT

                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: SliverDelegateTrade(
                    context: context,
                    child: Container(
                      color: Color(0xffFFFFFF),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextButton(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 11.0,
                                  top: 13,
                                ),
                                child: Text(
                                  'Transactions',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.transparent,
                                    decorationColor: Color(0xff2A6DE6),
                                    shadows: [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(0, -10))
                                    ],
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('images/hinticon.svg'),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Last 15 transactions',
                                style: TextStyle(
                                    color: Color(0xff8EB6FF), fontSize: 10),
                              ),
                              SizedBox(
                                width: 16,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //next
                SliverToBoxAdapter(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.white,
                    child: Center(
                      child: Image.asset('images/notfound.png'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
