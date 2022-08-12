import 'package:flutter/material.dart';
import 'package:rafiq/views/shared/bottom_nav_bar_package/src/bubble_selection_painter.dart';

import 'tab_item.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isActive;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color? bubbleColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Widget? iconData;
  final double iconScale;
  final double? iconSize;
  final VoidCallback onTap;
  final Widget? child;
  final String? path;

  // ignore: prefer_const_constructors_in_immutables
  NavigationBarItem({
    Key? key,
    required this.isActive,
    required this.bubbleRadius,
    required this.maxBubbleRadius,
    required this.bubbleColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.iconData,
    required this.iconScale,
    required this.iconSize,
    required this.onTap,
    this.child,
    this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xffE8DEEB),
        child: CustomPaint(
          painter: BubblePainter(
            bubbleRadius: isActive ? bubbleRadius : 0,
            bubbleColor: bubbleColor,
            maxBubbleRadius: maxBubbleRadius,
          ),
          child: InkWell(
            child: TabItem(
              path: path!,
              isActive: isActive,
              iconData: iconData,
              iconSize: iconSize,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              child: child,
            ),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
