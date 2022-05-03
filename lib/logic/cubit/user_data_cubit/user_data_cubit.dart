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

      for (var x = 0; x < _userDataModel.results!.socialMedia!.length; x++) {
        if (_userDataModel.results!.socialMedia![x].label == 'facebook') {
          if (FACEBOOK == '') {
            await CahchHelper.updateData(
                    key: 'facebook',
                    value: _userDataModel.results!.socialMedia![x].userName
                        .toString())
                .then(
              (value) => FACEBOOK = CahchHelper.getData(key: 'facebook'),
            );
          } else {
            await CahchHelper.saveData(
                    key: 'facebook',
                    value: _userDataModel.results!.socialMedia![x].userName
                        .toString())
                .then((value) {
              FACEBOOK = CahchHelper.getData(key: 'facebook');
            });
          }
        } else if (_userDataModel.results!.socialMedia![x].label ==
            'instagram') {
          if (INSTAGRAM == '') {
            await CahchHelper.updateData(
                    key: 'instagram',
                    value: _userDataModel.results!.socialMedia![x].userName
                        .toString())
                .then(
              (value) => INSTAGRAM = CahchHelper.getData(key: 'instagram'),
            );
          } else {
            await CahchHelper.saveData(
                    key: 'instagram',
                    value: _userDataModel.results!.socialMedia![x].userName
                        .toString())
                .then((value) {
              INSTAGRAM = CahchHelper.getData(key: 'instagram');
            });
          }
        } else if (_userDataModel.results!.socialMedia![x].label == 'youtube') {
          if (YOUTUBE == '') {
            await CahchHelper.updateData(
                    key: 'youtube',
                    value: _userDataModel.results!.socialMedia![x].userName
                        .toString())
                .then(
              (value) => YOUTUBE = CahchHelper.getData(key: 'youtube'),
            );
          } else {
            await CahchHelper.saveData(
                    key: 'youtube',
                    value: _userDataModel.results!.socialMedia![x].userName
                        .toString())
                .then((value) {
              YOUTUBE = CahchHelper.getData(key: 'youtube');
            });
          }
        } else {
          {
            if (TIKToK == '') {
              await CahchHelper.updateData(
                      key: 'tiktok',
                      value: _userDataModel.results!.socialMedia![x].userName
                          .toString())
                  .then(
                (value) => TIKToK = CahchHelper.getData(key: 'tiktok'),
              );
            } else {
              await CahchHelper.saveData(
                      key: 'tiktok',
                      value: _userDataModel.results!.socialMedia![x].userName
                          .toString())
                  .then((value) {
                TIKToK = CahchHelper.getData(key: 'tiktok');
              });
            }
          }
        }
      }
      emit(UserGetDataSuccessState());
    } on DioError catch (error) {
      //print(error.response!.data);
      emit(UserGetDataErrorState());
    }
  }
}
