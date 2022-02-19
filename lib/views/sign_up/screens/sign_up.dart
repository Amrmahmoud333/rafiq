import 'package:flutter/material.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/screens/second_sign_up.dart';
import 'package:rafiq/views/sign_up/widgets/horizontal_line.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = '/sign_up';
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
                  Align(alignment: Alignment.topCenter, child: TopCloud(false)),
                  Positioned(
                    top: height(190),
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
                        ),
                        SizedBox(
                          height: height(22),
                        ),
                        InputField(
                          label: 'Last Name',
                          sizeoflabel: 18,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: height(29),
                        ),
                        InputField(
                          label: 'Username',
                          sizeoflabel: 18,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: height(61),
                        ),
                        LogSignButton(
                          label: 'Next',
                          ontap: () {
                            Navigator.pushNamed(
                              context,
                              SecondSignUp.routeName,
                            );
                          },
                        ),
                        SizedBox(
                          height: height(1),
                        ),
                      ],
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
