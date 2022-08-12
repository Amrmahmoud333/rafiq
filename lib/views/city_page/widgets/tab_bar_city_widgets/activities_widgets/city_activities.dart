import 'package:flutter/material.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/activities_widgets/activity_widget.dart';

class CityActivities extends StatelessWidget {
  const CityActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ActivityWidget(),
      ],
    );
  }
}
