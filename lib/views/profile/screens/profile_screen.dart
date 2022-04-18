import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/views/profile/widgets/cover/cover.dart';
import 'package:rafiq/views/profile/widgets/edit/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_Information.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/avatar/avatar_photo.dart';
import 'package:rafiq/views/profile/widgets/sliver_app_bar/sliver_app_bar.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: SafeArea(
        child: Builder(builder: (context) {
          TabController _tabController = DefaultTabController.of(context)!;

          _tabController.addListener(
            () => BlocProvider.of<ProfileCubit>(context)
                .changeIndex(_tabController.index),
          );
          return Scaffold(
            body: NestedScrollView(
              // physics: ScrollPhysics(parent: PageScrollPhysics()),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(
                          children: [
                            SizedBox(
                              height: h(288),
                              child: Stack(
                                children: const [
                                  Cover(),
                                  AvatarPhoto(),
                                  ProfileName(),
                                  EditButton(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h(31),
                            ),
                            const ProfileInformation(),
                            SizedBox(
                              height: h(25),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverAppBarWidget(
                      innerBoxIsScrolled: innerBoxIsScrolled,
                      tabController: _tabController)
                ];
              },
              body: TabBarViewWidget(
                tabController: _tabController,
              ),
            ),
          );
        }),
      ),
    );
  }
}