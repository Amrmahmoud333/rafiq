import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/screens/third_sign_up.dart';
import 'package:rafiq/views/sign_up/widget/horizontal_line.dart';

class SecondSignUp extends StatelessWidget {
  SecondSignUp({Key? key}) : super(key: key);
  static const routeName = '/second_sign_up';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? customValidteEmail(String? email) {
    if (!(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!))) {
      return 'Enter a correct email';
    } else {
      return null;
    }
  }

  String? customValidtePassword(String? password) {
    if (password!.length < 8 || password.length > 64) {
      return 'Enter a correct password';
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

    return SingleChildScrollView(
      child: Form(
        //  key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: height(20),
            ),
            HorizontalLinee(
              precent: 35,
            ),
            SizedBox(
              height: height(52),
            ),
            InputField(
              label: 'Email',
              sizeoflabel: 18,
              obscureText: false,
              controller: emailController,
              validator: customValidteEmail,
            ),
            SizedBox(
              height: height(22),
            ),
            BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
              return InputField(
                label: 'Password',
                sizeoflabel: 18,
                obscureText: context.read<RegisterCubit>().firstObscureText,
                validator: customValidtePassword,
                controller: passwordController,
                widget: InkWell(
                  onTap: () {
                    context.read<RegisterCubit>().changeFirstObscureText();
                  },
                  child: AutoSizeText(
                    context.read<RegisterCubit>().firstObscureText
                        ? 'Show'
                        : 'Hide',
                    style: TextStyle(fontSize: 16, color: Color(0xff5B618A)),
                  ),
                ),
              );
            }),
            SizedBox(
              height: height(29),
            ),
            BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
              return InputField(
                label: 'Confirm Password',
                sizeoflabel: 18,
                obscureText: context.read<RegisterCubit>().secondObscureText,
                validator: customValidtePassword,
                controller: confirmPasswordController,
                widget: InkWell(
                  onTap: () {
                    context.read<RegisterCubit>().changeSecondObscureText();
                  },
                  child: AutoSizeText(
                    context.read<RegisterCubit>().secondObscureText
                        ? 'Show'
                        : 'Hide',
                    style: TextStyle(fontSize: 16, color: Color(0xff5B618A)),
                  ),
                ),
              );
            }),
            SizedBox(
              height: height(61),
            ),
            /* LogSignButton(
                label: 'Next',
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<RegisterCubit>(context).setSecondSignUp(
                        emailController.text,
                        passwordController.text,
                        confirmPasswordController.text);
                    Navigator.pushNamed(context, ThirdSignUp.routeName);
                  }
                },
              ),*/
          ],
        ),
      ),
    );
  }
}
