// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gravitus_app_v1/screens/frontscreen/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // if (Provider.of<AuthProvider>(context, listen: false).isUserLoggedIn()) {
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => DashBoard()));
      // } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SvgPicture.asset(
            "images/logo1.svg",
            width: 90,
            height: 81.99,
          ),
        ),
      ),
    );
  }
}
