import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/screens/second_sign_up.dart';
import 'package:rafiq/views/sign_up/screens/widget/thrid_widget.dart';
import 'package:rafiq/views/sign_up/widgets/horizontal_line.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int indx = 0;

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    List<Widget> widgets = [
      Column(
        children: [
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
        ],
      ),
      Column(
        children: [
          InputField(
            label: 'Email',
            sizeoflabel: 18,
            obscureText: false,
          ),
          SizedBox(
            height: height(22),
          ),
          InputField(
            label: 'Password',
            sizeoflabel: 18,
            obscureText: true,
            widget: InkWell(
                onTap: () {},
                child: const AutoSizeText(
                  'Show',
                  style: TextStyle(fontSize: 16),
                )),
          ),
          SizedBox(
            height: height(29),
          ),
          InputField(
            label: 'Confirm Password',
            sizeoflabel: 18,
            obscureText: true,
            widget: InkWell(
                onTap: () {
                  // TODO change obscureText
                },
                child: const AutoSizeText(
                  'Show',
                  style: TextStyle(fontSize: 16),
                )),
          ),
        ],
      ),
      ThirdWidget(),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopCloud('sign up'),
            SizedBox(
              height: height(15),
            ),
            HorizontalLinee(
              precent: 0,
            ),
            SizedBox(
              height: height(52),
            ),
            widgets[indx],
            SizedBox(
              height: height(61),
            ),
            LogSignButton(
              label: 'Next',
              ontap: () {
                setState(() {
                  indx++;
                });
              },
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
