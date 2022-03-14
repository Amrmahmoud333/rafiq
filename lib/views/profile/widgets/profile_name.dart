import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
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
      top: h(225),
      left: w(160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AutoSizeText(
            'Amr Mahmoud',
            style: TextStyle(
              color: Color(0xff5B618A),
              fontSize: 24,
              fontFamily: 'DavidLibre',
              fontWeight: FontWeight.bold,
            ),
          ),
          AutoSizeText(
            '  @AmrMa',
            style: TextStyle(
              color: Color(0xff5B618A),
              fontSize: 18,
              fontFamily: 'DavidLibre',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
