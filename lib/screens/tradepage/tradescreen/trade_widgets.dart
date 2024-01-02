// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:gravitus_app_v1/screens/tradepage/tradescreen/trade_button.dart';

class TradeWidgets extends StatefulWidget {
  const TradeWidgets({Key key}) : super(key: key);

  @override
  State<TradeWidgets> createState() => _TradeWidgetsState();
}

class _TradeWidgetsState extends State<TradeWidgets> {
  String selectTrade = 'buy'; //select trade buy&sell
  String _dropDownValue;
  String tradeLimit = 'limit'; //tradelimit
  double _stopPriceController = 0.00000; //stopprice value(default)
  double _priceController = 0.03871;
  TextEditingController fieldText = TextEditingController();
  double _currentSliderValue = 10;

  _tradeOptions(String tradeType) {
    if (tradeType == 'buy') {
      setState(() {
        selectTrade = 'buy';
      });
    } else {
      setState(() {
        selectTrade = 'sell';
      });
    }
  } //onTap buy sell options

  _stopminusLimit() {
    setState(() {
      if (_stopPriceController <= 0.00000) {
        return;
      }
      _stopPriceController -= 0.00001;
    });
  }

  _stopplusLimit() {
    setState(() {
      _stopPriceController += 0.00001;
    });
  }

  _minusLimit() {
    setState(() {
      if (_priceController <= 0.00000) {
        return;
      }
      _priceController -= 0.00001;
    });
  }

  _plusLimit() {
    setState(() {
      _priceController += 0.00001;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 210,
              child: Column(
                children: [
                  Container(
                    color: Color(0xffffffff),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TradeButton(
                              buttonText: 'Buy',
                              buttonColor: Color(0xff2EBD85),
                              selected: selectTrade == 'buy' ? true : false,
                              onTap: () {
                                _tradeOptions('buy');
                              },
                            ),
                            TradeButton(
                              buttonText: 'Sell',
                              buttonColor: Color(0xffD32F2F),
                              selected: selectTrade == 'sell' ? true : false,
                              onTap: () {
                                _tradeOptions('sell');
                              },
                            ),
                          ],
                        ),
                        //next
                        SizedBox(height: 10),
                        Container(
                          height: 25,
                          color: Color(0xffEBEBEB),
                          child: DropdownButton(
                            underline: SizedBox(),
                            hint: _dropDownValue == null
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Limit',
                                      style: TextStyle(
                                        color: Color(0xffB1B1B1),
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _dropDownValue,
                                      style: TextStyle(
                                        color: Color(0xffB1B1B1),
                                      ),
                                    ),
                                  ),
                            isExpanded: true,
                            style: TextStyle(color: Colors.black),
                            items: ['Limit', 'Stop Limit'].map((val) {
                              return DropdownMenuItem(
                                child: Text(val),
                                value: val,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _dropDownValue = val;
                                tradeLimit = val.toString().toLowerCase();
                              });
                            },
                          ),
                        ), //limit and stoplimit container
                        //next
                        tradeLimit != 'limit'
                            ? SizedBox(height: 10)
                            : SizedBox(),
                        //next
                        tradeLimit != 'limit'
                            ? Container(
                                height: 40,
                                color: Color(0xffEBEBEB),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: _stopPriceController <= 0.00000
                                        ? 'Stop'
                                        : _stopPriceController
                                            .toStringAsFixed(5),
                                    hintStyle:
                                        TextStyle(color: Color(0xffB1B1B1)),
                                    prefixIcon: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SvgPicture.asset(
                                          'images/minus.svg',
                                        ),
                                      ),
                                      onTap: () {
                                        _stopminusLimit();
                                      },
                                    ),
                                    suffixIcon: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child:
                                            SvgPicture.asset('images/plus.svg'),
                                      ),
                                      onTap: () {
                                        _stopplusLimit();
                                      },
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0.1-9]')),
                                  ],
                                ),
                              )
                            : SizedBox(), //limit and stop limit stopfiled
                        //next
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          color: Color(0xffEBEBEB),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: _priceController.toStringAsFixed(5),
                              hintStyle: TextStyle(color: Color(0xffB1B1B1)),
                              prefixIcon: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    'images/minus.svg',
                                  ),
                                ),
                                onTap: () {
                                  _minusLimit();
                                },
                              ),
                              suffixIcon: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset('images/plus.svg'),
                                ),
                                onTap: () {
                                  _plusLimit();
                                },
                              ),
                            ),
                            controller: fieldText,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0.1-9]')),
                            ],
                          ),
                        ),
                        //next
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          color: Color(0xffEBEBEB),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: InputBorder.none,
                              isDense: true,
                              prefixIcon: Text(""),
                              hintText: 'Quantity',
                              hintStyle: TextStyle(color: Color(0xffB1B1B1)),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Align(
                                  widthFactor: 1.0,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'BTC',
                                      style: TextStyle(
                                          color: Color(0xff808080),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // controller: fieldText,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0.1-9]')),
                            ],
                          ),
                        ),
                        //next
                        SizedBox(height: 10),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              activeColor: selectTrade == 'buy'
                                  ? Color(0xff2EBD85)
                                  : Color(0xffD32F2F),
                              inactiveColor: Color(0xffEBEBEB),
                              divisions: 4,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                  print('--------------' +
                                      _currentSliderValue.toString());
                                });
                              }),
                        ),
                        //next
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              '0%',
                              style: TextStyle(
                                  color: Color(0xff808080), fontSize: 12),
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Color(0xff808080), fontSize: 12),
                            ),
                            Text(
                              '50%',
                              style: TextStyle(
                                  color: Color(0xff808080), fontSize: 12),
                            ),
                            Text(
                              '75%',
                              style: TextStyle(
                                  color: Color(0xff808080), fontSize: 12),
                            ),
                            Text(
                              '100%',
                              style: TextStyle(
                                  color: Color(0xff808080), fontSize: 12),
                            ),
                          ],
                        ),
                        //next
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          color: Color(0xffEBEBEB),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: InputBorder.none,
                              hintText: 'Total Amount',
                              hintStyle: TextStyle(color: Color(0xffB1B1B1)),
                            ),
                            // controller: fieldText,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0.1-9]')),
                            ],
                          ),
                        ),
                        //next
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Avbl',
                                style: TextStyle(
                                    color: Color(0xffB1B1B1), fontSize: 12)),
                            Row(
                              children: [
                                Text('--  USDT',
                                    style: TextStyle(
                                        color: Color(0xffB1B1B1),
                                        fontSize: 12)),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  child: SvgPicture.asset(
                                    'images/plus.svg',
                                    color: Color(0xff8EB6FF),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        //next
                        SizedBox(
                          height: 10,
                        ),
                        selectTrade == 'buy'
                            ? Container(
                                height: 40,
                                width: double.infinity,
                                color: Color(0xff2EBD85),
                                child: Center(
                                  child: TextButton(
                                    child: Text(
                                      'Buy',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              )
                            : Container(
                                height: 40,
                                width: double.infinity,
                                color: Color(0xffD32F2F),
                                child: Center(
                                  child: TextButton(
                                    child: Text(
                                      'Sell',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: null,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //next
            SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Price',
                              style: TextStyle(
                                  color: Color(0xffB1B1B1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          Text('Quantity',
                              style: TextStyle(
                                  color: Color(0xffB1B1B1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('(USDT)',
                              style: TextStyle(
                                  color: Color(0xffB1B1B1), fontSize: 10)),
                          Text('(BTC)',
                              style: TextStyle(
                                color: Color(0xffB1B1B1),
                                fontSize: 10,
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                          itemCount: tradeLimit == 'limit' ? 6 : 7,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('0.03870',
                                              style: TextStyle(
                                                  color: Color(0xffD32F2F),
                                                  fontSize: 10)),
                                        ],
                                      ),
                                      Text('500.000',
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 10,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          }),
                      Container(
                          height: 40,
                          width: double.infinity,
                          color: Color(0xffFFFFFF),
                          child: Center(
                              child: Text(
                            '0.03870',
                            style: TextStyle(
                                color: Color(0xff2EBD85),
                                fontWeight: FontWeight.bold),
                          ))),
                      SizedBox(height: 10),
                      ListView.builder(
                          itemCount: tradeLimit == 'limit' ? 6 : 7,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('0.03864',
                                              style: TextStyle(
                                                  color: Color(0xff2EBD85),
                                                  fontSize: 10)),
                                        ],
                                      ),
                                      Text('760.150',
                                          style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 10,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
