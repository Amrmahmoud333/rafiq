part of 'user_data_cubit.dart';

@immutable
abstract class UserDataState {}

class UserDataInitial extends UserDataState {}

class UserGetDataLoadingState extends UserDataInitial {}

class UserGetDataSuccessState extends UserDataInitial {}

class UserGetDataErrorState extends UserDataInitial {}
