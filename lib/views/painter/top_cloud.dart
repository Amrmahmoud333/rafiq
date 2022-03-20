import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/sign_up/screens/sign_up.dart';

import '../main_pages/main_sign_up/screens/main_sign_up.dart';

class TopCloud extends StatelessWidget {
  final bool _isLogin;

  const TopCloud(this._isLogin, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Material(
      child: Stack(
        children: [
          SizedBox(
            height: height(207),
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/top_cloud.svg',
              width: width(392),
              height: height(207),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width(38), height(64), 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: _isLogin
                      ? const AutoSizeText(
                          'Log in',
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'DavidLibre',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6E75A0),
                          ),
                        )
                      : const AutoSizeText(
                          'Log in',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'DavidLibre',
                            color: Color(0xff6E75A0),
                          ),
                        ),
                ),
                Container(
                  height: height(28),
                  width: width(2),
                  color: const Color(0xff6E75A0),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, MainSignUpScreen.routeName);
                  },
                  child: _isLogin == false
                      ? const AutoSizeText(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'DavidLibre',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6E75A0),
                          ),
                        )
                      : const AutoSizeText(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff6E75A0),
                            fontFamily: 'DavidLibre',
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
