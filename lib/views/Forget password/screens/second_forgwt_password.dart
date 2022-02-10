import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';

class SecondForgetPassword extends StatelessWidget {
  const SecondForgetPassword({Key? key}) : super(key: key);

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
              Image.asset(
                'assets/images/Forget password.png',
                width: width(295),
                height: height(217),
              ),
              const SizedBox(
                height: 37,
              ),
              const Center(
                child: AutoSizeText(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6E75A0),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AutoSizeText(
                    'Enter a ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF6E75A0),
                    ),
                  ),
                  AutoSizeText(
                    'New Password.',
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF6E75A0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                ),
                width: double.infinity,
                height: height(369),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: height(44)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InputField(
                          label: 'Password',
                          sizeoflabel: 20,
                        ),
                        const InputField(
                          label: 'Confirm Password',
                          sizeoflabel: 20,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
