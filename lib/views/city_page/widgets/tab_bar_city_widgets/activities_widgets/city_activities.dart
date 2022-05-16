import 'package:flutter/material.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/activities_widgets/activity_widget.dart';

class CityActivities extends StatelessWidget {
  const CityActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
            width: w(345),
            //     height: h(373),
            decoration: BoxDecoration(
              //   color: const Color(0xff5B618A),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const ActivityWidget());
      },
      separatorBuilder: (context, index) => SizedBox(height: h(15)),
    );
  }
}
