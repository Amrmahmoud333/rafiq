import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  bool toggle = false;
  String toggleState = 'OFF';
  changeToggle() {
    toggle = !toggle;
    toggleState == 'OFF' ? toggleState = 'ON' : toggleState = 'OFF';
    emit(ChangeToggleState());
  }
}
