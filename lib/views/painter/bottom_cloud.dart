import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          ClipPath(
            clipper: CustombottomCloud(),
            child: Container(
              width: double.infinity,
              height: height(209),
              color: const Color(0xffE8DEEB),
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
    path.lineTo(14.746 * _xScaling, 59.509 * _yScaling);
    path.cubicTo(
      14.746 * _xScaling,
      59.509 * _yScaling,
      31.82 * _xScaling,
      50.261 * _yScaling,
      31.82 * _xScaling,
      50.261 * _yScaling,
    );
    path.cubicTo(
      31.82 * _xScaling,
      50.261 * _yScaling,
      43.2 * _xScaling,
      52.04 * _yScaling,
      43.2 * _xScaling,
      52.04 * _yScaling,
    );
    path.cubicTo(
      43.2 * _xScaling,
      52.04 * _yScaling,
      54.229 * _xScaling,
      56.308 * _yScaling,
      54.229 * _xScaling,
      56.308 * _yScaling,
    );
    path.cubicTo(
      54.229 * _xScaling,
      56.308 * _yScaling,
      82.32900000000001 * _xScaling,
      77.65 * _yScaling,
      82.32900000000001 * _xScaling,
      77.65 * _yScaling,
    );
    path.cubicTo(
      82.32900000000001 * _xScaling,
      77.65 * _yScaling,
      93.71100000000001 * _xScaling,
      75.16 * _yScaling,
      93.71100000000001 * _xScaling,
      75.16 * _yScaling,
    );
    path.cubicTo(
      93.71100000000001 * _xScaling,
      75.16 * _yScaling,
      110.429 * _xScaling,
      54.885000000000005 * _yScaling,
      110.429 * _xScaling,
      54.885000000000005 * _yScaling,
    );
    path.cubicTo(
      110.429 * _xScaling,
      54.885000000000005 * _yScaling,
      121.1 * _xScaling,
      50.261 * _yScaling,
      121.1 * _xScaling,
      50.261 * _yScaling,
    );
    path.cubicTo(
      121.1 * _xScaling,
      50.261 * _yScaling,
      148.13299999999998 * _xScaling,
      50.261 * _yScaling,
      148.13299999999998 * _xScaling,
      50.261 * _yScaling,
    );
    path.cubicTo(
      148.13299999999998 * _xScaling,
      50.261 * _yScaling,
      173.38799999999998 * _xScaling,
      68.045 * _yScaling,
      173.38799999999998 * _xScaling,
      68.045 * _yScaling,
    );
    path.cubicTo(
      173.38799999999998 * _xScaling,
      68.045 * _yScaling,
      185.12599999999998 * _xScaling,
      68.045 * _yScaling,
      185.12599999999998 * _xScaling,
      68.045 * _yScaling,
    );
    path.cubicTo(
      185.12599999999998 * _xScaling,
      68.045 * _yScaling,
      195.08499999999998 * _xScaling,
      64.845 * _yScaling,
      195.08499999999998 * _xScaling,
      64.845 * _yScaling,
    );
    path.cubicTo(
      195.08499999999998 * _xScaling,
      64.845 * _yScaling,
      207.17899999999997 * _xScaling,
      56.309000000000005 * _yScaling,
      207.17899999999997 * _xScaling,
      56.309000000000005 * _yScaling,
    );
    path.cubicTo(
      207.17899999999997 * _xScaling,
      56.309000000000005 * _yScaling,
      219.98399999999998 * _xScaling,
      54.886 * _yScaling,
      219.98399999999998 * _xScaling,
      54.886 * _yScaling,
    );
    path.cubicTo(
      219.98399999999998 * _xScaling,
      54.886 * _yScaling,
      240.97 * _xScaling,
      59.509 * _yScaling,
      240.97 * _xScaling,
      59.509 * _yScaling,
    );
    path.cubicTo(
      240.97 * _xScaling,
      59.509 * _yScaling,
      271.916 * _xScaling,
      77.65 * _yScaling,
      271.916 * _xScaling,
      77.65 * _yScaling,
    );
    path.cubicTo(
      271.916 * _xScaling,
      77.65 * _yScaling,
      292.439 * _xScaling,
      77.65 * _yScaling,
      292.439 * _xScaling,
      77.65 * _yScaling,
    );
    path.cubicTo(
      292.439 * _xScaling,
      77.65 * _yScaling,
      309.548 * _xScaling,
      68.05 * _yScaling,
      309.548 * _xScaling,
      68.05 * _yScaling,
    );
    path.cubicTo(
      309.548 * _xScaling,
      68.05 * _yScaling,
      392.781 * _xScaling,
      0.003999999999990678 * _yScaling,
      392.781 * _xScaling,
      0.003999999999990678 * _yScaling,
    );
    path.cubicTo(
      392.781 * _xScaling,
      0.003999999999990678 * _yScaling,
      393 * _xScaling,
      210.191 * _yScaling,
      393 * _xScaling,
      210.191 * _yScaling,
    );
    path.cubicTo(
      393 * _xScaling,
      210.191 * _yScaling,
      0 * _xScaling,
      210.191 * _yScaling,
      0 * _xScaling,
      210.191 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      210.191 * _yScaling,
      0 * _xScaling,
      86.91300000000001 * _yScaling,
      0 * _xScaling,
      86.91300000000001 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      86.91300000000001 * _yScaling,
      14.746 * _xScaling,
      59.509 * _yScaling,
      14.746 * _xScaling,
      59.509 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
