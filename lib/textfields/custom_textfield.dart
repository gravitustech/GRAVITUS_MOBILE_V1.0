// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String validatorMessage;
  final Color fillColor;
  final TextCapitalization capitalization;
  final bool enabled;
  final IconData icon;

  CustomTextField({
    this.controller,
    this.hintText,
    this.textInputType,
    this.maxLine = 1,
    this.focusNode,
    this.nextNode,
    this.textInputAction = TextInputAction.next,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage = '',
    this.fillColor,
    this.capitalization = TextCapitalization.none,
    this.enabled = true,
    this.icon,
  });

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
            enabled: enabled,
            controller: controller,
            maxLines: maxLine,
            textCapitalization: capitalization,
            maxLength: isPhoneNumber ? 15 : null,
            focusNode: focusNode,
            keyboardType: textInputType,
            initialValue: null,
            textInputAction: textInputAction,
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(nextNode);
            },
            inputFormatters: [
              isPhoneNumber
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.singleLineFormatter
            ],
            validator: (input) {
              if (input.isEmpty) {
                if (isValidator) {
                  return validatorMessage;
                }
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(
                  icon,
                  color: Color(0xFF2969DA),
                ),
                onPressed: () {},
              ),
              hintText: hintText,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(top: 14, bottom: 15),
              isDense: true,
              counterText: '',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color(0xFFB1B1B1),
                fontWeight: FontWeight.w500,
                fontFamily: 'poppins',
              ),
              errorStyle: TextStyle(height: 1.5),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color: Color(0x802969DA),
                ),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ));
  }
}
