import 'package:flutter/material.dart';
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
              width: width(293),
              height: height(209),
              fit: BoxFit.fill,
            ),
          ),
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
