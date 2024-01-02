// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPTextField extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final int maxLine;
  final TextCapitalization capitalization;
  final bool isPhoneNumber;
  final TextInputAction textInputAction;
  final FocusNode nextNode;
  final bool isValidator;
  final String validatorMessage;
  final bool buttonEnabled;
  Function buttonTap;
  final String hintText;
  final Color fillColor;
  final FocusNode focusNode;
  final TextInputType textInputType;

  OTPTextField({
    Key key,
    this.enabled,
    this.controller,
    this.maxLine,
    this.capitalization = TextCapitalization.none,
    this.isPhoneNumber = false,
    this.textInputAction,
    this.nextNode,
    this.isValidator = false,
    this.validatorMessage,
    this.buttonEnabled = true,
    this.buttonTap,
    this.hintText,
    this.fillColor,
    this.focusNode,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        border: Border.all(color: Color(0xffB1B1B1)),
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: TextFormField(
          enabled: enabled,
          controller: controller,
          maxLines: maxLine ?? 1,
          textCapitalization: capitalization,
          maxLength: isPhoneNumber ? 15 : null,
          initialValue: null,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: textInputType ?? TextInputType.text,
          //
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(nextNode);
          },
          //
          inputFormatters: [
            isPhoneNumber
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter,
          ],
          //
          validator: (input) {
            if (input.isEmpty) {
              if (isValidator) {
                return validatorMessage ?? '';
              }
            }
            return null;
          },
          //
          decoration: InputDecoration(
            suffixIcon: buttonEnabled
                ? TextButton(
                    onPressed: buttonTap,
                    child: Text(
                      'Send OTP',
                      style: TextStyle(
                          color: Color(0xff2A6DE6),
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ))
                : SizedBox(),
            hintText: hintText ?? '',
            fillColor: fillColor,
            filled: fillColor != null,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            isDense: true,
            counterText: '',
            hintStyle: TextStyle(
              fontSize: 12,
              color: Theme.of(context).hintColor,
            ),
            errorStyle: TextStyle(height: 1.5),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
