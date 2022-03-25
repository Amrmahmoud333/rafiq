import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileIntialState());

  // working with UI

  File? profileImageFile;
  void fileProfileImagePath(XFile profileImage) {
    profileImageFile = File(profileImage.path);
    emit(ProfileImageFromGalleryOrCameraState());
  }

  File? coverImageFile;
  void fileCoverImagePath(XFile coverImage) {
    coverImageFile = File(coverImage.path);
    emit(CoverImageFromGalleryOrCameraState());
  }

  int currentIndex = 0;
  void ChangeIndex(index) {
    currentIndex = index;
    emit(ProfileChangeIndexState());
  }
}
