part of 'update_user_cubit.dart';

@immutable
abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserInfoLoadingState extends UpdateUserState {}

class UpdateUserInfoSuccessState extends UpdateUserState {}

class UpdateUserInfoErrorState extends UpdateUserState {}

// edit button profile data state
class ChangeLableOfButtonState extends UpdateUserState {}

class ChangeBackGroundColorOfButtonState extends UpdateUserState {}

class ChangeColorLableOfButtonState extends UpdateUserState {}

class ChangeCountryValueState extends UpdateUserState {}

class ChangeGenderValueState extends UpdateUserState {}

class ChandeDateTimeState extends UpdateUserState {}

class ChangeObscureTextState extends UpdateUserState {}

class TackControllersData extends UpdateUserState {}
