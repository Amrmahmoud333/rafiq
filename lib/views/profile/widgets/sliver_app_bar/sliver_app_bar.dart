import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';
import 'package:rafiq/logic/cubit/profile_cubit/tab_cubit/cubit/tab_cubit.dart';
import 'package:rafiq/views/profile/widgets/sliver_app_bar/row_tap_data.dart';

class SliverAppBarWidget extends StatelessWidget {
  SliverAppBarWidget(
      {Key? key, required this.innerBoxIsScrolled, required this.tabController})
      : super(key: key);

  TabController tabController;
  bool innerBoxIsScrolled;
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return BlocProvider(
      create: (context) => TabCubit(),
      child: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: w(9)),
            sliver: SliverAppBar(
              expandedHeight: h(25),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              elevation: 0,
              backgroundColor: const Color(0xffEFE7F2),
              bottom: TabBar(
                controller: tabController,
                labelPadding: EdgeInsets.only(bottom: h(6)),
                indicator: Dot(color: const Color(0xff5B618A), radius: 4),
                labelColor: const Color(0xff5B618A),
                unselectedLabelColor: const Color(0xff5B618A).withOpacity(0.35),
                labelStyle: Theme.of(context).textTheme.headline6,
                tabs: [
                  TapRowData(
                    widget: BlocProvider.of<TabCubit>(context).currentIndex == 0
                        ? const Icon(
                            Icons.post_add_outlined,
                            size: 21,
                          )
                        : Container(),
                    lable: 'Posts',
                  ),
                  TapRowData(
                    widget: BlocProvider.of<TabCubit>(context).currentIndex == 1
                        ? const Icon(
                            Icons.image,
                            size: 21,
                          )
                        : Container(),
                    lable: 'Image',
                  ),
                  TapRowData(
                    widget: BlocProvider.of<TabCubit>(context).currentIndex == 2
                        ? const Icon(
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
                        widget:
                            BlocProvider.of<TabCubit>(context).currentIndex == 3
                                ? const Icon(
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
          );
        },
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
