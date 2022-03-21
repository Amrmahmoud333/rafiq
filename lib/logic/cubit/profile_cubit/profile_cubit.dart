import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/models/update_cover_model.dart';
import 'package:rafiq/data/repositories/update_cover_repo.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  UpdateCoverRepo updateCoverRepo;
  ProfileCubit({required this.updateCoverRepo}) : super(ProfileIntialState());

  late UpdateCoverModel _updateCoverModel;
  Future<void> getCover() async {
    emit(ProfileGetCoverLoadingState());
    try {
      _updateCoverModel = await updateCoverRepo.updateCoverRepo();
      coverLink = _updateCoverModel.results!.cover;

      emit(ProfileGetCoverSuccessState());
      print(coverLink! + ' coverLink');
    } on DioError catch (error) {
      print(error);
      emit(ProfileGetCoverSuccessError());
    }
  }

  // working with UI
  int currentIndex = 0;
  List<String> selectTap = ['Posts', 'Image', 'Videos', 'Map'];
  List<Icon> selectTapIcon = [
    const Icon(
      Icons.post_add_outlined,
      size: 21,
    ),
    const Icon(
      Icons.image,
      size: 21,
    ),
    const Icon(
      Icons.videocam_outlined,
      size: 21,
    ),
    const Icon(
      Icons.map,
      size: 21,
    ),
  ];

  void ChangeIndex(index) {
    currentIndex = index;
    emit(ProfileChangeIndexlState());
  }
}
