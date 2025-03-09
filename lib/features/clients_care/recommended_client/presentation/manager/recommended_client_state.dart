part of 'recommended_client_bloc.dart';

@immutable
class RecommendedClientReportsState {
  final BlocStatus<List<RecommendClientsReports>> recommendedClientList;
  final int totalDataCount;

  const RecommendedClientReportsState({
    this.recommendedClientList = const BlocStatus.initial(),
    this.totalDataCount = 0,
  });

  RecommendedClientReportsState copyWith({
    final BlocStatus<List<RecommendClientsReports>>? recommendedClientList,
    final int? totalDataCount,
  }) {
    return RecommendedClientReportsState(
      recommendedClientList: recommendedClientList ?? this.recommendedClientList,
      totalDataCount: totalDataCount ?? this.totalDataCount,
    );
  }
}
