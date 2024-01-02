// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gravitus_app_v1/custombutton/custom_button.dart';
import 'package:gravitus_app_v1/screens/frontscreen/login_page.dart';
import 'package:gravitus_app_v1/screens/images/images.dart';
import 'package:gravitus_app_v1/textfields/custom_password_textfield.dart';
import 'package:gravitus_app_v1/textfields/custom_textfield.dart';
import 'package:gravitus_app_v1/textfields/validator.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //bool isPasswordVisible = true;
  String emailError = '';
  String passwordError = "";

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _referralController = TextEditingController();

  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();
  FocusNode _referralNode = FocusNode();

  Future signUp() async {
    if (!Validator.validateEmail(_emailController.text)) {
      setState(() {
        emailError = '*Enter Vaild emaail id';
        passwordError = '';
      });
    } else if (!Validator.checkEmpty(_passwordController.text)) {
      setState(() {
        emailError = '';
        passwordError = '*Incorrect Password';
      });
    } else {
      setState(() {
        emailError = '';
        passwordError = '';
      });
    }
  }

  //createAccount void
  // void _createAccount(ReferralCheckRequest referralCheckRequest) async {
  //   await Provider.of<AuthProvider>(context, listen: false)
  //       .signUp(context, referralCheckRequest)
  //       .then((value) {
  //     if (value != null) {
  //       Validator.showSnackbar(context, value.error, true);
  //       _signIn();
  //     }
  //   });
  // }

  //moveto signin page define
  void _signIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //logo image
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SvgPicture.asset(
                Images.app_logo,
                height: 81.99,
                width: 90,
              ),

              //gravitus text
              const SizedBox(height: 10),
              Text(
                "GRAVITUS",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xFF2969DA),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'poppins',
                ),
              ),

              //login to continue text
              const SizedBox(height: 5),
              Text(
                "Signup to continue",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFF808080),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                ),
              ),

              //email textfield
              const SizedBox(height: 50),
              buildemail(),

              //erroremail
              const SizedBox(height: 5),
              buildemailerror(),

              //password textfield
              const SizedBox(height: 5),
              buildPassword(),

              //errorpassword
              const SizedBox(height: 5),
              buildpassworderror(),

              //Refferal id textfield
              const SizedBox(height: 5),
              buildreferral(),

              //Signup
              const SizedBox(height: 20),
              buildSignupButton(),

              // Already have an account?/ signin
              const SizedBox(height: 88),
              buildAccountSignin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildemail() => Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: CustomTextField(
          hintText: 'Email',
          focusNode: _emailNode,
          nextNode: _passNode,
          textInputType: TextInputType.emailAddress,
          controller: _emailController,
          fillColor: Colors.white,
          icon: Icons.mail,
        ),
      );

//buildemailerror widget
  Widget buildemailerror() => Container(
        margin: const EdgeInsets.only(right: 15),
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              emailError,
              style: const TextStyle(color: Colors.red, fontSize: 10),
              textAlign: TextAlign.end,
            )),
      );

  //password widget
  Widget buildPassword() => Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: CustomPasswordTextField(
          hintTxt: 'Set Your Password',
          textInputAction: TextInputAction.done,
          focusNode: _passNode,
          controller: _passwordController,
          icon: Icons.lock,
        ),
      );

  //buildpassworderror widget
  Widget buildpassworderror() => Container(
        margin: const EdgeInsets.only(right: 15),
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              passwordError,
              style: const TextStyle(color: Colors.red, fontSize: 10),
              textAlign: TextAlign.end,
            )),
      );

  //referral widget
  Widget buildreferral() => Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: CustomTextField(
          hintText: 'Referral Id (Optional)',
          focusNode: _referralNode,
          textInputAction: TextInputAction.done,
          controller: _referralController,
          fillColor: Colors.white,
          icon: Icons.link_sharp,
        ),
      );

  //SignUp button Widget
  Widget buildSignupButton() => Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: CustomButton(
          buttonText: 'Sign Up',
          onTap: signUp,
        ),
      );

  //Already have a account? / Signin
  Widget buildAccountSignin() => Text.rich(
        TextSpan(
          text: 'Already have an account?',
          style: TextStyle(
            fontSize: 12,
            color: const Color(0xFF808080),
            fontWeight: FontWeight.w400,
            fontFamily: 'poppins',
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' Sign In',
              recognizer: TapGestureRecognizer()..onTap = () => _signIn(),
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF2969DA),
                fontWeight: FontWeight.w400,
                fontFamily: 'poppins',
                decoration: TextDecoration.underline,
              ),
            ),
            // can add more TextSpans here...
          ],
        ),
      );
}
