import 'package:flutter/material.dart';

class LogSinButton extends StatelessWidget {
  const LogSinButton({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      width: 216,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF6E75A0),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
