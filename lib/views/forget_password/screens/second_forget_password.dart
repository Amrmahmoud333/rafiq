// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/forget_password/screens/first_forget_password.dart';

class SecondForgetPassword extends StatefulWidget {
  const SecondForgetPassword({Key? key}) : super(key: key);
  static const routeName = '/second_forget_password';

  @override
  State<SecondForgetPassword> createState() => _SecondForgetPasswordState();
}

class _SecondForgetPasswordState extends State<SecondForgetPassword> {
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E3),
      body: Padding(
        padding: EdgeInsets.only(
          top: height(168.86),
          left: width(74),
          right: width(74),
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/images/Done.png'),
            ),
            SizedBox(
              height: height(29.14),
            ),
            Center(
              child: AutoSizeText(
                'Reset Password',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 400 ? 35 : 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF5B618A),
                ),
              ),
            ),
            SizedBox(
              height: height(29),
            ),
            RichText(
              text: TextSpan(
                text:
                    'We sent a link to your email address .Check your email to reset your password. If you want to send a new link ,click ',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF5B618A),
                ),
                children: [
                  TextSpan(
                      text: 'Resend',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        fontSize: 17,
                        color: Color(0xFF5B618A),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                              context, FirstForgetPassword.routeName);
                        })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
