part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class ChangeDropDownValState extends SearchState {}

class GetImageFromGalleryToSearchSuccess extends SearchState {}

class SearchByUserLoading extends SearchState {}

class SearchByUserSuccess extends SearchState {}

class SearchByUserError extends SearchState {}

class SearchPlaceLoading extends SearchState {}

class SearchPlaceSuccess extends SearchState {}

class SearchPlaceError extends SearchState {}
