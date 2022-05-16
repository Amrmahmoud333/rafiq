import 'package:flutter/material.dart';
import 'package:rafiq/views/city_page/widgets/tab_bar_city_widgets/hotel_widget/hotel_widget.dart';

class CityHotels extends StatelessWidget {
  const CityHotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: h(15)),
          child: const HotelWidget(),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: h(15)),
    );
  }
}
