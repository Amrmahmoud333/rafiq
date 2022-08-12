import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/login_model.dart';
import 'package:rafiq/data/repositories/authentication/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(LoginInitialState());

  late LoginModel loginModel;

  Future<void> login(RequestLoginModel requestLoginModel) async {
    emit(LoginLoadingrState());
    try {
      loginModel = await loginRepo.loginRepo(requestLoginModel);

      print(loginModel.results!.message.toString());
      emit(LoginSuccessState());
    } on DioError catch (error) {
      print(error.response);

      emit(LoginErrorState());
    }
  }

  // working with UI

  bool obscureText = true;
  void changeObscureText() {
    obscureText = !obscureText;
    emit(ChangeObscureTextState());
  }

  bool checkedBox = false;
  void changeCheckBox() {
    checkedBox = !checkedBox;
    emit(ChangeCheckBoxState());
  }
}
