import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
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
      print(error.toString() + 'update user info');
      emit(UpdateUserInfoErrorState());
    }
  }
}
