part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class ChangeDropDownValState extends SearchState {}

class GetImageFromGalleryToSearchSuccess extends SearchState {}