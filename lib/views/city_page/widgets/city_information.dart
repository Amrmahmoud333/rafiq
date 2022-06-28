import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/logic/cubit/city_information_cubit/city_information_cubit.dart';

class CityInformation extends StatelessWidget {
  const CityInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    CityInformationCubit cubit = context.read<CityInformationCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              '${cubit.cityInformationModel.results!.country!.name}',
              style: const TextStyle(
                color: Color(0xff5B618A),
                fontFamily: 'DavidLibre',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            AutoSizeText(
              cubit.cityInformationModel.results!.lastName!.isEmpty
                  ? '(${cubit.cityInformationModel.results!.firstName!})'
                  : '(${cubit.cityInformationModel.results!.firstName!}  ${cubit.cityInformationModel.results!.lastName!})',
              style: const TextStyle(
                color: Color(0xff5B618A),
                fontFamily: 'DavidLibre',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: h(18)),
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Row(children: [
                SizedBox(
                  width: w(23),
                  height: h(22),
                  child: SvgPicture.asset('assets/images/city_icons/temp.svg'),
                ),
                const AutoSizeText(
                  '16 °',
                  style: TextStyle(
                    color: Color(0xffBE8CD5),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const AutoSizeText(
                  'C',
                  style: TextStyle(
                    color: Color(0xff5B618A),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Row(children: [
                SizedBox(
                  width: w(23),
                  height: h(22),
                  child: SvgPicture.asset('assets/images/city_icons/clock.svg'),
                ),
                const AutoSizeText(
                  '05:12',
                  style: TextStyle(
                    color: Color(0xffBE8CD5),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Row(children: [
                SizedBox(
                  width: w(23),
                  height: h(22),
                  child:
                      SvgPicture.asset('assets/images/city_icons/people.svg'),
                ),
                const AutoSizeText(
                  '60M ',
                  style: TextStyle(
                    color: Color(0xffBE8CD5),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const AutoSizeText(
                  'people',
                  style: TextStyle(
                    color: Color(0xff5B618A),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
            ]),
            SizedBox(height: h(29)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Row(children: [
                SizedBox(
                  width: w(23),
                  height: h(22),
                  child: SvgPicture.asset('assets/images/city_icons/fire.svg'),
                ),
                AutoSizeText(
                  cubit.cityInformationModel.results!.country!.emergencyNumbers!
                      .fire![0],
                  style: const TextStyle(
                    color: Color(0xffBE8CD5),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Row(children: [
                SizedBox(
                  width: w(23),
                  height: h(22),
                  child:
                      SvgPicture.asset('assets/images/city_icons/police.svg'),
                ),
                AutoSizeText(
                  cubit.cityInformationModel.results!.country!.emergencyNumbers!
                      .police![0],
                  style: const TextStyle(
                    color: Color(0xffBE8CD5),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Row(children: [
                SizedBox(
                  width: w(23),
                  height: h(22),
                  child: SvgPicture.asset(
                      'assets/images/city_icons/first_aid.svg'),
                ),
                AutoSizeText(
                  cubit.cityInformationModel.results!.country!.emergencyNumbers!
                      .ambulance![0],
                  style: const TextStyle(
                    color: Color(0xffBE8CD5),
                    fontSize: 20,
                    fontFamily: 'DavidLibre',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
            ]),
          ],
        ),
      ],
    );
  }
}
