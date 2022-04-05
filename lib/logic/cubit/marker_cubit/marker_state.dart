part of 'marker_cubit.dart';

@immutable
abstract class MarkerState {}

class MarkerInitial extends MarkerState {}

class AddMarkerLoadingStete extends MarkerState {}

class AddMarkerSuccessStete extends MarkerState {}

class AddMarkerErrorStete extends MarkerState {}

class AddNewMarkerState extends MarkerState {}

class GetMarkerSuccessStete extends MarkerState {}

class GetMarkerErrorStete extends MarkerState {}

class GetNewMarkerState extends MarkerState {}

class ChangeIsDoneState extends MarkerState {}
