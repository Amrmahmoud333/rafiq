import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/sign_up/widget/horizontal_line.dart';

class SignUp extends StatelessWidget {
  SignUp({
    Key? key,
  }) : super(key: key);
  static const routeName = '/sign_up';

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
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = BlocProvider.of<RegisterCubit>(context);
    return Form(
      key: cubit.formKey1,
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
            validator: customValidteFirstName,
          ),
          SizedBox(
            height: height(22),
          ),
          InputField(
            label: 'Last Name',
            sizeoflabel: 18,
            obscureText: false,
            controller: cubit.lastNameController,
            validator: customValidteLastName,
          ),
          SizedBox(
            height: height(29),
          ),
          InputField(
            label: 'Username',
            sizeoflabel: 18,
            obscureText: false,
            controller: cubit.userNameController,
            validator: customValidteUserName,
          ),

          /*   LogSignButton(
              label: 'Next',
              ontap: () {
                if (_fromKey.currentState!.validate()) {
                  BlocProvider.of<RegisterCubit>(context).setFirstSignUp(
                      firstNameController.text,
                      lastNameController.text,
                      userNameController.text);
                  Navigator.pushNamed(
                    context,
                    SecondSignUp.routeName,
                  );
                }
              },
            ),*/
        ],
      ),
    );
  }
}
