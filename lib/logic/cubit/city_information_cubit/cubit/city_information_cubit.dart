import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/city/city_Info_API.dart';
import 'package:rafiq/data/models/city/city_information_model.dart';

part 'city_information_state.dart';

class CityInformationCubit extends Cubit<CityInformationState> {
  CityInformationAPI cityInformationAPI;
  CityInformationCubit({required this.cityInformationAPI})
      : super(CityInformationCubitInitial());

  late CityInformationModel cityInformationModel;

  Future<void> getCityInformation() async {
    emit(CityInformationLoading());

    try {
      cityInformationModel = await cityInformationAPI.getCityInfo();
      emit(CityInformationSuccess());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(CityInformationError());
    }
  }
}
