import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';
import 'package:rafiq/views/search_image/search_screen.dart';
import 'package:rafiq/views/search_image/widget/options.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.newContext,
  }) : super(key: key);
  final BuildContext? newContext;
  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(newContext!).size.height * (55 / 851));
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(newContext!).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    var cubit = BlocProvider.of<SearchCubit>(context);
    TextEditingController controller = TextEditingController();

    return AppBar(
      backgroundColor: const Color(0xffE8DEEB),
      title: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  child: Container(
                    width: w(180),
                    height: h(32),
                    padding: const EdgeInsets.all(5.5),
                    decoration: const BoxDecoration(
                      color: Color(0xff9C9BB7),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: BlocBuilder<SearchCubit, SearchState>(
                          builder: (context, state) {
                        return TextFormField(
                          controller: controller,
                          onChanged: (value) async {
                            if (!cubit.isChange) {
                              if (value != '' && !cubit.isSearchScreen) {
                                cubit.setLabel(label: value);
                                cubit.isSearchScreen = true;

                                Navigator.pushNamed(
                                    context, SearchScreen.routeName);
                              }
                              if (cubit.isSearchScreen &&
                                  cubit.dropDownVal == 'Users') {
                                cubit.searchByUser(user: value);
                              } else {
                                cubit.searchPlace(place: value);
                              }
                              state is ChangeDropDownValState
                                  ? cubit.isSearchScreen &&
                                          cubit.dropDownVal == 'Users'
                                      ? cubit.searchByUser(user: value)
                                      : cubit.searchPlace(place: value)
                                  : cubit.test++;
                            } else {
                              cubit.isChange = true;
                            }
                          },
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5B618A),
                          ),
                          decoration: const InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                              color: Color(0xffCFCBDC),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffEBEBEBB5),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Container(
                  height: h(32),
                  width: w(1.5),
                  color: const Color(0xffebebebb5).withOpacity(0.71),
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return OptionsDropDownButton(
                      items: cubit.listVals,
                      value: cubit.dropDownVal,
                    );
                  },
                ),
              ],
            ),

            // Container Search by image from gallery
            InkWell(
              onTap: () async {
                await searchImageFromGallery(context);
              },
              child: Container(
                width: w(32),
                height: h(32),
                decoration: BoxDecoration(
                  color: const Color(0xff5B618A).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  'assets/images/search_image/camera2.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
