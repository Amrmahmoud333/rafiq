import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';

class FirstForgetPassword extends StatelessWidget {
  const FirstForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFE3E3E3),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 40,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF000000),
                        size: 25,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/Forget password.png',
                        width: width(295),
                        height: height(217),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              const AutoSizeText(
                'Forget Password?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6E75A0),
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: AutoSizeText(
                  'Enter your username or your email address and we will send a link to reset your password.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6E75A0),
                  ),
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                ),
                width: double.infinity,
                height: height(218),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: InputField(
                          label: 'Username or Email',
                          sizeoflabel: 20,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 34,
                          ),
                          child: LogSignButton(
                            label: 'Send',
                            ontap: () {
                              print('object');
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
