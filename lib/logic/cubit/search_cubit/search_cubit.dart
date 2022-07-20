import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/seach/search_API.dart';
import 'package:rafiq/data/models/search/search_place_model.dart';
import 'package:rafiq/data/models/search/search_user_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchAPI searchAPI;
  SearchCubit({required this.searchAPI}) : super(SearchInitial());

  late SearchPlaceModel searchPlaceModel;
  late SearchUserModel searchUserModel;

  Future<void> searchByUser({required String user}) async {
    emit(SearchByUserLoading());
    try {
      searchUserModel = await searchAPI.searchByUser(user: user);

      emit(SearchByUserSuccess());
    } on DioError catch (error) {
      log(error.response!.data);
      emit(SearchByUserError());
    }
  }

  Future<void> searchPlace({required String place}) async {
    emit(SearchPlaceLoading());
    try {
      searchPlaceModel = await searchAPI.searchPlace(place: place);
      print(searchPlaceModel.results!.suggestions![0].images!.length);
      emit(SearchPlaceSuccess());
    } on DioError catch (error) {
      log(error.response!.data);
      emit(SearchPlaceError());
    }
  }

  String label = '';
  bool isSearchScreen = false;
  setLabel({required String label}) {
    this.label = label;
  }

  bool isChange = false;
  // UI logic
  String dropDownVal = 'Users';
  List<String> listVals = ['Users', 'Cities'];
  void changeVal(String newVal) {
    dropDownVal = newVal;
    print(dropDownVal);

    emit(ChangeDropDownValState());
  }

  File? imageToSearch;
  void getImageFromGellureToSearch(XFile images) {
    imageToSearch = (File(images.path));
    emit(GetImageFromGalleryToSearchSuccess());
  }

  int test = 0;
}
