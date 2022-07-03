import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/core/components/components.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: h(13),
                    ),
                    //Row content country Name and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AutoSizeText(
                          ' Egypt, Aswan',
                          style: TextStyle(
                            color: Color(0xff5B618A),
                            fontFamily: 'DavidLibre',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        AutoSizeText(
                          '360 EGP',
                          style: TextStyle(
                            color: Color(0xff5B618A),
                            fontFamily: 'DavidLibre',
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: w(13),
                        top: h(11),
                      ),
                      child: const AutoSizeText(
                        'Aswan is known for its beautiful Nile Valley scenery, significant archaeological sites and its peaceful aura. Its weather is warm all year round, which makes it a perfect winter destination.',
                        style: TextStyle(
                          color: Color(0xff5B618A),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DavidLibre',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w(20), right: w(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildRating(5.0),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/city_icons/location.svg'),
                                const AutoSizeText(
                                  'Location',
                                  style: TextStyle(
                                    color: Color(0xff5B618A),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'DavidLibre',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
