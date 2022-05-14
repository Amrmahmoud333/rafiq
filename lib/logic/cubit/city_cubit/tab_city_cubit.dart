import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabcitycubit_state.dart';

class TabcitycubitCubit extends Cubit<TabcitycubitState> {
  TabcitycubitCubit() : super(TabcitycubitInitial());
}
