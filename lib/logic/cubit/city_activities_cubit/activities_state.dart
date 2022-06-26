part of 'activities_cubit.dart';

@immutable
abstract class ActivitiesState {}

class ActivitiesInitial extends ActivitiesState {}

class ActivitiesLoading extends ActivitiesState {}

class ActivitiesSuccess extends ActivitiesState {}

class ActivitiesError extends ActivitiesState {}
