import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/widgets/horizontal_line.dart';

class ThridSignUp extends StatelessWidget {
  const ThridSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopCloud(),
            SizedBox(
              height: height(15),
            ),
            const HorizontalLinee(
              precent: '70',
            ),
            SizedBox(
              height: height(52),
            ),
            InputField(
              label: 'Country',
              sizeoflabel: 18,
              obscureText: false,
            ),
            SizedBox(
              height: height(22),
            ),
            InputField(
              label: 'Date of birth',
              sizeoflabel: 18,
              obscureText: true,
            ),
            SizedBox(
              height: height(29),
            ),
            InputField(
              label: 'Gender',
              sizeoflabel: 18,
              obscureText: true,
            ),
            SizedBox(
              height: height(61),
            ),
            LogSignButton(
              label: 'Sign up',
              ontap: () {},
            ),
            SizedBox(
              height: height(1),
            ),
            const BottomCLoud(),
          ],
        ),
      ),
    );
  }
}
