import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CityInformation extends StatelessWidget {
  const CityInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AutoSizeText(
              'Roma',
              style: TextStyle(
                color: Color(0xff5B618A),
                fontFamily: 'DavidLibre',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            AutoSizeText(
              ' (Italy)',
              style: TextStyle(
                color: Color(0xff5B618A),
                fontFamily: 'DavidLibre',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: h(18)),
      ],
    );
  }
}
