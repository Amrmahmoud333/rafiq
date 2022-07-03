import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/views/trip/widget/day_details_container.dart';

class TripSwiperInfo extends StatelessWidget {
  const TripSwiperInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Padding(
      padding: EdgeInsets.only(left: w(22), right: w(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Row content country Name of city and price
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

          //description for city
          Padding(
            padding: EdgeInsets.only(
              left: w(11),
              top: h(11),
            ),
            child: const AutoSizeText(
              'Aswan is known for its beautiful Nile Valley scenery, significant archaeological sites and its peaceful aura. Its weather is warm all year round, which makes it a perfect winter destination.',
              style: TextStyle(
                height: 1.1,
                color: Color(0xff5B618A),
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: 'DavidLibre',
              ),
            ),
          ),

          //The type of transportation and its price
          Padding(
            padding: EdgeInsets.only(left: w(11), top: h(10)),
            child: RichText(
              text: const TextSpan(
                  text: ' I traveled to it by',
                  style: TextStyle(
                    color: Color(0xff5B618A),
                    fontFamily: 'DavidLibre',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: ' plane',
                      style: TextStyle(
                        color: Color(0xff5B618A),
                        fontFamily: 'DavidLibre',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' for',
                      style: TextStyle(
                        color: Color(0xff5B618A),
                        fontFamily: 'DavidLibre',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' 120 EGP',
                      style: TextStyle(
                        color: Color(0xff5B618A),
                        fontFamily: 'DavidLibre',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ]),
            ),
          ),

          //Row content Created by and Star rate
          Padding(
            padding: EdgeInsets.only(left: w(10), top: h(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const AutoSizeText(
                      'Created by',
                      style: TextStyle(
                        color: Color(0xff5B618A),
                        fontFamily: 'DavidLibre',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: w(3),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff5B618A),
                          ),
                        ),
                      ),
                      child: const AutoSizeText(
                        'Leo Carter',
                        style: TextStyle(
                          color: Color(0xff5B618A),
                          fontFamily: 'DavidLibre',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                buildRating(4.5),
              ],
            ),
          ),

          const DayTirpDetailsContainer(
            numOfDAy: 1,
            nameOfCity: 'Abu Simbel',
            description:
                'Built by Ramses II, and saved from destruction by a remarkable UNESCO rescue project in the 1970s, Abu Simbel is not only a triumph of ancient architecture, but also of modern engineering.',
            price: 60,
            currency: 'EGP',
          ),

          const DayTirpDetailsContainer(
            numOfDAy: 1,
            nameOfCity: 'Abu Simbel',
            description:
                'Built by Ramses II, and saved from destruction by a remarkable UNESCO rescue project in the 1970s, Abu Simbel is not only a triumph of ancient architecture, but also of modern engineering.',
            price: 60,
            currency: 'EGP',
          ),
        ],
      ),
    );
  }
}
