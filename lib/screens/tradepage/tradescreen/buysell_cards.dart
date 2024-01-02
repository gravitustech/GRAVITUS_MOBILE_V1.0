// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/styles/styles.dart';

class BuySellCards extends StatelessWidget {
  const BuySellCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 5),
            Row(
              children: const [
                SizedBox(width: 48),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text('Price', style: buyorderstyle1),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text('Avg Price', style: buyorderstyle1),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text('07 Jun, 08.57 Pm',
                        overflow: TextOverflow.ellipsis, style: buyorderstyle1),
                  ),
                ),
              ],
            ),
            //
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 48),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text('270.001', style: buyorderstyle2),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text('29.0000', style: buyorderstyle2),
                ),
                Flexible(child: Text('')),
              ],
            ),
            //
            SizedBox(height: 8),
            Row(
              children: const [
                SizedBox(width: 48),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text('Quantity', style: buyorderstyle1),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text('Amount', style: buyorderstyle1),
                ),
                Flexible(child: Text('')),
              ],
            ),
            //
            SizedBox(height: 5),
            Row(
              children: const [
                SizedBox(width: 48),
                Flexible(
                    fit: FlexFit.tight,
                    child: Text('0.5420', style: buyorderstyle2)),
                Flexible(
                    fit: FlexFit.tight,
                    child: Text('164.3454', style: buyorderstyle2)),
                Flexible(child: Text('')),
              ],
            ),

            SizedBox(height: 10),
          ],
        ),
        Positioned(
          top: 5,
          left: 10,
          child: SvgPicture.asset('images/buy.svg', height: 25, width: 25),
        ),
        Positioned(
          child: Container(
            height: 25,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF3F3F3),
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(5),
                // ),
              ),
              onPressed: null,
              child: Text('Cancel', style: cancelstyle),
            ),
          ),
          bottom: 15,
          right: 16,
        )
      ],
    );
  }
}
