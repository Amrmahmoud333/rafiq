part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {}

class ChangeCountryValueState extends RegisterState {}

class ChangeGenderValueState extends RegisterState {}

class ChandeDateTimeState extends RegisterState {}
