part of 'regions_cubit.dart';

@immutable
abstract class RegionsState {}

class RegionsInitial extends RegionsState {}

class RegionsLoading extends RegionsState {}

class RegionsLoaded extends RegionsState {}

class RegionsError extends RegionsState {
  final String message;

  RegionsError(this.message);
}

class RegionSelected extends RegionsState {}
