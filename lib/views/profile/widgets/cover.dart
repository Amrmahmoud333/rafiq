import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getCover();
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

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
            child: BlocBuilder<ProfileCubit, ProfileStates>(
                builder: (context, states) {
              if (states is ProfileGetCoverLoadingState) {
                return Image.asset('assets/images/amr.jpg');
              } else if (states is ProfileGetCoverSuccessState) {
                return Image.network(
                  coverLink!,
                  fit: BoxFit.fill,
                );
              } else {
                return Image.asset('assets/images/mustafa.png');
              }
            }),
          ),
        ),
      ],
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
