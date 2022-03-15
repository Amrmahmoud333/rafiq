import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/views/profile/widgets/row_data.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const RowData(
          imagePath: 'assets/images/posts_icon.svg',
          text: '0 Posts',
          sizedWidth: 12.25,
        ),
        SizedBox(height: h(12)),
        const RowData(
          imagePath: 'assets/images/followers_icon.svg',
          text: '0 Followers',
          sizedWidth: 6.66,
        ),
        SizedBox(height: h(12)),
        const RowData(
          imagePath: 'assets/images/location_icon.svg',
          text: 'From Egypt',
          sizedWidth: 5,
        ),
        SizedBox(height: h(12)),

        // TODO make it optional
        SizedBox(
          height: h(36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RowData(
                imagePath: 'assets/images/lives_in_icon.svg',
                text: 'Lives in Ismailia',
                sizedWidth: 4.71,
              ),
              Padding(
                padding: EdgeInsets.only(right: w(5)),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/insta_icon.svg',
                          width: w(31),
                          height: h(31),
                        ),
                      ),
                    ),
                    SizedBox(width: w(9)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/images/facebook_icon.svg',
                          width: w(31),
                          height: h(31),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
