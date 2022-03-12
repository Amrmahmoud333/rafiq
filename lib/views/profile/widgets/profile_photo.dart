import 'package:flutter/material.dart';

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
      child: Container(
        width: w(142),
        height: h(142),
        decoration: BoxDecoration(
          color: const Color(0xff5B618A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffE8DEEB), width: 2),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/amr.jpg'),
          ),
        ),
        //   child: SvgPicture.asset(
        //     'assets/images/profile.svg',
        //     width: w(70),
        //     height: h(70),
        //   ),
      ),
    );
  }
}
