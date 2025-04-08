part of 'search_cubit.dart';

class SearchState {
  final BlocStatus searchStatus;
  final BlocStatus<HomeStatisticsModel> homeStatistics;
  const SearchState({
    this.searchStatus = const BlocStatus.initial(),
    this.homeStatistics = const BlocStatus.initial(),
  });

  SearchState copyWith({
    BlocStatus? searchStatus,
    BlocStatus<HomeStatisticsModel>? homeStatistics,
  }) {
    return SearchState(
      searchStatus: searchStatus ?? this.searchStatus,
      homeStatistics: homeStatistics ?? this.homeStatistics,
    );
  }
}
