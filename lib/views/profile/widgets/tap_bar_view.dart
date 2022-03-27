import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/themes/theme.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class TabBarViewWidget extends StatelessWidget {
  TabBarViewWidget({Key? key, required this.tabController}) : super(key: key);
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: w(9)),
          child: Container(
            color: const Color(0xffEFE7F2),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
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
        );
      },
    );
  }
}
