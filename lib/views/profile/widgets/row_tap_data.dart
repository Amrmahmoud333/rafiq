import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TapRowData extends StatelessWidget {
  const TapRowData({Key? key, required this.lable, this.widget})
      : super(key: key);
  final String lable;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 9,
        ),
        widget ?? Container(),
        AutoSizeText(lable),
      ],
    );
  }
}
