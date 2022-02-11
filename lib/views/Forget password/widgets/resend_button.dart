import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ResendButton extends StatelessWidget {
  const ResendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: width(1),
              color: const Color(0xFF5B618A),
            ),
          ),
        ),
        child: const AutoSizeText(
          'Resend',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF5B618A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
