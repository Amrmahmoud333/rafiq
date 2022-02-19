import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/login/screens/widgets/custom_check_box.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h(851),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: TopCloud(true),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomCLoud(),
                  ),
                  Positioned(
                    top: h(190),
                    child: Padding(
                      padding: EdgeInsets.only(left: w(40)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h(48.16),
                          ),
                          SizedBox(
                            width: w(217),
                            height: h(35),
                            child: const AutoSizeText(
                              'Welcome back',
                              style: TextStyle(
                                fontFamily: 'DavidLibre',
                                fontWeight: FontWeight.w500,
                                fontSize: 35,
                                color: Color(0xff5B618A),
                              ),
                            ),
                          ),
                          SizedBox(height: h(41)),
                          const InputField(
                              label: 'Username or Email',
                              sizeoflabel: 18,
                              obscureText: false),
                          SizedBox(height: h(34)),
                          InputField(
                            label: 'Password',
                            sizeoflabel: 18,
                            obscureText: true,
                            widget: Container(
                              child: const AutoSizeText(
                                'Show',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'DavidLibre',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5B618A),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h(8),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: CustomCheckBox(true),
                              ),
                              SizedBox(
                                width: w(8),
                              ),
                              const AutoSizeText(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'DavidLibre',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5B618A),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h(45)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w(53)),
                            child: LogSignButton(label: 'Log in', ontap: () {}),
                          ),
                          SizedBox(height: h(20)),
                          Padding(
                            padding:
                                EdgeInsets.only(left: w(87), right: w(115)),
                            child: TextButton(
                              child: const AutoSizeText(
                                'Forget password?',
                                style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'DavidLibre',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF5B618A),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
