import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddContainer extends StatelessWidget {
  AddContainer({
    Key? key,
    required this.path,
    required this.text,
  }) : super(key: key);

  String path, text;

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      width: w(355),
      height: h(66),
      decoration: BoxDecoration(
        color: const Color(0xFFE8DEEB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff5B618A), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: w(20)),
          SvgPicture.asset(
            path,
            width: w(40),
            height: h(35),
          ),
          SizedBox(width: w(13)),
          AutoSizeText(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFF6E75A0),
            ),
          )
        ],
      ),
    );
  }
}
