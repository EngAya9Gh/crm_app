import '../models/home_statistics_model.dart';

abstract class HomeStatisticsRepository {
  Future<HomeStatisticsModel> getHomeStatistics();
}
