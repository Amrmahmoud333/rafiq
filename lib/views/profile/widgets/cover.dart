import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';

/* 
 to get cover we word in to satates profileState and getUserDataState 
 we put the cover from cover string in consts , this cover is saved in memory 
 and change in two classes (profile cubit . user data cubit)
 user data cubit we you open the app 
 profile cubit when you change the cover photo form screen 
 */

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, profilestate) {
        return Stack(
          children: [
            Opacity(
              opacity: 0.05,
              child: ClipPath(
                clipper: CustomCover(),
                child: Container(
                  height: h(221),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: CustomCover(),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      backgroundColor: const Color(0xffEFE7F2),
                      context: context,
                      builder: (_) => buildBottomSheet(context));
                },
                child: BlocBuilder<UserDataCubit, UserDataState>(
                  builder: (context, userDataState) {
                    print('coverrrr');
                    return Container(
                        width: double.infinity,
                        height: h(215),
                        decoration: const BoxDecoration(
                          color: Color(0xffE8DEEB),
                        ),
                        child: (userDataState is UserGetDataLoadingState ||
                                profilestate is SetCoverLoadingState)
                            ? SvgPicture.asset(
                                'assets/images/default_cover.svg')
                            : (userDataState is UserGetDataSuccessState ||
                                    profilestate is SetCoverSuccessState)
                                ? (cover == null)
                                    ? SvgPicture.asset(
                                        'assets/images/default_cover.svg',
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        cover!,
                                        fit: BoxFit.fill,
                                      )
                                : SvgPicture.asset(
                                    'assets/images/default_cover.svg',
                                    fit: BoxFit.fill,
                                  ));
                  },
                ),
              ),
            ),
          ],
        );
      },
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
                await showSelectionCoverDialog(context: context);
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
                      'Select cover picture',
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
                      'View cover picture',
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
                    const Icon(Icons.delete_forever,
                        color: Color(0xffc11717), size: 40),
                    const SizedBox(width: 15),
                    Text(
                      'Delete cover picture',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: const Color(0xffc11717)),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      );
}

class CustomCover extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // start path from here
    var controllPoint = Offset(100, size.height - 10);
    var endPoint = Offset(size.width / 2, size.height - 7);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    // second wave
    var controllPoint2 = Offset(size.width - 100, size.height - 10);
    var endPoint2 = Offset(size.width, size.height - 50);

    path.quadraticBezierTo(
        controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy);
    path.lineTo(size.width, 0); // to cover all of the screen
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
