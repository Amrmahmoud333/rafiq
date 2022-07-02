part of 'find_hotel_cubit.dart';

@immutable
abstract class FindHotelCubitState {}

class FindHotelInitial extends FindHotelCubitState {}

class FindHotelLoading extends FindHotelCubitState {}

class FindHotelSuccess extends FindHotelCubitState {}

class FindHotelError extends FindHotelCubitState {}
