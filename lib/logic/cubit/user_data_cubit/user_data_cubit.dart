import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
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
  String? cover;
  String? avatar;
  Future<void> getUserData() async {
    emit(UserGetDataLoadingState());
    try {
      _userDataModel = await userDataRepo.getUserDataRepo();

      firstName = _userDataModel.results!.firstName;
      lastName = _userDataModel.results!.lastName;
      gender = _userDataModel.results!.gender;
      country = _userDataModel.results!.country;
      userName = _userDataModel.results!.userName;
      cover = _userDataModel.results!.cover;
      avatar = _userDataModel.results!.avatar;
      dateOfBirth = _userDataModel.results!.dateOfBirth;
      socialMedia = _userDataModel.results!.socialMedia;
      numberOfFollowers = _userDataModel.results!.numberOfFollowers;
      numberOfFollowings = _userDataModel.results!.numberOfFollowings;
      liveIn = _userDataModel.results!.liveIn;
      if (fIRSTNAME == '') {
        await CahchHelper.updateData(
                key: 'firstName', value: firstName.toString())
            .then(
          (value) => fIRSTNAME = CahchHelper.getData(key: 'firstName'),
        );
      } else {
        await CahchHelper.saveData(
                key: 'firstName', value: firstName.toString())
            .then((value) {
          fIRSTNAME = CahchHelper.getData(key: 'firstName');
        });
      }
      if (lASTNAME == '') {
        await CahchHelper.updateData(
                key: 'lastName', value: lastName.toString())
            .then(
          (value) => lASTNAME = CahchHelper.getData(key: 'lastName'),
        );
      } else {
        await CahchHelper.saveData(key: 'lastName', value: lastName.toString())
            .then((value) {
          lASTNAME = CahchHelper.getData(key: 'lastName');
        });
      }
      if (lIVEIN == '') {
        await CahchHelper.updateData(key: 'liveIn', value: liveIn.toString())
            .then(
          (value) => lIVEIN = CahchHelper.getData(key: 'liveIn'),
        );
      } else {
        await CahchHelper.saveData(key: 'liveIn', value: liveIn.toString())
            .then((value) {
          liveIn = CahchHelper.getData(key: 'liveIn');
        });
      }
      emit(UserGetDataSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(UserGetDataErrorState());
    }
  }
}
