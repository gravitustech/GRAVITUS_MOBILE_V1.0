// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTxt;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final IconData icon;

  CustomPasswordTextField({
    this.controller,
    this.hintTxt,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.icon,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obsureText = true;

  void _toggle() {
    setState(() {
      _obsureText = !_obsureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: TextFormField(
          controller: widget.controller,
          obscureText: _obsureText,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: (v) {
            setState(() {
              widget.textInputAction == TextInputAction.done
                  ? FocusScope.of(context).consumeKeyboardToken()
                  : FocusScope.of(context).requestFocus(widget.nextNode);
            });
          },
          validator: (value) {
            return null;
          },
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontSize: 35,
              decorationColor: Colors.red,
            ),
            prefixIcon: IconButton(
              icon: Icon(
                widget.icon,
                color: Color(0xFF2969DA),
              ),
              onPressed: () {},
            ),
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: widget.hintTxt,
            contentPadding: EdgeInsets.only(top: 14, bottom: 15),
            hintStyle: TextStyle(
              fontSize: 12,
              color: Color(0xFFB1B1B1),
              fontWeight: FontWeight.w500,
              fontFamily: 'poppins',
            ),
            isDense: true,
            filled: true,
            suffixIcon: IconButton(
                icon: Icon(
                  _obsureText ? Icons.visibility_off : Icons.visibility,
                  color: Color(0x802969DA),
                ),
                onPressed: _toggle),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(
                color: Color(0x802969DA),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
