import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/avatar/avatar_bottom_sheet.dart';

class AvatarPhoto extends StatelessWidget {
  const AvatarPhoto({
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

    return Positioned(
      top: h(145),
      left: w(9),
      child: InkWell(
        onTap: () {
          avatarBottomSheet(context);
        },
        child: BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, userDataState) {
          return Container(
            width: w(142),
            height: h(142),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              border: Border.all(color: const Color(0xffE8DEEB), width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48),
              child: (userDataState is UserGetDataLoadingState)
                  ? SvgPicture.asset(
                      'assets/images/default.svg',
                      fit: BoxFit.fill,
                    )
                  : (userDataState is UserGetDataSuccessState)
                      ? (cubit.avatar == null)
                          ? SvgPicture.asset(
                              'assets/images/default.svg',
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              cubit.avatar!,
                              fit: BoxFit.fill,
                            )
                      : SvgPicture.asset(
                          'assets/images/default.svg',
                          fit: BoxFit.fill,
                        ),
            ),
          );
        }),
      ),
    );
  }
}
