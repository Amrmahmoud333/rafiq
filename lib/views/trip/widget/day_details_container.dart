import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class DayTirpDetailsContainer extends StatelessWidget {
  const DayTirpDetailsContainer({
    Key? key,
    required this.numOfDAy,
    required this.nameOfCity,
    required this.description,
    required this.price,
    required this.currency,
  }) : super(key: key);

  final int numOfDAy;
  final int price;
  final String nameOfCity;
  final String description;
  final String currency;
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: h(29)),
      child: Container(
        color: const Color(0xffDBD4DD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: EdgeInsets.only(left: w(17), right: w(16.5)),
              child: AutoSizeText(
                description,
                style: const TextStyle(
                  height: 1.19,
                  color: Color(0xff5B618A),
                  fontFamily: 'DavidLibre',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    '$price $currency',
                    style: const TextStyle(
                      color: Color(0xff5B618A),
                      fontFamily: 'DavidLibre',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
