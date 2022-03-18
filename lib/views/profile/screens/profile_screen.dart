import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/views/profile/widgets/cover.dart';
import 'package:rafiq/views/profile/widgets/edit_button.dart';
import 'package:rafiq/views/profile/widgets/profile_Information.dart';
import 'package:rafiq/views/profile/widgets/profile_home.dart';
import 'package:rafiq/views/profile/widgets/profile_name.dart';
import 'package:rafiq/views/profile/widgets/profile_photo.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile_screen';

  late TabController _tabController;
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
      child: SafeArea(
        child: Builder(builder: (context) {
          _tabController = DefaultTabController.of(context)!;

          _tabController.addListener(
            () => BlocProvider.of<ProfileCubit>(context)
                .ChangeIndex(_tabController.index),
          );
          return Scaffold(
            drawer: Drawer(),
            appBar: AppBar(
              toolbarHeight: h(55),
              backgroundColor: const Color(0xffE8DEEB),
              title: InkWell(
                onTap: () {
                  //    showSearch(context: context, delegate: MySearchDelegate());
                },
                child: Container(
                  width: w(208),
                  height: h(29),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xff5B618A),
                    ),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: w(3),
                    ),
                    Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ]),
                ),
              ),
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
                const ProfileInformation(),
                SizedBox(
                  height: h(25),
                ),
                ProfileHome(
                  tabController: _tabController,
                ),
                // CutsomBottomNavigationBar(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
