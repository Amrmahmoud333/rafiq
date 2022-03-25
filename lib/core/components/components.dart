import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';

void showTosat({required msg, required state}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: state ? Colors.green : Colors.amber,
    textColor: Colors.white,
    fontSize: 15.0);

final ImagePicker _image = ImagePicker();

Future<void> getImageFromGalleryOrCamera(text, context, imageSource) async {
  final XFile? _profileOrCoverimage =
      await _image.pickImage(source: imageSource);
  if (_profileOrCoverimage == null)
    return;
  else if (text == 'profile' || text == 'Profile') {
    BlocProvider.of<ProfileCubit>(context)
        .fileProfileImagePath(_profileOrCoverimage);
  } else {
    BlocProvider.of<ProfileCubit>(context)
        .fileCoverImagePath(_profileOrCoverimage);
  }
}

void showSelectionDialog({
  required BuildContext context,
  required String select_profile_or_cover,
}) async {
  await showDialog(
    context: context,
    builder: (_) => SimpleDialog(
      title: Text('Select photo'),
      children: [
        SimpleDialogOption(
          child: Text('From gallery'),
          onPressed: () async {
            await getImageFromGalleryOrCamera(
                select_profile_or_cover, context, ImageSource.gallery);

            Navigator.pop(context);
          },
        ),
        SimpleDialogOption(
          child: Text('From camera'),
          onPressed: () async {
            await getImageFromGalleryOrCamera(
                select_profile_or_cover, context, ImageSource.camera);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
