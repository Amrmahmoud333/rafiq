import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq/data/chach_helper.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    String avatar = CahchHelper.getData(key: 'avatar');

    return Container(
      color: const Color(0xffDBD4DD),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: h(10), bottom: h(14)),
            child: Row(
              children: [
                SizedBox(width: w(9)),
                Container(
                  width: w(42),
                  height: h(42),
                  decoration: BoxDecoration(
                    color: const Color(0xff5B618A),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xffE8DEEB), width: 2),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(avatar),
                    ),
                  ),
                ),
                SizedBox(width: w(6)),
                const AutoSizeText(
                  'Amr Mahmoud',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF5B618A),
                    fontFamily: 'DavidLibre',
                  ),
                ),
                SizedBox(width: w(170)),
                SvgPicture.asset('assets/images/Options.svg')
              ],
            ),
          ),
          Container(
            width: w(332),
            height: h(224),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Image(
                  image: AssetImage('assets/images/test1.png'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/images/test1.png'),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: AssetImage('assets/images/test2.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(height: h(5)),
          Row(
            children: [
              SizedBox(width: w(9)),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/love.svg',
                    width: w(27),
                    height: h(27),
                  ),
                  const AutoSizeText(
                    '10',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFF5B618A),
                      fontFamily: 'DavidLibre',
                    ),
                  ),
                ],
              ),
              SizedBox(width: w(24)),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/comments.svg',
                    width: w(27),
                    height: h(27),
                  ),
                  const AutoSizeText(
                    '2',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFF5B618A),
                      fontFamily: 'DavidLibre',
                    ),
                  ),
                ],
              ),
              SizedBox(width: w(244)),
              SvgPicture.asset(
                'assets/images/share.svg',
                width: w(27),
                height: h(27),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
