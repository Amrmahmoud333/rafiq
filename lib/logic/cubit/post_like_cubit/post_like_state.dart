part of 'post_like_cubit.dart';

@immutable
abstract class PostLikeState {}

class PostLikeInitial extends PostLikeState {}

//  make post like
class PostLikeLoadingState extends PostLikeState {}

class PostLikeSuccessState extends PostLikeState {}

class PostLikeErrorState extends PostLikeState {}

// is like
class IsLikeLoadingState extends PostLikeState {}

class IsLikeSuccessState extends PostLikeState {}

class IsLikeErrorState extends PostLikeState {}

// un like
class UnLikeLoadingState extends PostLikeState {}

class UnLikeSuccessState extends PostLikeState {}

class UnLikeErrorState extends PostLikeState {}
