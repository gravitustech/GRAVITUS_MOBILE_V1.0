// ignore_for_file: prefer_final_fields, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gravitus_app_v1/custombutton/custom_button.dart';
import 'package:gravitus_app_v1/screens/frontscreen/forgetpassword_page.dart';
import 'package:gravitus_app_v1/screens/frontscreen/signup_page.dart';
import 'package:gravitus_app_v1/textfields/custom_password_textfield.dart';
import 'package:gravitus_app_v1/textfields/custom_textfield.dart';
import 'package:gravitus_app_v1/textfields/validator.dart';
import '../../navigatorpageroute/navigatordirectionpageroute.dart';
import '../images/images.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String emailError = '';
  String password = "";
  String passwordError = '';

  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future signIn() async {
    if (!Validator.validateEmail(_emailController.text)) {
      setState(() {
        emailError = '*Enter valid email id';
        passwordError = '';
      });
    } else if (!Validator.checkEmpty(_passwordController.text)) {
      setState(() {
        emailError = '';
        passwordError = '*Incorrect password';
      });
    } else {
      setState(() {
        emailError = '';
        passwordError = '';
      });
      // ReferralCheckRequest referralCheckRequest = new ReferralCheckRequest();
      // var postData = PostData(
      //   emailId: _emailController.text,
      //   password: _passwordController.text,
      // );
      // referralCheckRequest.accountType = AppConstants.APP_NAME.toUpperCase();
      // referralCheckRequest.postData = postData;
      // await Provider.of<AuthProvider>(context, listen: false)
      //     .signIn(context, referralCheckRequest)
      //     .then((value) {
      //   if (value != null) {
      //     Validator.showSnackbar(context, value.error, true);
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (BuildContext context) => DashBoard()));
      //   }
      // });
    }
  }

//moveto signUp page define
  void _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signup()),
    );
  }

//moveto forgetpassword page define
  void _forgetPassword() {
    Navigator.of(context).push(CustomPageRoute(
      child: const ForgetPassword(),
      direction: AxisDirection.left,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  "Login to continue",
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF808080),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins',
                  ),
                ),

                //email textformfield
                const SizedBox(height: 50),
                buildemail(),

                //erroremail
                const SizedBox(height: 5),
                buildemailerror(),

                //password textformfield
                const SizedBox(height: 16),
                buildPassword(),

                //errorpassword
                const SizedBox(height: 5),
                buildpassworderror(),

                //signin button
                const SizedBox(height: 16),
                buildsigninbutton(),

                //Newuser? and signup text
                const SizedBox(height: 16),
                buildnewusersignup(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //buildemail widget(email textfield)
  Widget buildemail() => Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
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

  //buildpassword widget(password textfield)
  Widget buildPassword() => Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: CustomPasswordTextField(
          hintTxt: 'Password',
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

  //buildsigninbutton widget
  Widget buildsigninbutton() => Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        // child: Provider.of<AuthProvider>(context).isLoading
        //     ? CircularProgressIndicator(
        //         valueColor: AlwaysStoppedAnimation<Color>(
        //           Color(0xFF2969DA),
        //         ),
        //       )
        //     :
        child: CustomButton(
          buttonText: 'Sign In',
          onTap: signIn,
        ),
      );

  //buildnewusersignup widget
  Widget buildnewusersignup() => Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: 'New User?',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF808080),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    recognizer: TapGestureRecognizer()..onTap = () => _signUp(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2969DA),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'poppins',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Text(
                'Forget Password?',
                style: TextStyle(
                  fontSize: 12,
                  color: const Color(0xFF2F2F2F),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins',
                ),
              ),
              onTap: _forgetPassword,
            ),
          ],
        ),
      );
}
