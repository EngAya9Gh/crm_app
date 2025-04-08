import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/home/domain/use_cases/get_home_statistic_usecase.dart';
import 'package:crm_smart/features/home/presentation/pages/mob_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/models/search_client_model.dart';
import '../../../../core/common/status.dart';
import '../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../core/services/api/api_services.dart';
import '../../../../core/utils/end_points.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final ApiServices _api;
  final GetHomeStatisticUsecase _getHomeStatisticUsecase;

  SearchCubit(
    this._api,
    this._getHomeStatisticUsecase,
  ) : super(const SearchState());

  final PageVariables pageVariables = PageVariables();

  Future<List<SearchClientModel>> searchClients(String query) async {
    print('SearchCubit: Starting search for query: $query'); // Debug print
    if (query.isEmpty) {
      print('SearchCubit: Empty query, returning empty list'); // Debug print
      pageVariables.allList.clear();
      emit(state.copyWith(searchStatus: const BlocStatus.initial()));
      return [];
    }

    emit(state.copyWith(searchStatus: const BlocStatus.loading()));

    try {
      print('SearchCubit: Making API call...'); // Debug print
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await _api.get(endPoint: EndPoints.client.allClientsWithFilter, queryParameters: {"filter": query});

      print('SearchCubit: API response received: ${response != null}'); // Debug print

      if (response != null) {
        // Handle the response as a Map
        final Map<String, dynamic> responseMap = response as Map<String, dynamic>;
        final List<dynamic> data = responseMap['message'] ?? [];
        print('data: Found ${data.length} clients');
        final List<SearchClientModel> clients = data.map((json) => SearchClientModel.fromJson(json)).toList();

        print('SearchCubit: Found ${clients.length} clients'); // Debug print
        pageVariables.allList = clients;
        emit(state.copyWith(
          searchStatus: const BlocStatus.success(),
        ));
        return clients;
      } else {
        print('SearchCubit: No response from API'); // Debug print
        emit(state.copyWith(
          searchStatus: const BlocStatus.empty(),
        ));
        return [];
      }
    } catch (e) {
      print('SearchCubit: Error occurred: $e'); // Debug print
      emit(state.copyWith(
        searchStatus: BlocStatus.fail(error: e.toString()),
      ));
      return [];
    }
  }

  Future<void> getHomeStatistics() async {
    emit(state.copyWith(homeStatistics: BlocStatus.loading()));
    final result = await _getHomeStatisticUsecase();
    result.extract(
      (exception, message) => emit(
        state.copyWith(homeStatistics: BlocStatus.fail(error: message)),
      ),
      (value) => emit(
        state.copyWith(homeStatistics: BlocStatus.success(data: value.message)),
      ),
    );
  }
}
