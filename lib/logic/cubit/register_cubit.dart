import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/register_api.dart';
import 'package:rafiq/data/models/register_model.dart';
import 'package:rafiq/data/repositories/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  AuthRepo authRepo; // RegisterAPI or local
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  late RegisterModel _registerModel;

  Future<void> userRegister(AuthRequsetModel authRequsetModel) async {
    try {
      _registerModel = await authRepo.registerRepo(authRequsetModel);
      if (_registerModel.success!) {
        print(_registerModel.success);
        emit(RegisterSuccessState());
      } else {
        print(_registerModel.success);
        emit(RegisterErrorState());
      }
      print(authRequsetModel.email);
    } catch (error) {
      print(error.toString());
    }
  }
}
