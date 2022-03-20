import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/profile/screens/profile_screen.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
import 'package:rafiq/views/sign_up/const/country_list.dart';
import 'package:rafiq/views/sign_up/screens/second_sign_up.dart';
import 'package:rafiq/views/sign_up/screens/sign_up.dart';
import 'package:rafiq/views/sign_up/screens/third_sign_up.dart';
import 'package:rafiq/views/sign_up/widget/container_choose.dart';
import 'package:rafiq/views/sign_up/widget/horizontal_line.dart';

class MainSignUpScreen extends StatelessWidget {
  const MainSignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/main_sign_up';
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = context.read<RegisterCubit>();
    PageController _controllerpage = PageController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height(851),
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  const Align(
                      alignment: Alignment.topCenter, child: TopCloud(false)),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomCLoud(),
                  ),
                  Positioned.fill(
                    top: 190,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            onPageChanged: (index) {
                              if (index == 2) {
                                cubit.IsLastPageInPageView(index);
                              } else
                                cubit.NotIsLastPageInPageView(index);

                              print(cubit.lable);
                              print(cubit);
                            },
                            //physics: NeverScrollableScrollPhysics(),
                            controller: _controllerpage,
                            children: [
                              SignUp(),
                              SecondSignUp(),
                              ThirdSignUp(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: height(210),
                    left: width(89),
                    child: BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) => LogSignButton(
                        label: cubit.lable,
                        ontap: () {
                          _controllerpage.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 35,
              child: Center(
                  child: Text(
                cubit.lable,
                style: TextStyle(fontSize: 25),
              )),
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String country) => DropdownMenuItem(
        value: country,
        child: AutoSizeText(
          country,
        ),
      );
}
