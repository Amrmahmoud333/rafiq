import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trip_cubit_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(TripCubitInitial());

  int tripDayValue = 0;
  String? countryValue;

  void changeCountryValue(String newCountryValue) {
    countryValue = newCountryValue;
    emit(ChangeCountryValueState());
  }

  String? cityValue;

  void changeCityValue(String newCityValue) {
    cityValue = newCityValue;
    emit(ChangeCityValueState());
  }

  String? transporationValue;

  void changeTransporationValue(String newTransporationValue) {
    transporationValue = newTransporationValue;
    emit(ChangeTransporationValueState());
  }

  String? placeValue;

  void changePlaceValue(String newTransporationValue) {
    transporationValue = newTransporationValue;
    emit(ChangePlaceValueState());
  }

  String? currenciesValue;
  void changeCurrenciesValue(String newcurrenciesValue) {
    currenciesValue = newcurrenciesValue;
    emit(ChangeCurrenciesValueState());
  }
}
