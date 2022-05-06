import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';

class AddContainer extends StatelessWidget {
  AddContainer({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.index,
  }) : super(key: key);

  String imagePath, text;
  int index;

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = context.read<AddPostCubit>();
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        return Container(
          width: w(355),
          height: h(66),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0xff5B618A),
                blurStyle: BlurStyle.inner,
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(-2, -3),
              )
            ],
            color: cubit.getColor(index),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff5B618A), width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: w(20)),
              SvgPicture.asset(
                imagePath,
                width: w(40),
                height: h(35),
                color: cubit.getColor(index) == const Color(0xff5B618A)
                    ? const Color(0xffE8DEEB)
                    : const Color(0xff5B618A),
              ),
              SizedBox(width: w(13)),
              AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: cubit.getColor(index) == const Color(0xff5B618A)
                      ? const Color(0xffE8DEEB)
                      : const Color(0xff5B618A),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
