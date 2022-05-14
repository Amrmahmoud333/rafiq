import 'package:flutter/material.dart';

class LoveCityButton extends StatelessWidget {
  const LoveCityButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Positioned(
      top: h(193),
      left: w(352),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, EditScreen.routeName);
        },
        child: Container(
            width: w(29),
            height: h(27),
            decoration: BoxDecoration(
              color: const Color(0xffE8DEEB),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff5B618A).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Color(0XFF5B618A),
              size: 23,
            )),
      ),
    );
  }
}
