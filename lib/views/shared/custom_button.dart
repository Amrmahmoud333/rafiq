import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.ontap,
  }) : super(key: key);
  final String label;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return InkWell(
      onTap: ontap,
      child: Container(
        height: height(43),
        width: width(216),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF5B618A),
        ),
        child: Center(
          child: AutoSizeText(
            label,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 25,
              fontFamily: 'DavidLibre',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
