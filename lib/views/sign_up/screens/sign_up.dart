import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/models/login_model.dart';
import 'package:rafiq/data/models/register_model.dart';
import 'package:rafiq/logic/cubit/login_cubit/cubit/login_cubit.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
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
    if (!(RegExp(r'^[a-zA-Z]{2,35}$').hasMatch(firstName!))) {
      return 'Enter a correct first name';
    } else {
      return null;
    }
  }

  String? customValidteLastName(String? lastName) {
    if (!(RegExp(r'^[a-zA-Z]{2,35}$').hasMatch(lastName!))) {
      return 'Enter a correct last name';
    } else {
      return null;
    }
  }

  bool? checkTwoSpace(String? userName) {
    bool b = false;
    for (int i = 0; i < userName!.length; i++) {
      if (userName[i] == ' ' && userName[i + 1] == ' ') {
        b == true;
      }
    }
    return b;
  }

  String? customValidteUserName(String? userName) {
    bool b = false;
    // dont work
    for (int i = 1; i < userName!.length; i++) {
      if (userName[i] == ' ' && userName[i + 1] == ' ') {
        b == true;
      }
    }
    if (!(RegExp(r'^[a-z A-Z0-9]{2,35}$').hasMatch(userName))) {
      if (b == true) {
        return 'Enter a Correct user name';
      } else {
        return 'Enter a Correct user name';
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    RequsetRegisterModel authRequsetModel = RequsetRegisterModel(
      firstName: "afgdfmdr",
      lastName: "afgdfdmr",
      userName: "amrma",
      email: "amr@gmail.com",
      password: "password",
      confirmPassword: "password",
      country: "Egypt",
      gender: "Male",
      dateOfBirth: "2000-02-01",
    );

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
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomCLoud(),
                  ),
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
                                BlocProvider.of<RegisterCubit>(context)
                                    .userRegister(authRequsetModel);
                                BlocProvider.of<LoginCubit>(context).login(
                                    RequestLoginModel(
                                        userName: 'amrma',
                                        password: 'password'));
                                print(ACCESSTOKEN);
                                /*  Navigator.pushNamed(
                                  context,
                                  SecondSignUp.routeName,
                                );*/
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
