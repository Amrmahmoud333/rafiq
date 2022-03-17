import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileIntialState());

  int currenindex = 0;
  List<String> selectTap = ['Posts', 'Image', 'Videos', 'Map'];
  List<Icon> selectTapIcon = [
    const Icon(
      Icons.post_add_outlined,
      size: 23,
    ),
    const Icon(
      Icons.image,
      size: 23,
    ),
    const Icon(
      Icons.videocam_outlined,
      size: 23,
    ),
    const Icon(
      Icons.map,
      size: 23,
    ),
  ];

  void ChangeIndex(index) {
    currenindex = index;
    emit(ProfileChangeIndexlState());
  }
}
