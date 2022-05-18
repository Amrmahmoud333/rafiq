import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    Key? key,
    required this.label,
    required this.ontap,
  }) : super(key: key);
  final String label;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return InkWell(
      onTap: ontap,
      child: Container(
        height: height(38),
        width: width(128),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF5B618A),
        ),
        child: Center(
          child: AutoSizeText(
            label,
            style: const TextStyle(
              color: Color(0xffE9DCEC),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
