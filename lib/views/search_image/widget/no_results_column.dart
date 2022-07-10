import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NoResultsColumn extends StatelessWidget {
  const NoResultsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Padding(
      padding: EdgeInsets.only(top: h(106)),
      child: Column(
        children: [
          const AutoSizeText(
            'No results yet',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xff5B618A),
            ),
          ),
          SizedBox(
            height: h(40),
          ),
          Image.asset(
            'assets/images/search_image/Search _Illustrator.png',
            width: w(340),
            height: h(340),
          ),
        ],
      ),
    );
  }
}
