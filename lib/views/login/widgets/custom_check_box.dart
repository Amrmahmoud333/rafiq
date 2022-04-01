import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool _value;
  const CustomCheckBox(this._value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      width: w(15),
      height: h(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff6E75A0),
          width: 1.5,
        ),
      ),
      child: _value
          ? Container(
              margin: const EdgeInsets.all(1.5),
              width: w(8),
              height: h(8),
              color: const Color(0xff6E75A0),
            )
          : Container(
              width: w(8),
              height: h(8),
              color: Colors.white,
            ),
    );
  }
}
