import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_city_state.dart';

class TabCityCubit extends Cubit<TabCityState> {
  TabCityCubit() : super(TabCityInitial());

  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    emit(TabCityChangeIndexState());
  }
}
