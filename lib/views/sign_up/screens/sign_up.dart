import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/widgets/horizontal_line.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
              height: height(20),
            ),
            const HorizontalLinee(),
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
                print(height(209));
              },
            ),
            SizedBox(
              height: height(1),
            ),
            SizedBox(
              width: double.infinity,
              height: height(209),
              child: const BottomCLoud(),
            )
          ],
        ),
      ),
    );
  }
}
