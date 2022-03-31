import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';

void showTosat({required msg, required state}) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: state ? Colors.green : Colors.amber,
      textColor: Colors.white,
      fontSize: 15.0,
    );

void showValidationTosat(context, message) {
  MotionToast.error(
    title: const Text(
      "Error",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    description: Text(message,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    toastDuration: const Duration(milliseconds: 2500),
    animationType: ANIMATION.fromRight,
    animationCurve: Curves.decelerate,
    position: MOTION_TOAST_POSITION.top,
  ).show(context);
}

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
