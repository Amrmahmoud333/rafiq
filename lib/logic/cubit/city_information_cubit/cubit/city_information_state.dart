part of 'city_information_cubit.dart';

@immutable
abstract class CityInformationState {}

class CityInformationCubitInitial extends CityInformationState {}

class CityInformationLoading extends CityInformationState {}

class CityInformationSuccess extends CityInformationState {}

class CityInformationError extends CityInformationState {}
