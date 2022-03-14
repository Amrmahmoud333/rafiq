import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditButton extends StatelessWidget {
  const EditButton({
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
      top: h(190),
      left: w(352),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: w(27),
          height: h(35),
          decoration: BoxDecoration(
            color: const Color(0xffE8DEEB),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff5B618A).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SvgPicture.asset(
            'assets/images/edit_icon.svg',
            width: w(17.82),
            height: h(17.82),
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
