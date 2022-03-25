import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
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

    return Positioned(
      top: h(145),
      left: w(9),
      child: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          if (state is UserGetDataLoadingState) {
            return Container(
              width: w(142),
              height: h(142),
              decoration: BoxDecoration(
                color: const Color(0xff5B618A),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xffE8DEEB), width: 2),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/clouds.png'),
                ),
              ),
            );
          } else {
            return BlocBuilder<ProfileCubit, ProfileStates>(
                builder: (context, state) {
              return Stack(
                // alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    width: w(142),
                    height: h(142),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      border:
                          Border.all(color: const Color(0xffE8DEEB), width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: BlocProvider.of<ProfileCubit>(context)
                                  .profileImageFile ==
                              null
                          ? Image(
                              width: w(142),
                              height: h(142),
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  context.read<UserDataCubit>().avatar!),
                            )
                          : Image.file(
                              BlocProvider.of<ProfileCubit>(context)
                                  .profileImageFile!,
                              fit: BoxFit.fill,
                              width: w(142),
                              height: h(142),
                            ),
                    ),
                  ),
                  Positioned(
                    top: 92,
                    left: -8,
                    child: IconButton(
                      onPressed: () {
                        showSelectionDialog(
                            context: context,
                            select_profile_or_cover: 'profile');
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              );
            });
          }
        },
      ),
    );
  }
}
