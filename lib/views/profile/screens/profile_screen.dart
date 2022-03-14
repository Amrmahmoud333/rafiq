import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rafiq/theme.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';
import 'package:rafiq/views/profile/widgets/row_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: const Color(0xffE8DEEB),
        ),
        body: Column(
          children: [
            SizedBox(
              height: h(288),
              child: Stack(
                children: const [
                  Cover(),
                  ProfilePhoto(),
                  ProfileName(),
                  EditButton(),
                ],
              ),
            ),
            SizedBox(
              height: h(31),
            ),
            Column(
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
            ),
            SizedBox(
              height: h(25),
            ),
            SizedBox(
              height: 25,
              child: AppBar(
                backgroundColor: Colors.grey[500],
                bottom: const TabBar(
                  labelColor: Color(0xff5B618A),
                  tabs: [
                    AutoSizeText('Posts'),
                    AutoSizeText('Images'),
                    AutoSizeText('Videos'),
                    AutoSizeText('Map'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[400],
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Posts',
                            style:
                                ThemeOfProject.ligthTheme.textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Images'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Videos'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Map'),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
