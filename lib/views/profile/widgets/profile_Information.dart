import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/row_data.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = context.read<UserDataCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RowData(
          imagePath: 'assets/images/posts_icon.svg',
          text: '0 Posts',
          sizedWidth: 12.25,
        ),
        SizedBox(height: h(12)),
        BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state) {
            if (state is UserGetDataLoadingState) {
              return const RowData(
                imagePath: 'assets/images/followers_icon.svg',
                text: '0 Followers',
                sizedWidth: 6.66,
              );
            } else {
              return RowData(
                imagePath: 'assets/images/followers_icon.svg',
                text: '${cubit.numberOfFollowers} Followers',
                sizedWidth: 6.66,
              );
            }
          },
        ),
        SizedBox(height: h(12)),
        BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state) {
            if (state is UserGetDataLoadingState) {
              return const RowData(
                imagePath: 'assets/images/location_icon.svg',
                text: 'From ',
                sizedWidth: 5,
              );
            } else {
              return RowData(
                imagePath: 'assets/images/location_icon.svg',
                text: 'From ${cubit.country}',
                sizedWidth: 5,
              );
            }
          },
        ),
        SizedBox(height: h(12)),

        // TODO make it optional

        SizedBox(
          height: h(36),
          child: BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state is UserGetDataLoadingState
                    ? const RowData(
                        imagePath: 'assets/images/lives_in_icon.svg',
                        text: 'Lives in ',
                        sizedWidth: 4.71,
                      )
                    : cubit.liveIn == null
                        ? const SizedBox()
                        : RowData(
                            imagePath: 'assets/images/lives_in_icon.svg',
                            text: 'Lives in ${cubit.liveIn}',
                            sizedWidth: 4.71,
                          ),
                Padding(
                  padding: EdgeInsets.only(right: w(5)),
                  child: Row(
                    children: [
                      for (int i = 0; i < (cubit.socialMedia!.length); i++)
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  cubit.socialMedia![i].label == 'instagram'
                                      ? 'assets/images/insta_icon.svg'
                                      : cubit.socialMedia![i].label ==
                                              'facebook'
                                          ? 'assets/images/edit_profile/facebook.svg'
                                          : cubit.socialMedia![i].label ==
                                                  'tiktok'
                                              ? 'assets/images/edit_profile/tiktok.svg'
                                              : cubit.socialMedia![i].label ==
                                                      'youtube'
                                                  ? 'assets/images/edit_profile/youtube.svg'
                                                  : 'assets/images/instagram.svg',
                                  width: w(31),
                                  height: h(31),
                                ),
                              ),
                            ),
                            SizedBox(width: w(9)),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
