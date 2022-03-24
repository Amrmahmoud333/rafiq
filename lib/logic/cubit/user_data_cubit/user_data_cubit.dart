import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/user_data_model.dart';
import 'package:rafiq/data/repositories/user_data_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataRepo userDataRepo;
  UserDataCubit({required this.userDataRepo}) : super(UserDataInitial());

  late UserDataModel _userDataModel;
  String? cover;
  String? firstName;
  String? lastName;
  String? userName;
  String? country;
  String? dateOfBirth;
  String? gender;
  String? avatar;

  int? numberOfFollowers;
  int? numberOfFollowings;

  Future<void> getUserData() async {
    emit(UserGetDataLoadingState());
    try {
      _userDataModel = await userDataRepo.getUserDataRepo();

      firstName = _userDataModel.results!.firstName;
      lastName = _userDataModel.results!.lastName;
      gender = _userDataModel.results!.gender;
      country = _userDataModel.results!.country;
      userName = _userDataModel.results!.userName;
      avatar = _userDataModel.results!.avatar;
      cover = _userDataModel.results!.cover;
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
