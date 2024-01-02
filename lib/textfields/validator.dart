// ignore_for_file: non_constant_identifier_names
// ignore: unused_import
import 'package:flutter/material.dart';

class Validator {
  static bool Utrerror(String value) {
    String pattern = r'^(?=.*?[0-9])';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  static bool checkEmpty(String value) {
    return value.isEmpty ? false : true;
  }
}
