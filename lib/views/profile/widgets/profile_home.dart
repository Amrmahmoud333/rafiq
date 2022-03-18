import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/theme.dart';

import 'package:rafiq/views/profile/widgets/row_tap_data.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Expanded(
      child: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h(37),
              width: w(373),
              child: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                elevation: 0,
                backgroundColor: const Color(0xffF7F4F8),
                bottom: TabBar(
                  controller: tabController,
                  labelPadding: EdgeInsets.only(bottom: h(5)),
                  indicator: Dot(color: const Color(0xff5B618A), radius: 3),
                  labelColor: const Color(0xff5B618A),
                  unselectedLabelColor:
                      const Color(0xff5B618A).withOpacity(0.35),
                  labelStyle: Theme.of(context).textTheme.headline6,
                  tabs: [
                    TapRowData(
                      widget: cubit.selectTap[cubit.currentIndex] == 'Posts'
                          ? cubit.selectTapIcon[cubit.currentIndex]
                          : Container(),
                      lable: 'Posts',
                    ),
                    TapRowData(
                      widget: cubit.selectTap[cubit.currentIndex] == 'Image'
                          ? cubit.selectTapIcon[cubit.currentIndex]
                          : Container(),
                      lable: 'Image',
                    ),
                    TapRowData(
                      widget: cubit.selectTap[cubit.currentIndex] == 'Videos'
                          ? cubit.selectTapIcon[cubit.currentIndex]
                          : Container(),
                      lable: 'Videos',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w(9),
                        ),
                        TapRowData(
                          widget: cubit.selectTap[cubit.currentIndex] == 'Map'
                              ? cubit.selectTapIcon[cubit.currentIndex]
                              : Container(),
                          lable: 'Map',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xffF7F4F8),
                width: w(373),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'No posts yet',
                            style:
                                ThemeOfProject.ligthTheme.textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Images.......'),
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
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends Decoration {
  final BoxPainter _painter;
  Dot({@required Color? color, @required double? radius})
      : _painter = _CirclePainter(color!, radius!);
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;
  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
