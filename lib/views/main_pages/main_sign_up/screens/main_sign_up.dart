import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/register_cubit/register_cubit.dart';
import 'package:rafiq/views/painter/bottom_cloud.dart';
import 'package:rafiq/views/painter/top_cloud.dart';
import 'package:rafiq/views/profile/screens/profile_screen.dart';
import 'package:rafiq/views/shared/input_field.dart';
import 'package:rafiq/views/shared/log_sign_button.dart';
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

    PageController _controllerpage = PageController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height(851),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Align(
                  alignment: Alignment.topCenter, child: TopCloud(false)),
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomCLoud(),
              ),
              Positioned(
                bottom: 170,
                child: TextButton(
                  onPressed: () {
                    print('dds');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProfileScreen();
                    }));
                  },
                  child: Text(
                    'ds',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              PageView(
                //   physics: NeverScrollableScrollPhysics(),
                controller: _controllerpage,
                children: [
                  Center(child: Text('data1')),
                  Center(child: Text('data2')),
                  Center(child: Text('data3')),
                ],
              ),
              Positioned(
                  bottom: height(210),
                  left: width(89),
                  child: LogSignButton(
                    label: 'sss',
                    ontap: () {
                      _controllerpage.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
