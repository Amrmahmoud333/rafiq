part of 'get_user_posts_cubit.dart';

@immutable
abstract class GetUserPostsState {}

class GetUserPostsInitial extends GetUserPostsState {}

class GetUserPostsLoadinngState extends GetUserPostsState {}

class GetUserPostsSuccessState extends GetUserPostsState {}

class GetUserPostsErrorState extends GetUserPostsState {}
