import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileIntialState());

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
