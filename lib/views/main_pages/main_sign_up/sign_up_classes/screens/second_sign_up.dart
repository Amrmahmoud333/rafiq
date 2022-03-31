import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/widget/horizontal_line.dart';
import 'package:rafiq/views/shared/input_field.dart';

class SecondSignUp extends StatelessWidget {
  SecondSignUp({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    var cubit = context.read<RegisterCubit>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
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
              controller: cubit.emailController,
              //validator: customValidteEmail,
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
                //  validator: customValidtePassword,
                controller: cubit.passwordController,
                widget: InkWell(
                  onTap: () {
                    cubit.changeFirstObscureText();
                  },
                  child: AutoSizeText(
                    cubit.firstObscureText ? 'Show' : 'Hide',
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xff5B618A)),
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
                obscureText: cubit.secondObscureText,
                //  validator: customValidtePassword,
                controller: cubit.confirmPasswordController,
                widget: InkWell(
                  onTap: () {
                    cubit.changeSecondObscureText();
                  },
                  child: AutoSizeText(
                    cubit.secondObscureText ? 'Show' : 'Hide',
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xff5B618A)),
                  ),
                ),
              );
            }),
            SizedBox(
              height: height(61),
            ),
          ],
        ),
      ),
    );
  }
}
