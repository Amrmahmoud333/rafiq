import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/main_pages/main_sign_up/sign_up_classes/widget/horizontal_line.dart';
import 'package:rafiq/views/shared/input_field.dart';

class SignUp extends StatelessWidget {
  SignUp({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    var cubit = BlocProvider.of<RegisterCubit>(context);
    return Form(
      key: formKey,
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
            controller: cubit.firstNameController,
            //validator: customValidteFirstName,
          ),
          SizedBox(
            height: height(22),
          ),
          InputField(
            label: 'Last Name',
            sizeoflabel: 18,
            obscureText: false,
            controller: cubit.lastNameController,
            //validator: customValidteLastName,
          ),
          SizedBox(
            height: height(29),
          ),
          InputField(
            label: 'Username',
            sizeoflabel: 18,
            obscureText: false,
            controller: cubit.userNameController,
            // validator: customValidteUserName,
          ),
        ],
      ),
    );
  }
}
