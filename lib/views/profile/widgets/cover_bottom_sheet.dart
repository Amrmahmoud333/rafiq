import 'package:flutter/material.dart';
import 'package:rafiq/views/profile/widgets/cover_dialog.dart';

coverBottomSheet(context) async {
  return await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      backgroundColor: const Color(0xffEFE7F2),
      context: context,
      builder: (_) => buildBottomSheet(context));
}

Widget buildBottomSheet(BuildContext context) => SizedBox(
      height: 255,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 12, right: 15),
        child: Column(children: [
          Center(
            child: Container(
              color: Theme.of(context).primaryColor,
              width: 50,
              height: 4,
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              await showSelectionCoverDialog(context: context);
              Navigator.pop(context);
            },
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Icon(Icons.photo_library_outlined,
                      color: Theme.of(context).primaryColor, size: 40),
                  const SizedBox(width: 15),
                  Text(
                    'Select cover picture',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  Icon(Icons.person,
                      color: Theme.of(context).primaryColor, size: 40),
                  const SizedBox(width: 15),
                  Text(
                    'View cover picture',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 50,
              child: Row(
                children: [
                  const Icon(Icons.delete_forever,
                      color: Color(0xffc11717), size: 40),
                  const SizedBox(width: 15),
                  Text(
                    'Delete cover picture',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: const Color(0xffc11717)),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
