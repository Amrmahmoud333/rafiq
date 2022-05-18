part of 'trip_cubit_cubit.dart';

@immutable
abstract class TripState {}

class TripCubitInitial extends TripState {}

class ChangeCountryValueState extends TripState {}

class ChangeCityValueState extends TripState {}

class ChangeTransporationValueState extends TripState {}

class ChangePlaceValueState extends TripState {}

class ChangeCurrenciesValueState extends TripState {}
