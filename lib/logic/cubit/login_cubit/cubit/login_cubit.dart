import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/data/models/login_model.dart';
import 'package:rafiq/data/repositories/authentication/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(LoginInitialState());

  late LoginModel _loginModel;

  Future<void> login(RequestLoginModel requestLoginModel) async {
    try {
      _loginModel = await loginRepo.loginRepo(requestLoginModel);
      ACCESSTOKEN = _loginModel.results!.accessToken;
      REFRESHTOKEN = _loginModel.results!.refreshToken;
      print(_loginModel.results!.message.toString());
      emit(LoginSuccessState());
    } on DioError catch (error) {
      print(error.response!.data['error']['message']);
      emit(LoginErrorState());
    }
  }
}
