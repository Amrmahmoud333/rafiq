import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ContainerChoose extends StatelessWidget {
  final text;
  final width, height;
  bool _isChoosen;

  ContainerChoose(this.text, this.width, this.height, this._isChoosen,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _isChoosen ? const Color(0xFF5B618A) : Colors.white,
        border: Border.all(
          color: const Color(0xff6E75A0),
          width: 1,
        ), //Border.all
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: AutoSizeText(
          text,
          style: TextStyle(
            fontSize: 20,
            color: _isChoosen ? Colors.white : const Color(0xff5B618A),
            fontFamily: 'DavidLibre',
          ),
        ),
      ),
    );
  }
}
