// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText({
    Key key,
    this.text = '',
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String textToDisplay;

  @override
  void initState() {
    textToDisplay = widget.text.length > 100
        ? widget.text.substring(0, 100) + "..."
        : widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          textToDisplay,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      onTap: () {
        if (widget.text.length > 100 && textToDisplay.length <= 103) {
          setState(() {
            textToDisplay = widget.text;
          });
        } else if (widget.text.length > 100 && textToDisplay.length > 100) {
          setState(() {
            textToDisplay = widget.text.substring(0, 100) + '...';
          });
        }
      },
    );
  }
}
