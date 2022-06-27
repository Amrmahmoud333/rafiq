import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/core/components/components.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/city_activities_cubit/activities_cubit.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({Key? key}) : super(key: key);

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    ActivitiesCubit cubit = context.read<ActivitiesCubit>();

    return SizedBox(
      height: h(800),
      child: Swiper(
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                height: h(445),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    "https://media.istockphoto.com/photos/mosque-and-pyramids-picture-id1174818077?k=20&m=1174818077&s=612x612&w=0&h=vAutxzWDTokCJkf6010sguiHP6yc8Nzt8qePG9DEew0=",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: w(345),
                color: const Color(0xffEFE7F2),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w(15), top: h(13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: w(302),
                            child: AutoSizeText(
                              cubit.activitiesModel.results!.data![0].name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xff5B618A),
                                fontFamily: 'DavidLibre',
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: w(12.5),
                          top: h(14),
                          bottom: h(18),
                          right: w(13)),
                      child: SizedBox(
                        height: h(145),
                        width: w(302),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                cubit.activitiesModel.results!.data![0]
                                    .shortDescription!,
                                style: TextStyle(
                                  color:
                                      const Color(0xff5B618A).withOpacity(0.9),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DavidLibre',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: w(20), right: w(20)),
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
          );
        }),
        itemCount: 2,
        itemWidth: w(320.0),
        itemHeight: h(700.0),
        layout: SwiperLayout.STACK,
        axisDirection: AxisDirection.right,
        onIndexChanged: (index) {},
        onTap: (index) {},
      ),
    );
  }
}
