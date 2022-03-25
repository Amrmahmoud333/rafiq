import 'package:flutter/material.dart';

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

    return AppBar(
      //  toolbarHeight: h(100),
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
              color: const Color(0xff5B618A),
            ),
          ),
          child: Row(children: [
            SizedBox(
              width: w(3),
            ),
            const Icon(
              Icons.search,
              size: 25,
            ),
          ]),
        ),
      ),
    );
  }
}
