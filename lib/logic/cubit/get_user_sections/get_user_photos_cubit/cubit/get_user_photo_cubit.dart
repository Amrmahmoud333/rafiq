import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/models/profile_image_model.dart';
import 'package:rafiq/data/repositories/profile/get_profile_sections_repo.dart';

part 'get_user_photo_state.dart';

class GetUserPhotoCubit extends Cubit<GetUserPhotoState> {
  GetProfileSectionsRepo getProfileSectionsRepo;

  GetUserPhotoCubit({required this.getProfileSectionsRepo})
      : super(GetUserPhotoInitial());

  late ProfileImageModel profileImageModel;
  Future<void> getUserPhoto() async {
    emit(GetUserPhotoLoading());
    try {
      profileImageModel = await getProfileSectionsRepo.getSomeUserPhotos();

      emit(GetUserPhotoSuccess());
    } on DioError catch (error) {
      print(error.response!.data);
      emit(GetUserPhotoError());
    }
  }
}
