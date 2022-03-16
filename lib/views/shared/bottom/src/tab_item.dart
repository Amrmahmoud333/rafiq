import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final Widget? iconData;
  final double? iconSize;
  final bool isActive;
  final Color? activeColor;
  final Color? inactiveColor;
  final Widget? child;

  const TabItem({
    Key? key,
    required this.isActive,
    this.iconData,
    this.iconSize = 24,
    this.activeColor = Colors.deepPurpleAccent,
    this.inactiveColor = Colors.black,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child ??
        Container(
          width: MediaQuery.of(context).size.height * (41 / 851),
          height: MediaQuery.of(context).size.width * (37 / 393),
          child: iconData,
          color: isActive ? activeColor : inactiveColor,
          //size: iconSize,
        );
  }
}
