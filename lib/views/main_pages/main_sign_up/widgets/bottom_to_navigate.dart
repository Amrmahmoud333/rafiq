import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
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
          if (cubit.indexOfPageview == 0) {
            if (cubit.customValidteFirstName() &&
                cubit.customValidteLastName() &&
                cubit.customValidteUserName()) {
              cubit.setFirstSignUp(cubit.firstNameController.text,
                  cubit.lastNameController.text, cubit.userNameController.text);
              cubit.controllerpage.nextPage(
                duration: const Duration(
                  milliseconds: 750,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            } else {
              if (!cubit.customValidteFirstName() &&
                  cubit.customValidteLastName() &&
                  cubit.customValidteUserName()) {
                showValidationTosat(
                    context, 'Please enter your correct first name ');
              } else if (!cubit.customValidteLastName() &&
                  cubit.customValidteFirstName() &&
                  cubit.customValidteUserName()) {
                showValidationTosat(
                    context, 'Please enter your correct last name ');
              } else if (cubit.customValidteLastName() &&
                  cubit.customValidteFirstName() &&
                  !cubit.customValidteUserName()) {
                showValidationTosat(
                    context, 'Please enter your correct user name ');
              } else {
                showValidationTosat(context, 'Please enter your correct data ');
              }
            }
          } else if (cubit.indexOfPageview == 1) {
            if (cubit.customValidteEmail() &&
                cubit.customValidtePassword() &&
                cubit.customValidteConfirmPassword()) {
              cubit.setSecondSignUp(
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
              if (!cubit.customValidteEmail() &&
                  cubit.customValidtePassword() &&
                  cubit.customValidteConfirmPassword()) {
                showValidationTosat(
                    context, 'Please enter your correct email ');
              } else if (cubit.customValidteEmail() &&
                  !cubit.customValidtePassword() &&
                  cubit.customValidteConfirmPassword()) {
                showValidationTosat(
                    context, 'Please enter your correct password ');
              } else if (cubit.customValidteEmail() &&
                  cubit.customValidtePassword() &&
                  !cubit.customValidteConfirmPassword()) {
                showValidationTosat(
                    context, 'Please enter your correct Confirm password ');
              } else {
                showValidationTosat(context, 'Please enter your correct data ');
              }
            }
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
