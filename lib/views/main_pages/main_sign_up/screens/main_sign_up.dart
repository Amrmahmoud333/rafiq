import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/main_pages/main_sign_up/widgets/bottom_to_navigate.dart';
import 'package:rafiq/views/main_pages/main_sign_up/widgets/page_view.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';

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
                  Positioned.fill(
                    top: 190,
                    child: Column(
                      children: [
                        PageViewWidget(),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: height(210),
                    left: width(89),
                    child: BottomToNavigate(),
                  ),
                ],
              ),
            ),
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
