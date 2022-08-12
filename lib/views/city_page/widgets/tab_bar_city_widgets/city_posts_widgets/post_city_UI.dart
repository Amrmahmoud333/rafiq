// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/logic/cubit/city_information_cubit/city_information_cubit.dart';

class PostCityUI extends StatelessWidget {
  const PostCityUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    CityInformationCubit cubit = context.read<CityInformationCubit>();

    return Container(
      color: const Color(0xffDBD4DD).withOpacity(0.15),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h(10), bottom: h(14)),
            child: Row(
              children: [
                SizedBox(width: w(9)),
                Container(
                  width: w(42),
                  height: h(42),
                  decoration: BoxDecoration(
                    color: const Color(0xff5B618A),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xffE8DEEB), width: 2),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          cubit.cityInformationModel.results!.images![0]),
                    ),
                  ),
                ),
                SizedBox(width: w(6)),
                SizedBox(
                  width: w(121),
                  child: const FittedBox(
                    child: AutoSizeText(
                      'New York US',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF5B618A),
                        fontFamily: 'DavidLibre',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h(272),
            child: Stack(
              children: [
                SizedBox(
                  width: w(390),
                  height: h(224),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: w(380),
                        child: const Image(
                          image: NetworkImage(
                              'https://res.cloudinary.com/elaraby/image/upload/v1658278718/image/cityPhoto/new-york-cityscape-tourism-concept-photograph-image-id-57571180-1422963181-rBqn_tjlzwv_ykv4wl.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const AutoSizeText(
            'Welcome to New York!',
            style: TextStyle(
              fontSize: 25,
              color: Color(0XFF5B618A),
            ),
          ),
          Row(
            children: [
              SizedBox(width: w(9)),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color(0XFF5B618A),
                      size: 30,
                    ),
                  ),
                  const AutoSizeText(
                    '23',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFF5B618A),
                      fontFamily: 'DavidLibre',
                    ),
                  ),
                ],
              ),
              SizedBox(width: w(24)),
              Column(
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/images/comments.svg',
                      width: w(27),
                      height: h(27),
                    ),
                  ),
                  const AutoSizeText(
                    '0',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFF5B618A),
                      fontFamily: 'DavidLibre',
                    ),
                  ),
                ],
              ),
              SizedBox(width: w(244)),
              InkWell(
                child: SvgPicture.asset(
                  'assets/images/share.svg',
                  width: w(27),
                  height: h(27),
                ),
              ),
            ],
          ),
          SizedBox(height: h(7)),
        ],
      ),
    );
  }
}
