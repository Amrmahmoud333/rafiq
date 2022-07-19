part of 'newsfeed_cubit.dart';

@immutable
abstract class NewsfeedState {}

class NewsfeedInitial extends NewsfeedState {}

class GetPostsLoading extends NewsfeedState {}

class GetPostsSuccess extends NewsfeedState {}

class GetPostsError extends NewsfeedState {}

class ChangeISMoreState extends NewsfeedState {}
