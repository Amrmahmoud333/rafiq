import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CutsomBottomNavigationBar extends StatelessWidget {
  CutsomBottomNavigationBar({Key? key}) : super(key: key);
  int currentIndex = 0;

  setBottomBarIndex(index) {
    /* setState(() {
      currentIndex = index;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: h(75),
          width: double.infinity,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(double.infinity, h(75)),
                painter: BNBCustomPainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Container(
                    width: w(65),
                    height: h(65),
                    child: const Icon(Icons.add),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color(0xffB99AC2), Color(0xff906F9ABD)])),
                  ),
                ),
              ),
              Container(
                height: h(80),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Color(0XFFE8DEEB),
                      child: SvgPicture.asset('assets/images/home_icon.svg'),
                    ),
                    Container(
                      child: SvgPicture.asset('assets/images/trip_icon.svg'),
                    ),
                    Container(
                      width: size.width * 0.20,
                    ),
                    Container(
                      child: SvgPicture.asset(
                          'assets/images/notifications_icon.svg'),
                    ),
                    Container(
                      child: SvgPicture.asset('assets/images/user_icon.svg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = const Color(0xffE8DEEB)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);

    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(15.0), clockwise: false);

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);

    path.quadraticBezierTo(size.width, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    //canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
