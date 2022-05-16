import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/core/components/components.dart';

// ignore: todo
// TODO make box decoration

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Padding(
      padding: EdgeInsets.only(top: (h(10))),
      child: Column(
        children: [
          SizedBox(
            width: w(345),
            height: h(166),
            child: Image.asset(
              'assets/images/city_icons/tower.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: w(345),
            // height: h(207),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w(15), top: h(13)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      AutoSizeText(
                        'Leaning Tower of Pisa',
                        style: TextStyle(
                          color: Color(0xff5B618A),
                          fontFamily: 'DavidLibre',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // ignore: todo
                // TODO if text less than one line , it will be in the center
                Padding(
                  padding: EdgeInsets.only(
                      left: w(12.5), top: h(14), bottom: h(18), right: w(13)),
                  child: AutoSizeText(
                    'Its is one of the most famous leaning towers in the world. It is the bell tower of the Cathedral of Pisa that has been under construction for almost 200 years, owing to a succession of wars as a symbol of the power of the maritime republic',
                    style: TextStyle(
                      color: const Color(0xff5B618A).withOpacity(0.9),
                      fontSize: 16,
                      fontFamily: 'DavidLibre',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: w(20), right: w(20), bottom: h(18)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildRating(3.5),
                      InkWell(
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
      ),
    );
  }
}
