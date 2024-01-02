// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class WithdrawTextField extends StatelessWidget {
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
  final String icon;
  Function iconTap;

  WithdrawTextField(
      {Key key,
      this.controller,
      this.hintText,
      this.textInputType,
      this.maxLine,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.isPhoneNumber = false,
      this.isValidator = false,
      this.validatorMessage,
      this.capitalization = TextCapitalization.none,
      this.fillColor,
      this.enabled,
      this.icon = '',
      this.iconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        border: Border.all(color: Color(0xffB1B1B1)),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          height: 40,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            enabled: enabled,
            controller: controller,
            maxLines: maxLine ?? 1,
            textCapitalization: capitalization,
            maxLength: isPhoneNumber ? 15 : null,
            focusNode: focusNode,
            keyboardType: textInputType ?? TextInputType.text,
            //keyboardType: TextInputType.number,
            initialValue: null,
            textInputAction: textInputAction ?? TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(nextNode);
            },
            //autovalidate: true,
            inputFormatters: [
              isPhoneNumber
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.singleLineFormatter
            ],
            validator: (input) {
              if (input.isEmpty) {
                if (isValidator) {
                  return validatorMessage ?? "";
                }
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: icon.isNotEmpty
                  ? IconButton(
                      icon: SvgPicture.asset(
                        icon,
                      ),
                      onPressed: iconTap,
                    )
                  : SizedBox(),
              hintText: hintText ?? '',
              filled: fillColor != null,
              fillColor: fillColor,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
              isDense: true,
              counterText: '',
              // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorResources.APP_THEME), borderRadius: BorderRadius.all(Radius.circular(6))),
              hintStyle: TextStyle(
                  color: Color(0xffB1B1B1),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              errorStyle: TextStyle(height: 1.5),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
