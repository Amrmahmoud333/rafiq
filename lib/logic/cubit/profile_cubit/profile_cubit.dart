import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rafiq/data/models/set_cover_image_model.dart';
import 'package:rafiq/data/repositories/cover_image_repo.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  CoverImageRepo coverImageRepo;
  ProfileCubit({required this.coverImageRepo}) : super(ProfileIntialState());

  late SetCoverModel _setCoverModel;
  late SetAvatarModel _setAvatarModel;
  //API
  Future<void> setCover({File? file}) async {
    emit(SetCoverLoadingState());
    try {
      _setCoverModel = await coverImageRepo.setCoverRepo(file: file!);

      print(_setCoverModel.results!.cover);
      emit(SetCoverSuccessState());
    } on DioError catch (error) {
      print(error);
      emit(SetCoverErrorState());
    }
  }

  Future<void> setAvatar({File? file}) async {
    emit(SetAvatarLoadingState());
    try {
      _setAvatarModel = await coverImageRepo.setImageRepo(file: file!);

      print(_setAvatarModel.results!.avatar);
      emit(SetAvatarSuccessState());
    } on DioError catch (error) {
      print(error);
      emit(SetAvatarErrorState());
    }
  }

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
