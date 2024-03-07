part of 'cities_cubit.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesLoaded extends CitiesState {}

class CitiesError extends CitiesState {
  final String message;

  CitiesError(this.message);
}

class CitySelected extends CitiesState {}
