import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
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
      top: h(225),
      left: w(160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              if (state is UserGetDataLoadingState) {
                return AutoSizeText(
                  '',
                  style: Theme.of(context).textTheme.headline4,
                );
              } else {
                return AutoSizeText(
                  '${cubit.firstName} ${cubit.lastName}',
                  style: TextStyle(
                    color: Color(0xff5B618A),
                    fontSize: 24,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            },
          ),
          AutoSizeText(
            ' @${cubit.userName}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
