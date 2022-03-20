import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/register_model.dart';
import 'package:rafiq/data/repositories/authentication/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepo authRepo; // RegisterAPI or local
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  late RegisterModel _registerModel;

  Future<void> userRegister(RequsetRegisterModel authRequsetModel) async {
    late String message;
    try {
      _registerModel = await authRepo.registerRepo(authRequsetModel);
      message = _registerModel.success!.toString();
      if (_registerModel.success!) {
        print(_registerModel.results!.message.toString());
        emit(RegisterSuccessState());
      }
    } on DioError catch (error) {
      print(error.response!.data['error']['message']);
      emit(RegisterErrorState());
    }
  }

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
  void IsLastPageInPageView(index) {
    indexOfPageview = index;
    isLastPage = true;
    lable = 'Sign up';
    emit(IsLastPageInPageViewState());
  }

  void NotIsLastPageInPageView(index) {
    indexOfPageview = index;
    isLastPage = false;
    lable = 'Next';
    emit(NotIsLastPageInPageViewState());
  }
}
