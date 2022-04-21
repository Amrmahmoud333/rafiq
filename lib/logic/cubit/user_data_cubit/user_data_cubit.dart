import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/chach_helper.dart';
import 'package:rafiq/data/models/user_data_model.dart';
import 'package:rafiq/data/repositories/profile/user_data_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataRepo userDataRepo;
  UserDataCubit({required this.userDataRepo}) : super(UserDataInitial());

  late UserDataModel _userDataModel;
  String? firstName;
  String? lastName;
  String? userName;
  String? country;
  String? dateOfBirth;
  String? gender;
  List<SocialMedia>? socialMedia;
  int? numberOfFollowers;
  int? numberOfFollowings;
  String? liveIn;
  Future<void> getUserData() async {
    emit(UserGetDataLoadingState());
    try {
      _userDataModel = await userDataRepo.getUserDataRepo();

      firstName = _userDataModel.results!.firstName;
      lastName = _userDataModel.results!.lastName;
      gender = _userDataModel.results!.gender;
      country = _userDataModel.results!.country;
      userName = _userDataModel.results!.userName;

      dateOfBirth = _userDataModel.results!.dateOfBirth;
      socialMedia = _userDataModel.results!.socialMedia;
      numberOfFollowers = _userDataModel.results!.numberOfFollowers;
      numberOfFollowings = _userDataModel.results!.numberOfFollowings;
      liveIn = _userDataModel.results!.liveIn;
      CahchHelper.saveData(
              key: 'cover', value: _userDataModel.results!.cover.toString())
          .then((value) {});

      CahchHelper.saveData(
              key: 'avatar', value: _userDataModel.results!.avatar.toString())
          .then((value) {});

      print(_userDataModel.results!.firstName);
      emit(UserGetDataSuccessState());
    } on DioError catch (error) {
      print(error.toString() + 'get user data');
      emit(UserGetDataErrorState());
    }
  }
}
