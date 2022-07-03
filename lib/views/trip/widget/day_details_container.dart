import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class DayTirpDetailsContainer extends StatelessWidget {
  const DayTirpDetailsContainer(
      {Key? key,
      required this.numOfDAy,
      required this.nameOfCity,
      required this.description})
      : super(key: key);

  final int numOfDAy;
  final String nameOfCity;
  final String description;
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Container(
      color: const Color(0xffDBD4DD),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: w(15.06), top: h(11)),
            child: AutoSizeText(
              'Day $numOfDAy',
              style: const TextStyle(
                color: Color(0xff5B618A),
                fontFamily: 'DavidLibre',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: h(10),
          ),
          Center(
            child: AutoSizeText(
              nameOfCity,
              style: const TextStyle(
                color: Color(0xff5B618A),
                fontFamily: 'DavidLibre',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: h(21),
          ),
          AutoSizeText(
            description,
            style: const TextStyle(
              color: Color(0xff5B618A),
              fontFamily: 'DavidLibre',
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
