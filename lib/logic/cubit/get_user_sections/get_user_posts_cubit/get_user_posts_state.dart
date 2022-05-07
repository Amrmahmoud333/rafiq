part of 'get_user_posts_cubit.dart';

@immutable
abstract class GetUserPostsState {}

class GetUserPostsInitial extends GetUserPostsState {}

class PostsLoaded extends GetUserPostsState {
  // that we will fetch from API
  final List<Posts> posts;

  PostsLoaded(this.posts);
}

class PostsLoading extends GetUserPostsState {
  // hold the data that alterady fetched
  // if we dont fo that our old data will be lost
  final List<Posts> oldPosts;
  // to know that the data is fetching now
  final bool isFirstFetch;

  PostsLoading(this.oldPosts, {this.isFirstFetch = false});
}

class GetUserFirstPostsLoadinngState extends GetUserPostsState {}

class GetUserFirstPostsSuccessState extends GetUserPostsState {}

class GetUserFirstPostsErrorState extends GetUserPostsState {}

class GetUserMorePostsLoadinngState extends GetUserPostsState {}

class GetUserMorePostsSuccessState extends GetUserPostsState {}

class GetUserMorePostsErrorState extends GetUserPostsState {}

class ChangeSeeMoreSuccessState extends GetUserPostsState {}

class InitStateUISuccess extends GetUserPostsState {}

class ChangeMorePostsState extends GetUserPostsState {}

class ChangeLabelState extends GetUserPostsState {}
