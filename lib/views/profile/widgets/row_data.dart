import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowData extends StatelessWidget {
  const RowData({
    Key? key,
    @required this.imagePath,
    @required this.text,
    @required this.sizedWidth,
  }) : super(key: key);

  final String? imagePath;
  final String? text;
  final double? sizedWidth;
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Row(
      children: [
        SizedBox(
          width: w(14.75),
        ),
        SvgPicture.asset(
          imagePath!,
          width: w(17.82),
          height: h(17.82),
        ),
        SizedBox(
          width: w(sizedWidth!),
        ),

        //TODO get number of posts
        AutoSizeText(
          text!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Color(0xff5B618A),
          ),
        ),
        SizedBox(
          height: h(20),
        ),
      ],
    );
  }
}
