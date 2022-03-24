import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileIntialState());

  // working with UI

  File? imageFile;

  void fileImagePath(XFile image) {
    imageFile = File(image.path);
    emit(GetImageFromGalleryState());
  }

  int currentIndex = 0;
  void ChangeIndex(index) {
    currentIndex = index;
    emit(ProfileChangeIndexlState());
  }
}
