part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}

class ChangeObscureTextState extends LoginState {}

class ChangeCheckBoxState extends LoginState {}
