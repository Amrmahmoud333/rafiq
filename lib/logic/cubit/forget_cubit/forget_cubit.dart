import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rafiq/data/models/forget_model.dart';
import 'package:rafiq/data/repositories/authentication/forget_repo.dart';
import 'package:rafiq/logic/cubit/forget_cubit/forget_states.dart';

class ForgetCubit extends Cubit<ForgetStates> {
  ForgetCubit({required this.forgetPasswordRepo}) : super(ForgetInitialState());

  ForgetPasswordRepo forgetPasswordRepo;
  Future<void> forgetPassword(RequestForgetModel requestForgetModel) async {
    emit(ForgetLoadingrState());
    try {
      await forgetPasswordRepo.forgetPasswordRepo(requestForgetModel);
      emit(ForgetSuccessState());
    } on DioError catch (error) {
      print(error);
      emit(ForgetErrorState());
    }
  }

  getUserData() {}
}
