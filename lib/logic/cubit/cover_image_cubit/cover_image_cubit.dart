import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/set_cover_image_model.dart';
import 'package:rafiq/data/repositories/cover_image_repo.dart';

part 'cover_image_state.dart';

class CoverImageCubit extends Cubit<CoverImageState> {
  CoverImageRepo coverImageRepo;
  CoverImageCubit({required this.coverImageRepo}) : super(CoverImageInitial());

  late setCoverModel _setCoverModel;
  late setAvatarModel _setAvatarModel;

  Future<void> setCover({File? file}) async {
    emit(GetCoverLoadingState());
    try {
      _setCoverModel = await coverImageRepo.setCoverRepo(file: file!);

      print(_setCoverModel.results!.cover);
      emit(GetCoverSuccessState());
    } on DioError catch (error) {
      print(error);
      emit(GetCoverErrorState());
    }
  }

  Future<void> setAvatar({File? file}) async {
    emit(GetAvatarLoadingState());
    try {
      _setAvatarModel = await coverImageRepo.setImageRepo(file: file!);

      print(_setAvatarModel.results!.avatar);
      emit(GetAvatarSuccessState());
    } on DioError catch (error) {
      print(error);
      emit(GetAvatarErrorState());
    }
  }
}
