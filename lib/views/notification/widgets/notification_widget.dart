import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
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

    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            width: w(353),
            height: h(86),
            color: const Color(0xffDBD4DD),
            child: Row(children: [
              SizedBox(width: w(15)),
              Container(
                width: w(60),
                height: h(60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/test1.png')),
                ),
              ),
              SizedBox(width: w(8)),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: h(19)),
                    child: Row(
                      children: [
                        const AutoSizeText(
                          'Ahmed Ahmed',
                          style: TextStyle(
                              color: Color(0xff5B618A),
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                        SizedBox(width: w(80)),
                        const AutoSizeText(
                          '4:30',
                          style: TextStyle(
                            color: Color(0xff5B618A),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h(7)),
                  const AutoSizeText(
                    'commented to your post',
                    style: TextStyle(
                      color: Color(0xff5B618A),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ]),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: h(17)),
        itemCount: 15);
  }
}
