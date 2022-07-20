part of 'get_user_photo_cubit.dart';

@immutable
abstract class GetUserPhotoState {}

class GetUserPhotoInitial extends GetUserPhotoState {}

class GetUserPhotoLoading extends GetUserPhotoState {}

class GetUserPhotoSuccess extends GetUserPhotoState {}

class GetUserPhotoError extends GetUserPhotoState {}
