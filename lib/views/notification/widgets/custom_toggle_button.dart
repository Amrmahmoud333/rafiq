import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rafiq/logic/cubit/notification_cubit/notification_cubit.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final NotificationCubit cubit;

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
      return Stack(
        children: [
          NeumorphicSwitch(
            value: cubit.toggle,
            duration: const Duration(milliseconds: 300),
            onChanged: (bool isChanged) {
              cubit.changeToggle();
            },
            height: h(32),
            style: const NeumorphicSwitchStyle(
              disableDepth: true,
              thumbShape: NeumorphicShape.convex,
              activeThumbColor: Color(0xffB2B2B2),
              inactiveThumbColor: Color(0xff696969),
              activeTrackColor: Color(0xff5B618A),
              inactiveTrackColor: Color(0xffB2B2B2),
            ),
          ),
          !cubit.toggle
              ? Positioned(
                  top: h(11),
                  left: w(30),
                  child: const AutoSizeText(
                    'OFF',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff696969)),
                  ),
                )
              : Positioned(
                  top: h(10),
                  left: w(9),
                  child: const AutoSizeText(
                    'ON',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffDBD4DD)),
                  ),
                ),
        ],
      );
    });
  }
}
