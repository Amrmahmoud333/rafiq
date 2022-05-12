import 'package:flutter/material.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/images.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/map.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/posts.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/videos/videos.dart';

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(9)),
      child: Container(
        color: const Color(0xffEFE7F2),
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [const Posts(), Images(), const Videos(), Maps()],
        ),
      ),
    );
  }
}
