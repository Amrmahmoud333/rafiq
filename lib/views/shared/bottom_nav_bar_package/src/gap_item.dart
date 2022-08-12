// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class GapItem extends StatelessWidget {
  final double width;

  GapItem({
    required this.width,
  });

  @override
  Widget build(BuildContext context) => Container(width: width);
}
