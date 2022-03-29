import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';

void showTosat({required msg, required state}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: state ? Colors.green : Colors.amber,
    textColor: Colors.white,
    fontSize: 15.0);

final ImagePicker _image = ImagePicker();

Future<void> getAvatarFromGalleryOrCamera(context, imageSource) async {
  final XFile? _avatarimage = await _image.pickImage(source: imageSource);
  if (_avatarimage == null) return;

  BlocProvider.of<ProfileCubit>(context).fileAvatarImagePath(_avatarimage);
  BlocProvider.of<ProfileCubit>(context)
      .setAvatar(file: BlocProvider.of<ProfileCubit>(context).avatarImageFile);
}

Future<void> getCoverFromGalleryOrCamera(context, imageSource) async {
  final XFile? coverImage = await _image.pickImage(source: imageSource);

  if (coverImage == null) return;
  BlocProvider.of<ProfileCubit>(context).fileCoverImagePath(coverImage);
  BlocProvider.of<ProfileCubit>(context)
      .setCover(file: BlocProvider.of<ProfileCubit>(context).coverImageFile);
}

showSelectionAvatarDialog({
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
            await getAvatarFromGalleryOrCamera(context, ImageSource.gallery);

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
            await getAvatarFromGalleryOrCamera(context, ImageSource.camera);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

showSelectionCoverDialog({
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
            await getCoverFromGalleryOrCamera(context, ImageSource.gallery);

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
            await getCoverFromGalleryOrCamera(context, ImageSource.camera);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
