// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class TradeButton extends StatefulWidget {
  final Function onTap;
  final bool selected;
  final Color buttonColor;
  final String buttonText;

  TradeButton({
    this.onTap,
    @required this.selected,
    @required this.buttonColor,
    @required this.buttonText,
  });

  @override
  State<TradeButton> createState() => _TradeButtonState();
}

class _TradeButtonState extends State<TradeButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: widget.onTap,
        child: widget.selected
            ? Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.buttonColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 1),
                    ), // changes position of shadow
                  ],
                ),
                child: Text(widget.buttonText,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: widget.selected
                            ? Colors.white
                            : Color(0xffB1B1B1))),
              )
            : Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffEBEBEB),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1)), // changes position of shadow
                  ],
                ),
                child: Text(widget.buttonText,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffB1B1B1))),
              ),
      ),
    );
  }
}
