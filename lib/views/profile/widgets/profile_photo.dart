import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/clouds.png'),
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(h(25)))),
                    backgroundColor: const Color(0xffEFE7F2),
                    context: context,
                    builder: (_) => buildBottomSheet(context));
              },
              child: Container(
                width: w(142),
                height: h(142),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  border: Border.all(color: const Color(0xffE8DEEB), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child:
                      BlocProvider.of<ProfileCubit>(context).profileImageFile ==
                              null
                          ? (context.read<UserDataCubit>().avatar == null)
                              ? SvgPicture.asset(
                                  'assets/images/profile.svg',
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  context.read<UserDataCubit>().cover!,
                                  fit: BoxFit.fill,
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
            );
          }
        },
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) => Container(
        height: 255,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 12, right: 15),
          child: Column(children: [
            Center(
              child: Container(
                color: Theme.of(context).primaryColor,
                width: 50,
                height: 4,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                await showSelectionDialog(
                    context: context, select_profile_or_cover: 'profile');
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.photo_library_outlined,
                        color: Theme.of(context).primaryColor, size: 40),
                    const SizedBox(width: 15),
                    Text(
                      'Select profile picture',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.person,
                        color: Theme.of(context).primaryColor, size: 40),
                    const SizedBox(width: 15),
                    Text(
                      'View profile picture',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.delete_forever,
                        color: Color(0xffc11717), size: 40),
                    const SizedBox(width: 15),
                    Text(
                      'Delete profile picture',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Color(0xffc11717)),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      );
}
