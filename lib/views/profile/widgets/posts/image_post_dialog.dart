import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';

showSelectionImagePostDialog({
  required BuildContext context,
}) async {
  await showDialog(
    useSafeArea: true,
    context: context,
    builder: (_) => SimpleDialog(
      backgroundColor: const Color(0xffEFE7F2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: Theme.of(context).textTheme.headline2,
      title: const Center(child: Text('Select photo')),
      children: [
        SimpleDialogOption(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 2, color: Theme.of(context).primaryColor),
                //color: Colors.amber,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text('From gallery',
                  style: Theme.of(context).textTheme.headline4!),
            ),
          ),
          onPressed: () async {
            await getMultiImagePost(context);
            context.read<AddPostCubit>().resetAddPostScreen();
            Navigator.pop(context);
          },
        ),
        SimpleDialogOption(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border:
                    Border.all(width: 2, color: Theme.of(context).primaryColor),
                //color: Colors.amber,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text('From camera',
                  style: Theme.of(context).textTheme.headline4!),
            ),
          ),
          onPressed: () async {
            await getImagePostFromCamera(context);
            context.read<AddPostCubit>().resetAddPostScreen();
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
