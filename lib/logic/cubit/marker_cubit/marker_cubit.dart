import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/add_marker_model.dart';
import 'package:rafiq/data/repositories/marker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart'
    as Marker;
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
      print(error.error['message'] + 'from marker cubit');
      emit(AddMarkerErrorStete());
    }
  }

  var myMarkers = HashSet<Marker.Marker>(); // collection

  void onTapMap(LatLng latLng) {
    myMarkers.add(
      Marker.Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        draggable: true,
      ),
    );
    emit(AddNewMarkerState());
  }
}
