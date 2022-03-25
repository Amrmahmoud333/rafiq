import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
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
              child: Container(
                width: double.infinity,
                height: h(215),
                decoration: const BoxDecoration(
                  color: Color(0xffE8DEEB),
                ),
                child: BlocBuilder<UserDataCubit, UserDataState>(
                    builder: (context, states) {
                  if (states is UserGetDataLoadingState) {
                    return SvgPicture.asset('assets/images/default_cover.svg');
                  } else {
                    return BlocProvider.of<ProfileCubit>(context)
                                .coverImageFile ==
                            null
                        ? Image.network(
                            context.read<UserDataCubit>().cover!,
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            BlocProvider.of<ProfileCubit>(context)
                                .coverImageFile!,
                            fit: BoxFit.fill,
                          );
                  }
                }),
              ),
            ),
            IconButton(
              onPressed: () {
                showSelectionDialog(
                    context: context, select_profile_or_cover: 'cover');
              },
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        );
      },
    );
  }
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
