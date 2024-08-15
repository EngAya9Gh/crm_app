part of 'cities_cubit.dart';

class CitiesState extends Equatable {
  final BlocStatus getCityStatus;
  final BlocStatus selectCityStatus;

  const CitiesState({
    this.getCityStatus = const BlocStatus.initial(),
    this.selectCityStatus = const BlocStatus.initial(),
  });

  CitiesState copyWith({
    BlocStatus? getCityStatus,
    BlocStatus? selectCityStatus,
  }) {
    return CitiesState(
      getCityStatus: getCityStatus ?? this.getCityStatus,
      selectCityStatus: selectCityStatus ?? this.selectCityStatus,
    );
  }

  @override
  List<Object> get props => [getCityStatus, selectCityStatus];
}
