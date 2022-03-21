import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/core/constants/user_data.dart';
import 'package:rafiq/data/models/user_data_model.dart';
import 'package:rafiq/data/repositories/user_data_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataRepo userDataRepo;
  UserDataCubit({required this.userDataRepo}) : super(UserDataInitial());

  late UserDataModel _userDataModel;
  String? covver;
  Future<void> getUserData() async {
    emit(UserGetDataLoadingState());
    try {
      _userDataModel = await userDataRepo.getUserDataRepo();

      firstName = _userDataModel.results!.firstName;
      lastName = _userDataModel.results!.lastName;
      gender = _userDataModel.results!.gender;

      avatar = _userDataModel.results!.avatar;
      covver = _userDataModel.results!.cover;
      dateOfBirth = _userDataModel.results!.dateOfBirth;

      numberOfFollowers = _userDataModel.results!.numberOfFollowers;
      numberOfFollowings = _userDataModel.results!.numberOfFollowings;
      print(_userDataModel.results!.firstName);
      emit(UserGetDataSuccessState());
    } on DioError catch (error) {
      print(error);
      emit(UserGetDataErrorState());
    }
  }
}
