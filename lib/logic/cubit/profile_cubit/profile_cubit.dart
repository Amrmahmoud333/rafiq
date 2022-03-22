import 'package:bloc/bloc.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileIntialState());

  // working with UI

  int currentIndex = 0;
  void ChangeIndex(index) {
    currentIndex = index;
    emit(ProfileChangeIndexlState());
  }
}
