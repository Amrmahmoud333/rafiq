import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_Information.dart';
import 'package:rafiq/views/profile/widgets/profile_home.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';
import 'package:rafiq/views/profile/widgets/row_tap_data.dart';
import 'package:rafiq/views/profile/widgets/sliver_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: SafeArea(
          child: Builder(builder: (context) {
            TabController _tabController = DefaultTabController.of(context)!;

            _tabController.addListener(
              () => BlocProvider.of<ProfileCubit>(context)
                  .ChangeIndex(_tabController.index),
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
                                  ProfilePhoto(),
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
                            /* ProfileHome(
                    tabController: _tabController,
                  ),*/
                            // CutsomBottomNavigationBar(),
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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  color: const Color(0xffEFE7F2),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.red,
                              height: 150,
                              child: AutoSizeText(
                                'No posts yet',
                                style: ThemeOfProject
                                    .ligthTheme.textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              color: Colors.amber,
                              height: 150,
                              child: AutoSizeText(
                                'No posts yet',
                                style: ThemeOfProject
                                    .ligthTheme.textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              color: Colors.red,
                              height: 150,
                              child: AutoSizeText(
                                'No posts yet',
                                style: ThemeOfProject
                                    .ligthTheme.textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              color: Colors.blue,
                              height: 150,
                              child: AutoSizeText(
                                'No posts yet',
                                style: ThemeOfProject
                                    .ligthTheme.textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              color: Colors.red,
                              height: 150,
                              child: AutoSizeText(
                                'No posts yet',
                                style: ThemeOfProject
                                    .ligthTheme.textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              color: Colors.red,
                              height: 150,
                              child: AutoSizeText(
                                'No posts yet',
                                style: ThemeOfProject
                                    .ligthTheme.textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              color: Colors.black,
                              height: 150,
                              child: AutoSizeText(
                                'No posts yet',
                                style: ThemeOfProject
                                    .ligthTheme.textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'No images yet',
                            style:
                                ThemeOfProject.ligthTheme.textTheme.headline4,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'No videos yet',
                            style:
                                ThemeOfProject.ligthTheme.textTheme.headline4,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'No images yet',
                            style:
                                ThemeOfProject.ligthTheme.textTheme.headline4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
          }),
        ),
      ),
    );
  }
}
