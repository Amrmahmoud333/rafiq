import 'package:flutter/material.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/screens/second_sign_up.dart';
import 'package:rafiq/views/sign_up/widgets/horizontal_line.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  static const routeName = '/sign_up';
  final _fromKey = GlobalKey<FormState>();

  String? customValidteFirstName(String? firstName) {
    if (!(RegExp(r'[a-z A-Z]{2,35}').hasMatch(firstName!))) {
      // (RegExp(r'[a-zA-Z]{2,35}').hasMatch(firstName.toString()))
      return 'Enter a correct first name';
    } else {
      return null;
    }
  }

  String? customValidteLastName(String? lastName) {
    if (lastName!.isEmpty ||
        lastName.length < 2 ||
        lastName.length > 35 ||
        lastName.contains(' ')) {
      return 'Enter a correct last name';
    } else {
      return null;
    }
  }

  String? customValidteUserName(String? userName) {
    if (userName!.isEmpty ||
        userName.length < 3 ||
        userName.length > 35 ||
        !(userName[0].contains(RegExp(r'[A-Za-z]')))) {
      return 'Enter a Correct user name';
      // TODO doesn't have two consecutive ' ' && .
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height(851),
              child: Stack(
                children: [
                  const Align(
                      alignment: Alignment.topCenter, child: TopCloud(false)),
                  Positioned(
                    top: height(190),
                    child: Form(
                      key: _fromKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height(20),
                          ),
                          HorizontalLinee(
                            precent: 0,
                          ),
                          SizedBox(
                            height: height(52),
                          ),
                          InputField(
                            label: 'First Name',
                            sizeoflabel: 18,
                            obscureText: false,
                            valdator: customValidteFirstName,
                          ),
                          SizedBox(
                            height: height(22),
                          ),
                          InputField(
                            label: 'Last Name',
                            sizeoflabel: 18,
                            obscureText: false,
                            valdator: customValidteLastName,
                          ),
                          SizedBox(
                            height: height(29),
                          ),
                          InputField(
                            label: 'Username',
                            sizeoflabel: 18,
                            obscureText: false,
                            valdator: customValidteUserName,
                          ),
                          SizedBox(
                            height: height(61),
                          ),
                          LogSignButton(
                            label: 'Next',
                            ontap: () {
                              if (_fromKey.currentState!.validate()) {
                                print('first sign up  ');
                                Navigator.pushNamed(
                                  context,
                                  SecondSignUp.routeName,
                                );
                              }
                            },
                          ),
                          SizedBox(
                            height: height(1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomCLoud(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
