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

    return SizedBox(
      height: h(800),
      child: Swiper(
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                height: h(300),
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.asset('assets/images/test2.png')),
              ),
            ],
          );
        }),
        itemCount: 3,
        itemWidth: w(320.0),
        itemHeight: h(700.0),
        layout: SwiperLayout.STACK,
        axisDirection: AxisDirection.right,

        onIndexChanged: (index) {},
        onTap: (index) {},
        // containerWidth: w(200.0),
      ),
    );
  }
}
