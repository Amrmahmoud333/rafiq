import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class SwiperTripWidget extends StatelessWidget {
  const SwiperTripWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Swiper(
      itemBuilder: ((context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/images/test.jpg',
            fit: BoxFit.fill,
          ),
        );
      }),
      itemCount: 3,
      itemWidth: w(320.0),
      itemHeight: h(400.0),
      layout: SwiperLayout.STACK,
      axisDirection: AxisDirection.right,
      onIndexChanged: (index) {},
      onTap: (index) {},
    );
  }
}
