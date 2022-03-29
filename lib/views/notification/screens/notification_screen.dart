import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/logic/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:rafiq/views/profile/widgets/row_tap_data.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);
  static const routeName = '/notification_screen';
  @override
  String? token = CahchHelper.getData(key: 'token');
  bool? rememberMe = CahchHelper.getData(key: 'rememberMe');

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 650,
                  child: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Container(
                            color: Colors.red,
                            height: 150,
                            width: 250,
                          )
                        ])),
                        SliverAppBar(
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
                            labelPadding: EdgeInsets.only(bottom: 6),
                            labelColor: const Color(0xff5B618A),
                            unselectedLabelColor:
                                const Color(0xff5B618A).withOpacity(0.35),
                            labelStyle: Theme.of(context).textTheme.headline6,
                            tabs: [
                              TapRowData(
                                widget: const Icon(
                                  Icons.post_add_outlined,
                                  size: 21,
                                ),
                                lable: 'Posts',
                              ),
                              TapRowData(
                                widget: const Icon(
                                  Icons.image,
                                  size: 21,
                                ),
                                lable: 'Image',
                              ),
                              TapRowData(
                                widget: Icon(
                                  Icons.videocam_outlined,
                                  size: 21,
                                ),
                                lable: 'Videos',
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TapRowData(
                                    widget: const Icon(
                                      Icons.map,
                                      size: 21,
                                    ),
                                    lable: 'Map',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          child: BlocBuilder<UserDataCubit, UserDataState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    cover!,
                                    fit: BoxFit.fill,
                                  )
                                ],
                              );
                            },
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
              ],
            ),
          ),
        ));
  }
}
//mustafa