import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_user_photo_state.dart';

class GetUserPhotoCubit extends Cubit<GetUserPhotoState> {
  GetUserPhotoCubit() : super(GetUserPhotoInitial());
}
