import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomCLoud extends StatelessWidget {
  const BottomCLoud({Key? key}) : super(key: key);

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
          Container(
            width: double.infinity,
            height: height(209),
            child: SvgPicture.asset(
              'assets/images/bottom_cloud.svg',
              width: width(295),
              height: height(217),
              fit: BoxFit.cover,
            ),
          ),
          /*   Positioned(
            top: height(42),
            left: width(0),
            child: SvgPicture.asset(
              'assets/images/Path.svg',
              height: height(43),
            ),
          ),*/
          Positioned(
            top: height(114.83),
            left: width(137),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/gmail.svg',
                height: height(68),
                width: width(68),
              ),
            ),
          ),
          Positioned(
            top: height(114.83),
            left: width(214.33),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/images/facebook.svg',
                height: height(68),
                width: width(68),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustombottomCloud extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 393;
    final double _yScaling = size.height / 209;
    path.lineTo(14.7461 * _xScaling, 59.2266 * _yScaling);
    path.cubicTo(
      14.7461 * _xScaling,
      59.2266 * _yScaling,
      31.8203 * _xScaling,
      50.0234 * _yScaling,
      31.8203 * _xScaling,
      50.0234 * _yScaling,
    );
    path.cubicTo(
      31.8203 * _xScaling,
      50.0234 * _yScaling,
      43.1992 * _xScaling,
      51.793 * _yScaling,
      43.1992 * _xScaling,
      51.793 * _yScaling,
    );
    path.cubicTo(
      10.1992 * _xScaling,
      51.793 * _yScaling,
      54.2305 * _xScaling,
      56.0391 * _yScaling,
      54.2305 * _xScaling,
      56.0391 * _yScaling,
    );
    path.cubicTo(
      35.2305 * _xScaling,
      60.0391 * _yScaling,
      82.3281 * _xScaling,
      87.2813 * _yScaling,
      82.3281 * _xScaling,
      77.2813 * _yScaling,
    );
    path.cubicTo(
      82.3281 * _xScaling,
      77.2813 * _yScaling,
      93.7109 * _xScaling,
      74.8008 * _yScaling,
      93.7109 * _xScaling,
      74.8008 * _yScaling,
    );
    path.cubicTo(
      93.7109 * _xScaling,
      74.8008 * _yScaling,
      110.43 * _xScaling,
      54.625 * _yScaling,
      110.43 * _xScaling,
      54.625 * _yScaling,
    );
    path.cubicTo(
      110.43 * _xScaling,
      54.625 * _yScaling,
      121.102 * _xScaling,
      50.0234 * _yScaling,
      121.102 * _xScaling,
      50.0234 * _yScaling,
    );
    path.cubicTo(
      121.102 * _xScaling,
      50.0234 * _yScaling,
      148.133 * _xScaling,
      50.0234 * _yScaling,
      148.133 * _xScaling,
      50.0234 * _yScaling,
    );
    path.cubicTo(
      148.133 * _xScaling,
      50.0234 * _yScaling,
      173.387 * _xScaling,
      67.7227 * _yScaling,
      173.387 * _xScaling,
      67.7227 * _yScaling,
    );
    path.cubicTo(
      173.387 * _xScaling,
      67.7227 * _yScaling,
      185.125 * _xScaling,
      67.7227 * _yScaling,
      185.125 * _xScaling,
      67.7227 * _yScaling,
    );
    path.cubicTo(
      185.125 * _xScaling,
      67.7227 * _yScaling,
      195.086 * _xScaling,
      64.5352 * _yScaling,
      195.086 * _xScaling,
      64.5352 * _yScaling,
    );
    path.cubicTo(
      195.086 * _xScaling,
      64.5352 * _yScaling,
      207.18 * _xScaling,
      56.0391 * _yScaling,
      207.18 * _xScaling,
      56.0391 * _yScaling,
    );
    path.cubicTo(
      207.18 * _xScaling,
      56.0391 * _yScaling,
      219.984 * _xScaling,
      54.625 * _yScaling,
      219.984 * _xScaling,
      54.625 * _yScaling,
    );
    path.cubicTo(
      219.984 * _xScaling,
      54.625 * _yScaling,
      240.969 * _xScaling,
      59.2266 * _yScaling,
      240.969 * _xScaling,
      59.2266 * _yScaling,
    );
    path.cubicTo(
      240.969 * _xScaling,
      59.2266 * _yScaling,
      271.914 * _xScaling,
      77.2813 * _yScaling,
      271.914 * _xScaling,
      77.2813 * _yScaling,
    );
    path.cubicTo(
      271.914 * _xScaling,
      77.2813 * _yScaling,
      292.438 * _xScaling,
      77.2813 * _yScaling,
      292.438 * _xScaling,
      77.2813 * _yScaling,
    );
    path.cubicTo(
      292.438 * _xScaling,
      77.2813 * _yScaling,
      309.547 * _xScaling,
      67.7266 * _yScaling,
      309.547 * _xScaling,
      67.7266 * _yScaling,
    );
    path.cubicTo(
      309.547 * _xScaling,
      67.7266 * _yScaling,
      392.781 * _xScaling,
      0.00390625 * _yScaling,
      392.781 * _xScaling,
      0.00390625 * _yScaling,
    );
    path.cubicTo(
      392.781 * _xScaling,
      0.00390625 * _yScaling,
      393 * _xScaling,
      209.191 * _yScaling,
      393 * _xScaling,
      209.191 * _yScaling,
    );
    path.cubicTo(
      393 * _xScaling,
      209.191 * _yScaling,
      0 * _xScaling,
      209.191 * _yScaling,
      0 * _xScaling,
      209.191 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      209.191 * _yScaling,
      0 * _xScaling,
      86.5 * _yScaling,
      0 * _xScaling,
      86.5 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      86.5 * _yScaling,
      14.7461 * _xScaling,
      59.2266 * _yScaling,
      14.7461 * _xScaling,
      59.2266 * _yScaling,
    );
    path.lineTo(14.7461 * _xScaling, 59.2266 * _yScaling);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
