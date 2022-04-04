import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());
}
