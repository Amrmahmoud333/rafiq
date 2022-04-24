import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/models/update_user_info_model.dart';
import 'package:rafiq/data/repositories/profile/update_user_info_model_repo.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdataUserInfoRepo updataUserInfoRepo;
  UpdateUserCubit({required this.updataUserInfoRepo})
      : super(UpdateUserInitial());

  late UpdateUserInfoResModel updateUserInfoResModel;

  Future<void> updateUserInfo(
      UpdateUserInfoReqModel updateUserInfoReqModel) async {
    emit(UpdateUserInfoLoadingState());
    try {
      updateUserInfoResModel =
          await updataUserInfoRepo.updateUserInfoRepo(updateUserInfoReqModel);
      emit(UpdateUserInfoSuccessState());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(UpdateUserInfoErrorState());
    }
  }

//Edit putton functions
  Color backGroundBottonColor = const Color(0xFF5B618A);
  String lable = 'Save';
  Color colorOFLable = const Color(0xFFFFFFFF);

  void changeLableOfButtonSaveEditProfileData() {
    lable = 'Saved';
    emit(ChangeLableOfButtonState());
  }

  void changeBackGroundColorOfButtonSaveEditProfileData() {
    backGroundBottonColor = const Color(0xFFF2ECF4);
    emit(ChangeBackGroundColorOfButtonState());
  }

  void changeColorLableOfButtonSaveEditProfileData() {
    colorOFLable = const Color(0xFF5B618A);
    emit(ChangeColorLableOfButtonState());
  }

  String? countryValue;

  void changeCountryValue(String newCountryValue) {
    countryValue = newCountryValue;
    emit(ChangeCountryValueState());
  }

  String? genderChoose;
  bool isMale = false, isFemale = false;

  void changeGenderValue(String gender) {
    if (gender == 'Male') {
      isMale = !isMale;
      isFemale = false;
      genderChoose = 'Male';
    } else {
      isFemale = !isFemale;
      isMale = false;
      genderChoose = 'Female';
    }
    emit(ChangeGenderValueState());
  }

  DateTime dateTime = DateTime.now();
  String dateOfBirth = '';
  void chandeDateTime(DateTime newDateTime) {
    dateTime = newDateTime;
    dateOfBirth = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    emit(ChandeDateTimeState());
  }

  bool obscureText = true;
  void changeObscureText() {
    obscureText = !obscureText;
    emit(ChangeObscureTextState());
  }

  /*tackControllersData({
    required String firstName,
    required String lastName,
    required String lineIn,
  }) async {
    fIRSTNAME = firstName;
    lASTNAME = lastName;
    lIVEIN = lineIn;
    emit(TackControllersData());
  }*/

  final TextEditingController firstNameController =
      TextEditingController(text: fIRSTNAME);
  //  ..text = ' ${context.read<UserDataCubit>().firstName!}';

  final TextEditingController lastNameController =
      TextEditingController(text: lASTNAME);
  // ..text = '${context.read<UserDataCubit>().lastName!}';

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController liveInController =
      TextEditingController(text: lIVEIN);
  /* ..text = context.read<UserDataCubit>().liveIn == null
          ? ''
          : '${context.read<UserDataCubit>().liveIn}';*/

  final TextEditingController facebookController = TextEditingController();
  /* ..text = !facebook
          ? ''
          : '${context.read<UserDataCubit>().socialMedia![indexfaceBook].userName}';*/

  final TextEditingController instagramController = TextEditingController();
  /*..text = !insta
          ? ''
          : '${context.read<UserDataCubit>().socialMedia![indexInsta].userName}';*/

  final TextEditingController tiktokController = TextEditingController();
  /*   ..text = !tikTok
          ? ''
          : '${context.read<UserDataCubit>().socialMedia![indexTiktok].userName}';*/
  final TextEditingController youtubeController = TextEditingController();
  /* ..text = !youtube
          ? ''
          : '${context.read<UserDataCubit>().socialMedia![indexYoutube].userName}';*/
}
