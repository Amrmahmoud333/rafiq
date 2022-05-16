import 'package:flutter/material.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/activities_widgets/city_activities.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/city_images.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/city_posts_widgets/city_posts.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/hotel_widget/hotel_widget.dart';

class TabBarCityView extends StatelessWidget {
  const TabBarCityView({Key? key, required this.tabController})
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
          children: const [
            CityPost(),
            CityImages(),
            CityActivities(),
            CityHotels()
          ],
        ),
      ),
    );
  }
}
