import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TapRowData extends StatelessWidget {
  const TapRowData({Key? key, required this.lable, this.widget})
      : super(key: key);
  final String lable;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return SizedBox(
      height: 35,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * (9 / 393),
          ),
          SizedBox(
            width: w(3),
          ),
          widget ?? Container(),
          AutoSizeText(lable),
        ],
      ),
    );
  }
}
