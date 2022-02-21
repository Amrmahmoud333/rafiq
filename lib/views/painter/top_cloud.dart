import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/views/login/screens/login_screen.dart';
import 'package:rafiq/views/sign_up/screens/sign_up.dart';

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
                    Navigator.pushReplacementNamed(context, SignUp.routeName);
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

class CustomTopCloud extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 393;
    final double _yScaling = size.height / 167.34;
    path.lineTo(177.867 * _xScaling, 158.238 * _yScaling);
    path.cubicTo(
      169.648 * _xScaling,
      162.02 * _yScaling,
      159.945 * _xScaling,
      162.051 * _yScaling,
      151.695 * _xScaling,
      158.332 * _yScaling,
    );
    path.cubicTo(
      143.438 * _xScaling,
      154.609 * _yScaling,
      137.602 * _xScaling,
      147.57 * _yScaling,
      135.941 * _xScaling,
      139.336 * _yScaling,
    );
    path.cubicTo(
      135.941 * _xScaling,
      139.336 * _yScaling,
      135.941 * _xScaling,
      139.305 * _yScaling,
      135.941 * _xScaling,
      139.305 * _yScaling,
    );
    path.cubicTo(
      129.168 * _xScaling,
      137.41 * _yScaling,
      123.188 * _xScaling,
      133.699 * _yScaling,
      118.785 * _xScaling,
      128.656 * _yScaling,
    );
    path.cubicTo(
      108.828 * _xScaling,
      133.688 * _yScaling,
      96.9844 * _xScaling,
      134.629 * _yScaling,
      86.2188 * _xScaling,
      131.242 * _yScaling,
    );
    path.cubicTo(
      86.2188 * _xScaling,
      131.242 * _yScaling,
      84.9102 * _xScaling,
      130.832 * _yScaling,
      84.9102 * _xScaling,
      130.832 * _yScaling,
    );
    path.cubicTo(
      76.5078 * _xScaling,
      143.215 * _yScaling,
      60.7305 * _xScaling,
      149.801 * _yScaling,
      44.9102 * _xScaling,
      147.527 * _yScaling,
    );
    path.cubicTo(
      29.0859 * _xScaling,
      145.25 * _yScaling,
      16.3125 * _xScaling,
      134.566 * _yScaling,
      12.5117 * _xScaling,
      120.43 * _yScaling,
    );
    path.cubicTo(
      8.20313 * _xScaling,
      120.488 * _yScaling,
      3.93359 * _xScaling,
      119.676 * _yScaling,
      0.0117188 * _xScaling,
      118.059 * _yScaling,
    );
    path.cubicTo(
      0.0117188 * _xScaling,
      118.059 * _yScaling,
      0.0117188 * _xScaling,
      0.00390625 * _yScaling,
      0.0117188 * _xScaling,
      0.00390625 * _yScaling,
    );
    path.cubicTo(
      0.0117188 * _xScaling,
      0.00390625 * _yScaling,
      392.012 * _xScaling,
      0.00390625 * _yScaling,
      392.012 * _xScaling,
      0.00390625 * _yScaling,
    );
    path.cubicTo(
      392.012 * _xScaling,
      0.00390625 * _yScaling,
      392.012 * _xScaling,
      133.766 * _yScaling,
      392.012 * _xScaling,
      133.766 * _yScaling,
    );
    path.cubicTo(
      387 * _xScaling,
      139.578 * _yScaling,
      380.141 * _xScaling,
      143.852 * _yScaling,
      372.363 * _xScaling,
      146.008 * _yScaling,
    );
    path.cubicTo(
      357.043 * _xScaling,
      150.266 * _yScaling,
      340.406 * _xScaling,
      145.746 * _yScaling,
      330.172 * _xScaling,
      134.551 * _yScaling,
    );
    path.cubicTo(
      321.949 * _xScaling,
      138.328 * _yScaling,
      312.25 * _xScaling,
      138.363 * _yScaling,
      303.996 * _xScaling,
      134.641 * _yScaling,
    );
    path.cubicTo(
      295.746 * _xScaling,
      130.918 * _yScaling,
      289.906 * _xScaling,
      123.879 * _yScaling,
      288.246 * _xScaling,
      115.648 * _yScaling,
    );
    path.cubicTo(
      288.246 * _xScaling,
      115.648 * _yScaling,
      288.246 * _xScaling,
      115.617 * _yScaling,
      288.246 * _xScaling,
      115.617 * _yScaling,
    );
    path.cubicTo(
      286.324 * _xScaling,
      115.078 * _yScaling,
      284.457 * _xScaling,
      114.391 * _yScaling,
      282.668 * _xScaling,
      113.563 * _yScaling,
    );
    path.cubicTo(
      277.887 * _xScaling,
      127.109 * _yScaling,
      264.867 * _xScaling,
      136.891 * _yScaling,
      249.32 * _xScaling,
      138.613 * _yScaling,
    );
    path.cubicTo(
      249.32 * _xScaling,
      138.613 * _yScaling,
      247.945 * _xScaling,
      138.766 * _yScaling,
      247.945 * _xScaling,
      138.766 * _yScaling,
    );
    path.cubicTo(
      246.375 * _xScaling,
      153.242 * _yScaling,
      235.379 * _xScaling,
      165.441 * _yScaling,
      220.063 * _xScaling,
      169.703 * _yScaling,
    );
    path.cubicTo(
      216.297 * _xScaling,
      170.75 * _yScaling,
      212.383 * _xScaling,
      171.281 * _yScaling,
      208.445 * _xScaling,
      171.281 * _yScaling,
    );
    path.cubicTo(
      196.625 * _xScaling,
      171.281 * _yScaling,
      185.418 * _xScaling,
      166.5 * _yScaling,
      177.867 * _xScaling,
      158.238 * _yScaling,
    );
    path.cubicTo(
      177.867 * _xScaling,
      158.238 * _yScaling,
      177.867 * _xScaling,
      158.238 * _yScaling,
      177.867 * _xScaling,
      158.238 * _yScaling,
    );
    path.lineTo(177.867 * _xScaling, 158.238 * _yScaling);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
