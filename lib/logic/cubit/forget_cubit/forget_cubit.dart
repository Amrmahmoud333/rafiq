import 'package:bloc/bloc.dart';
import 'package:rafiq/logic/cubit/forget_cubit/forget_states.dart';

class ForgetCubit extends Cubit<ForgetStates> {
  ForgetCubit() : super(ForgetInitialState());
}
