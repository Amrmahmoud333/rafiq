import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/models/delete_cover_avatar.dart';
import 'package:rafiq/data/models/set_cover_avatar_model.dart';
import 'package:rafiq/data/repositories/profile/cover_image_repo.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  CoverImageRepo coverImageRepo;
  ProfileCubit({required this.coverImageRepo}) : super(ProfileIntialState());

  late SetCoverModel _setCoverModel;
  late SetAvatarModel _setAvatarModel;
  late DeleteCoverModel _deleteCoverModel;
  late DeleteAvatarModel _deleteAvatarModel;

  //API

  // two functions for Set covrt && avatart
  Future<void> setCover({File? file}) async {
    emit(SetCoverLoadingState());
    try {
      _setCoverModel = await coverImageRepo.setCoverRepo(file: file!);
      //  cover = _setCoverModel.results!.cover;
      /* CahchHelper.updateData(
          key: 'cover', value: _setCoverModel.results!.cover);*/
      print(_setCoverModel.results!.cover);

      emit(SetCoverSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(SetCoverErrorState());
    }
  }

  Future<void> setAvatar({File? file}) async {
    emit(SetAvatarLoadingState());
    try {
      _setAvatarModel = await coverImageRepo.setImageRepo(file: file!);

      //   avatar = _setAvatarModel.results!.avatar;

      print(_setAvatarModel.results!.avatar);
      emit(SetAvatarSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(SetAvatarErrorState());
    }
  }

  // two functions for delete covrt && avatart
  Future<void> deleteCover() async {
    emit(DeleteCoverLoadingState());
    try {
      _deleteCoverModel = await coverImageRepo.deleteCoverRepo();
      //  cover = 'null';
      emit(DeleteCoverSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(DeleteCoverErrorState());
    }
  }

  Future<void> deleteAvatar() async {
    emit(DeleteAvatarLoadingState());
    try {
      _deleteAvatarModel = await coverImageRepo.deleteAvatarRepo();
      // avatar = 'null';
      emit(DeleteCoverSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(DeleteCoverErrorState());
    }
  }
  // working with UI

  File? avatarImageFile;
  void fileAvatarImagePath(XFile profileImage) {
    avatarImageFile = File(profileImage.path);
    emit(ProfileImageFromGalleryOrCameraState());
  }

  File? coverImageFile;
  void fileCoverImagePath(XFile coverImage) {
    coverImageFile = File(coverImage.path);

    emit(CoverImageFromGalleryOrCameraState());
  }

  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    emit(ProfileChangeIndexState());
  }
}
