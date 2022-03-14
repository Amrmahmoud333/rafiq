import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/theme.dart';

class HorizontalLinee extends StatelessWidget {
  HorizontalLinee({
    required this.precent,
  });
  final int precent;
  double? w;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    if (precent == 0) {
      w = 0.0;
    } else if (precent == 35) {
      w = 104.3;
    } else {
      w = 209.0;
    }

    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: height(12),
              child: AutoSizeText(
                '$precent% completed',
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'DavidLibre',
                  color: Color(0xff5B618A),
                ),
              ),
            ),
            SizedBox(
              height: height(2),
            ),
            Container(
              width: width(313),
              height: height(14),
              decoration: BoxDecoration(
                color: const Color(0xffE8DEEB),

                border: Border.all(
                  color: const Color(0xff6E75A0),
                  width: 1,
                ), //Border.all
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    width: width(w!),
                    height: height(14),
                    decoration: BoxDecoration(
                      color: const Color(0xff6E75A0),

                      border: Border.all(
                        color: const Color(0xff6E75A0),
                        width: 1,
                      ), //Border.all
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
