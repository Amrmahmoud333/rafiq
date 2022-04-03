import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/add_marker_model.dart';
import 'package:rafiq/data/models/get_marker_model.dart';
import 'package:rafiq/data/repositories/marker_repo.dart';
import 'package:flutter/material.dart';

part 'marker_state.dart';

class MarkerCubit extends Cubit<MarkerState> {
  MarkerRepo markerRepo;
  MarkerCubit({required this.markerRepo}) : super(MarkerInitial());

  late AddMarkResponseModel addMarkResponseModel;

  Future<void> addMarker(AddMarkRequestModel addMarkRequestModel) async {
    emit(AddMarkerLoadingStete());
    try {
      addMarkResponseModel = await markerRepo.addMarkRepo(addMarkRequestModel);

      emit(AddMarkerSuccessStete());
    } on DioError catch (error) {
      print(error.error.toString() + 'from marker cubit');
      emit(AddMarkerErrorStete());
    }
  }

  late GetMarkerResponseModel getMarkerResponseModel;
  late Set<Marker> myMarkers;

  Future<void> getMarker() async {
    emit(GetMarkerSuccessStete());
    try {
      getMarkerResponseModel = await markerRepo.getMarkRepo();
      //  myMarkers = getMarkerResponseModel.results.travelMap;
      emit(GetMarkerSuccessStete());
    } on DioError catch (error) {
      print(error.error.toString() + 'from marker cubit');
      emit(GetMarkerErrorStete());
    }
  }
}
