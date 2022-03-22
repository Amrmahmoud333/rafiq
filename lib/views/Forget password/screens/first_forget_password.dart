import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/data_API/authentication/forget_API.dart';
import 'package:rafiq/data/models/forget_model.dart';
import 'package:rafiq/logic/cubit/forget_cubit/forget_cubit.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';

class FirstForgetPassword extends StatelessWidget {
  FirstForgetPassword({Key? key}) : super(key: key);
  static const routeName = '/first_forget_password';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  String? customValidteEmail(String? email) {
    if (email!.isEmpty || email.length < 2 || email.length >= 35) {
      return 'Enter a Correct Email or User Name';
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
              Container(
                margin: EdgeInsets.only(left: width(3)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
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
              SizedBox(
                height: height(37),
              ),
              const AutoSizeText(
                'Forget Password?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6E75A0),
                ),
              ),
              SizedBox(
                height: height(31),
              ),
              Padding(
                padding: EdgeInsets.only(left: width(32), right: width(32)),
                child: const AutoSizeText(
                  'Enter your username or your email address and we will send a link to reset your password.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6E75A0),
                  ),
                ),
              ),
              SizedBox(
                height: height(37),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFFFFFFF),
                ),
                width: double.infinity,
                height: height(218),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width(32),
                    right: width(32),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height(35)),
                          child: InputField(
                            label: 'Username or Email',
                            sizeoflabel: 20,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailcontroller,
                            validator: customValidteEmail,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: height(34),
                            ),
                            child: LogSignButton(
                              label: 'Send',
                              ontap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await BlocProvider.of<ForgetCubit>(context)
                                      .forgetPassword(
                                    RequestForgetModel(emailcontroller.text),
                                  );
                                }
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
