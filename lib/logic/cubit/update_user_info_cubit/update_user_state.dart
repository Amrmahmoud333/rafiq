part of 'update_user_cubit.dart';

@immutable
abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserInfoLoadingState extends UpdateUserState {}

class UpdateUserInfoSuccessState extends UpdateUserState {}

class UpdateUserInfoErrorState extends UpdateUserState {}
