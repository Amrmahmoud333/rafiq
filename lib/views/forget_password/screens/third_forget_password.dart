import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';

class ThridForgetPassword extends StatefulWidget {
  const ThridForgetPassword({Key? key}) : super(key: key);
  static const routeName = '/third_forget_password';

  @override
  State<ThridForgetPassword> createState() => _ThridForgetPasswordState();
}

class _ThridForgetPasswordState extends State<ThridForgetPassword> {
  bool showPassowrd = true;
  bool showConfirmPassowrd = true;
  List<String> selectShowpassword = ['Show', 'Hide'];
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
          padding: EdgeInsets.only(
            left: width(16),
            right: width(16),
            top: height(61),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Forget password.png',
                width: width(295),
                height: height(217),
              ),
              SizedBox(
                height: height(37),
              ),
              const Center(
                child: AutoSizeText(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5B618A),
                  ),
                ),
              ),
              SizedBox(
                height: height(21),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AutoSizeText(
                    'Enter a ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF5B618A),
                    ),
                  ),
                  AutoSizeText(
                    'New Password.',
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF5B618A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height(16),
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
                        InputField(
                          label: 'Password',
                          sizeoflabel: 20,
                          obscureText: showPassowrd,
                          widget: InkWell(
                            onTap: () {
                              setState(() {
                                showPassowrd == true
                                    ? showPassowrd = false
                                    : showPassowrd = true;
                              });
                            },
                            child: AutoSizeText(
                              showPassowrd == true
                                  ? selectShowpassword[0]
                                  : selectShowpassword[1],
                              style: const TextStyle(
                                fontSize: 16,
                                //ناقص نوع الخط
                                color: Color(0xFF5B618A),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(44),
                        ),
                        InputField(
                          label: 'Confirm Password',
                          sizeoflabel: 20,
                          obscureText: showConfirmPassowrd,
                          widget: InkWell(
                            onTap: () {
                              setState(() {
                                showConfirmPassowrd == true
                                    ? showConfirmPassowrd = false
                                    : showConfirmPassowrd = true;
                              });
                            },
                            child: AutoSizeText(
                              showConfirmPassowrd == true
                                  ? selectShowpassword[0]
                                  : selectShowpassword[1],
                              style: const TextStyle(
                                fontSize: 16,
                                //ناقص نوع الخط
                                color: Color(0xFF5B618A),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(47),
                        ),
                        Center(
                          child: LogSignButton(
                            label: 'Reset',
                            ontap: () {
                              print('object');
                            },
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
