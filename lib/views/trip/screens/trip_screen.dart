import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/views/trip/widget/filter_by_bottom_sheet.dart';
import 'package:rafiq/views/trip/widget/swiper_widget/info_for_trip_swiper.dart';
import 'package:rafiq/views/trip/widget/swiper_widget/swiper_trip_widget.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);
  static const routeName = '/trip_screen';
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Scaffold(
      backgroundColor: const Color(0xffE8DEEB),
      body: SizedBox(
        height: h(800),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: h(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w(8)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color(0xff5B618A),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w(11)),

                  // Row content Filter by button
                  child: Padding(
                    padding: EdgeInsets.only(left: w(30), bottom: h(26)),
                    child: Row(
                      children: [
                        const AutoSizeText(
                          'Trip',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff5B618A),
                          ),
                        ),
                        SizedBox(
                          width: w(10),
                        ),
                        InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              builder: ((context) =>
                                  const BuildFilterByBottomSheet()),
                            );
                          },
                          child: Container(
                            width: w(110),
                            height: h(37),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color(0xffCFCBDC),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: w(15), top: h(8)),
                              child: const AutoSizeText(
                                'filter by',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff5B618A),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SwiperTripWidget(),
                Container(
                    color: const Color(0xffE8DEEB),
                    child: const TripSwiperInfo()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
