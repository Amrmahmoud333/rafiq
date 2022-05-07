part of 'post_like_cubit.dart';

@immutable
abstract class PostLikeState {}

class PostLikeInitial extends PostLikeState {}

//  make post like
class PostLikeLoadingState extends PostLikeState {}

class PostLikeSuccessState extends PostLikeState {}

class PostLikeErrorState extends PostLikeState {}
