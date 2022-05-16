import 'package:flutter/material.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/hotel_widget/hotel_widget.dart';

class CityHotels extends StatelessWidget {
  const CityHotels({Key? key}) : super(key: key);

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
        return const HotelWidget();
      },
      separatorBuilder: (context, index) => SizedBox(height: h(15)),
    );
  }
}
