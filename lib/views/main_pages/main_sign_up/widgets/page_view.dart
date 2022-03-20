import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/sign_up/screens/second_sign_up.dart';
import 'package:rafiq/views/sign_up/screens/sign_up.dart';
import 'package:rafiq/views/sign_up/screens/third_sign_up.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return Expanded(
      child: PageView(
        onPageChanged: (index) {
          if (index == 2) {
            cubit.IsLastPageInPageView(index);
          } else
            cubit.NotIsLastPageInPageView(index);

          print(cubit.lable);
          print(cubit);
        },
        physics: NeverScrollableScrollPhysics(),
        controller: cubit.controllerpage,
        children: [
          SignUp(),
          SecondSignUp(),
          ThirdSignUp(),
        ],
      ),
    );
  }
}