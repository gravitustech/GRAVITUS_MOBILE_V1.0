// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/styles/styles.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  String _dropDownValue;
  String identityType = 'identityType';
  final maxLines = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Name', style: panheadstyle),
        ),
        SizedBox(height: 10),
        Container(
          height: 45,
          color: Color(0xffF8F8F8),
          child: DropdownButton(
            underline: SizedBox(),
            hint: _dropDownValue == null
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select Identity Type',
                      style: TextStyle(color: Color(0xffb1b1b1)),
                    ))
                : Align(
                    alignment: Alignment.center,
                    child: Text(
                      _dropDownValue,
                      style: TextStyle(
                        color: Color(0xffb1b1b1),
                      ),
                    ),
                  ),
            isExpanded: true,
            style: TextStyle(color: Colors.black),
            items: [
              'Trade Issue',
            ].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  _dropDownValue = val;
                  identityType = val.toString().toLowerCase();
                },
              );
            },
          ),
        ),
        SizedBox(height: 24),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Message', style: panheadstyle),
        ),
        SizedBox(height: 8),
        Container(
          height: maxLines * 20.0,
          //width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xffF8F8F8),
            border: Border.all(color: Color(0xffB1B1B1)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            cursorColor: Color(0xff808080),
            maxLines: maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 32),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Submit',
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
        SizedBox(height: 16),
        Row(
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
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
