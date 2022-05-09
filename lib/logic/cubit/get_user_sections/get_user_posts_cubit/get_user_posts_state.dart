part of 'get_user_posts_cubit.dart';

@immutable
abstract class GetUserPostsState {}

class GetUserPostsInitial extends GetUserPostsState {}

class GetUserFirstPostsLoadinngState extends GetUserPostsState {}

class GetUserFirstPostsSuccessState extends GetUserPostsState {}

class GetUserFirstPostsErrorState extends GetUserPostsState {}

class GetUserMorePostsLoadinngState extends GetUserPostsState {}

class GetUserMorePostsSuccessState extends GetUserPostsState {}

class GetUserMorePostsErrorState extends GetUserPostsState {}

class ChangeISMoreState extends GetUserPostsState {}

class GetPostIdStateState extends GetUserPostsState {}

class DeletePostLoadingState extends GetUserPostsState {}

class DeletePostSuccessState extends GetUserPostsState {}

class DeletePostErrorState extends GetUserPostsState {}
