import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/city/activities_API.dart';
import 'package:rafiq/data/models/city/activities_model.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesAPI activitiesAPI;
  ActivitiesCubit({required this.activitiesAPI}) : super(ActivitiesInitial());

  late ActivitiesModel activitiesModel;

  Future<void> getActivities() async {
    emit(ActivitiesLoading());
    try {
      activitiesModel = await activitiesAPI.getActivities();
      emit(ActivitiesSuccess());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(ActivitiesError());
    }
  }
}