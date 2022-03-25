import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/core/themes/theme.dart';
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
                backgroundColor: Color(0xffEFE7F2),
                bottom: TabBar(
                  controller: tabController,
                  labelPadding: EdgeInsets.only(bottom: h(6)),
                  indicator: Dot(color: const Color(0xff5B618A), radius: 4),
                  labelColor: const Color(0xff5B618A),
                  unselectedLabelColor:
                      const Color(0xff5B618A).withOpacity(0.35),
                  labelStyle: Theme.of(context).textTheme.headline6,
                  tabs: [
                    TapRowData(
                      widget: cubit.currentIndex == 0
                          ? Icon(
                              Icons.post_add_outlined,
                              size: 21,
                            )
                          : Container(),
                      lable: 'Posts',
                    ),
                    TapRowData(
                      widget: cubit.currentIndex == 1
                          ? Icon(
                              Icons.image,
                              size: 21,
                            )
                          : Container(),
                      lable: 'Image',
                    ),
                    TapRowData(
                      widget: cubit.currentIndex == 2
                          ? Icon(
                              Icons.videocam_outlined,
                              size: 21,
                            )
                          : Container(),
                      lable: 'Videos',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w(10),
                        ),
                        TapRowData(
                          widget: cubit.currentIndex == 3
                              ? Icon(
                                  Icons.map,
                                  size: 21,
                                )
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
                color: Color(0xffEFE7F2),
                width: w(373),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'No posts yet',
                          style: ThemeOfProject.ligthTheme.textTheme.headline4,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'No images yet',
                          style: ThemeOfProject.ligthTheme.textTheme.headline4,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'No videos yet',
                          style: ThemeOfProject.ligthTheme.textTheme.headline4,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'No images yet',
                          style: ThemeOfProject.ligthTheme.textTheme.headline4,
                        ),
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
