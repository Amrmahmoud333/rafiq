import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildFilterByBottomSheet extends StatelessWidget {
  const BuildFilterByBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Container(
      color: const Color(0xffDBD4DD),
      height: h(174),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: w(20), top: h(25.25), bottom: h(13.25)),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/trip/star.svg',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: w(12.41)),
                  AutoSizeText('Best Rated',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
          Container(
            width: w(290),
            height: h(1.7),
            color: const Color(0xff5B618A),
          ),
          Padding(
            padding: EdgeInsets.only(left: w(25), top: h(17), bottom: h(16.46)),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/trip/country.svg',
                    width: 19,
                    height: 19,
                  ),
                  SizedBox(width: w(15.31)),
                  AutoSizeText('Country',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
          Container(
            width: w(290),
            height: h(1.7),
            color: const Color(0xff5B618A),
          ),
          Padding(
            padding: EdgeInsets.only(left: w(25), top: h(14)),
            child: InkWell(
              onTap: () async {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/trip/city.svg',
                    width: 19,
                    height: 19,
                  ),
                  SizedBox(width: w(15.31)),
                  AutoSizeText('City',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
