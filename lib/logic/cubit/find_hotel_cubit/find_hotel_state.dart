part of 'find_hotel_cubit.dart';

@immutable
abstract class FindHotelState {}

class FindHotelInitial extends FindHotelState {}

class FindHotelLoading extends FindHotelState {}

class FindHotelSuccess extends FindHotelState {}

class FindHotelError extends FindHotelState {}

class AddRoomState extends FindHotelState {}

class MinusRoomState extends FindHotelState {}

class AddAdultsState extends FindHotelState {}

class MinusAdultsState extends FindHotelState {}

class AddChildState extends FindHotelState {}

class MinusChildState extends FindHotelState {}

class ChangeDataTimeState extends FindHotelState {}
