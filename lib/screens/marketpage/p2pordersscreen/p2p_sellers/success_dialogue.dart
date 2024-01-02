// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessDialogue extends StatefulWidget {
  SuccessDialogue({Key key}) : super(key: key);

  @override
  State<SuccessDialogue> createState() => _SuccessDialogueState();
}

class _SuccessDialogueState extends State<SuccessDialogue>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.60,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SvgPicture.asset('images/success_icon.svg'),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Success',
                  style: TextStyle(
                      height: 1.5,
                      letterSpacing: 1.0,
                      fontSize: 14,
                      color: Color(0xff808080),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Crypto released successfully',
                  style: TextStyle(
                    height: 1.5, // the height between text, default is null
                    letterSpacing: 1.0,
                    fontSize:
                        14, // the white space between letter, default is 0.0
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Container(
                        height: 36,
                        width: 110,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff2A6DE6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 1),
                            ), // changes position of shadow
                          ],
                        ),
                        child: Text('Okay',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      )),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
