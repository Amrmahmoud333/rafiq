import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TripCountrySearch extends StatelessWidget {
  const TripCountrySearch({Key? key}) : super(key: key);

  static const routeName = '/search_trip_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 800);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 360);
    }

    return Scaffold(
      backgroundColor: const Color(0xffE8DEEB),
      body: Column(
        children: [
          SizedBox(
            height: h(10),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: w(8), top: h(22)),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color(0xff5B618A),
                  ),
                ),
              ),
              SizedBox(
                width: w(9),
              ),
              Padding(
                padding: EdgeInsets.only(top: h(20)),
                child: const AutoSizeText(
                  'Country',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff5B618A),
                  ),
                ),
              )
            ],
          ),
          Container(
            color: const Color(0xffC0BCCC).withOpacity(0.7),
            width: w(320),
            height: h(45),
            child: TextFormField(
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff5B618A)),
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xff5B618A),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xff5B618A),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Color(0xff5B618A),
                ),
                hintText: 'Search for country',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff5B618A).withOpacity(0.7),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
