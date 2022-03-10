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
}
