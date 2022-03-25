import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/data/models/register_model.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';

class BottomToNavigate extends StatelessWidget {
  const BottomToNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) => LogSignButton(
        label: cubit.lable,
        ontap: () {
          if (cubit.indexOfPageview == 0 &&
              cubit.formKey1.currentState!.validate()) {
            BlocProvider.of<RegisterCubit>(context).setFirstSignUp(
                cubit.firstNameController.text,
                cubit.lastNameController.text,
                cubit.userNameController.text);
            cubit.controllerpage.nextPage(
              duration: const Duration(
                milliseconds: 750,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          } else if (cubit.indexOfPageview == 1 &&
              cubit.formKey2.currentState!.validate()) {
            BlocProvider.of<RegisterCubit>(context).setSecondSignUp(
                cubit.emailController.text,
                cubit.passwordController.text,
                cubit.confirmPasswordController.text);
            cubit.controllerpage.nextPage(
              duration: const Duration(
                milliseconds: 500,
              ),
              curve: Curves.fastLinearToSlowEaseIn,
            );
          } else {
            BlocProvider.of<RegisterCubit>(context)
                .userRegister(RequsetRegisterModel(
              firstName: cubit.firstName,
              lastName: cubit.lastName,
              userName: cubit.userName,
              email: cubit.email,
              password: cubit.password,
              confirmPassword: cubit.confirmPassword,
              country: cubit.countryValue,
              gender: cubit.genderChoose,
              dateOfBirth:
                  '${cubit.dateTime.day}/${cubit.dateTime.month}/${cubit.dateTime.year}',
            ));
          }
        },
      ),
    );
  }
}
