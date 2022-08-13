import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/core/components/components.dart';
import 'package:rafiq/data/models/register_model.dart';
import 'package:rafiq/data/repositories/authentication/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepo authRepo; // RegisterAPI or local
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  late RegisterModel registerModel;
  String massege = '';
  Future<void> userRegister(
      RequsetRegisterModel authRequsetModel, BuildContext context) async {
    try {
      registerModel = await authRepo.registerRepo(authRequsetModel);
      if (registerModel.success!) {
        massege = registerModel.results!.message!;
        print(registerModel.results!.message.toString());
        showSuccessTosat(context, registerModel.results!.message.toString());
        emit(RegisterSuccessState());
      }
    } on DioError catch (error) {
      massege = error.response!.data['error']['message'];
      print(error.response!.data['error']['message']);
      showValidationTosat(context, error.response!.data['error']['message']);
      emit(RegisterErrorState());
    }
  }

  //controller of Page View
  final PageController controllerpage = PageController();
  // manage register screens
  String? firstName, lastName, userName, email, password, confirmPassword;

  void setFirstSignUp(String firstName, String lastName, String userName) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.userName = userName;
  }

  void setSecondSignUp(String email, String password, String confirmPassword) {
    this.password = password;
    this.confirmPassword = confirmPassword;
    this.email = email;
  }

  bool firstObscureText = true;
  void changeFirstObscureText() {
    firstObscureText = !firstObscureText;
    emit(ChangeObscureTextState());
  }

  bool secondObscureText = true;
  void changeSecondObscureText() {
    secondObscureText = !secondObscureText;
    emit(ChangeSecondObscureTextState());
  }

  String? countryValue;

  void changeCountryValue(String newCountryValue) {
    countryValue = newCountryValue;
    emit(ChangeCountryValueState());
  }

  String genderChoose = '';
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

  late DateTime dateTime = DateTime.now();

  void chandeDateTime(DateTime newDateTime) {
    dateTime = newDateTime;

    emit(ChandeDateTimeState());
  }

  int indexOfPageview = 0;
  bool isLastPage = false;
  String lable = 'Next';
  void isLastPageInPageView(index) {
    indexOfPageview = index;
    isLastPage = true;
    lable = 'Sign up';
    emit(IsLastPageInPageViewState());
  }

  void notIsLastPageInPageView(index) {
    indexOfPageview = index;
    isLastPage = false;
    lable = 'Next';
    emit(NotIsLastPageInPageViewState());
  }

  //controllers &&Functions Validate of first Sign up
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  bool customValidteFirstName() {
    if (!(RegExp(r'^[a-zA-Z]{2,35}$').hasMatch(firstNameController.text))) {
      return false;
    } else {
      return true;
    }
  }

  bool customValidteLastName() {
    if (!(RegExp(r'^[a-zA-Z]{2,35}$').hasMatch(lastNameController.text))) {
      return false;
    } else {
      return true;
    }
  }

  bool customValidteUserName() {
    bool b = false;
    // dont work
    for (int i = 1; i < userNameController.text.length; i++) {
      if (userNameController.text[i] == ' ' &&
          userNameController.text[i + 1] == ' ') {
        b == true;
      }
    }
    if (!(RegExp(r'^[a-z A-Z0-9]{2,35}$').hasMatch(userNameController.text))) {
      if (b == true) {
        return false;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  //controllers  &&Functions Validateof Second Sign up
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool customValidteEmail() {
    if (!(RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text))) {
      return false;
    } else {
      return true;
    }
  }

  bool customValidtePassword() {
    if (passwordController.text.length < 8 ||
        passwordController.text.length > 64) {
      return false;
    } else {
      return true;
    }
  }

  bool customValidteConfirmPassword() {
    if (confirmPasswordController.text.length < 8 ||
        confirmPasswordController.text.length > 64) {
      return false;
    } else {
      return true;
    }
  }
}
