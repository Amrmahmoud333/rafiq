import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      // width: w(345),
      height: h(373),
      decoration: BoxDecoration(
        color: const Color(0xff5B618A),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
