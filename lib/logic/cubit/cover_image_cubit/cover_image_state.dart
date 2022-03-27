part of 'cover_image_cubit.dart';

@immutable
abstract class CoverImageState {}

class CoverImageInitial extends CoverImageState {}

class GetCoverLoadingState extends CoverImageState {}

class GetCoverSuccessState extends CoverImageState {}

class GetCoverErrorState extends CoverImageState {}

class GetAvatarLoadingState extends CoverImageState {}

class GetAvatarSuccessState extends CoverImageState {}

class GetAvatarErrorState extends CoverImageState {}
