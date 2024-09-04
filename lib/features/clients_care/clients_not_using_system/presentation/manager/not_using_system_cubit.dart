import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_not_using_system_entity.dart';
import '../../domain/entities/not_using_system_page_variables_entity.dart';
import '../../domain/use_cases/get_not_using_system_usecase.dart';

part 'not_using_system_state.dart';

@injectable
class NotUsingSystemCubit extends Cubit<NotUsingSystemState> {
  final GetNotUsingSystemUsecase _getNotUsingSystemUsecase;

  NotUsingSystemCubit(
    this._getNotUsingSystemUsecase,
  ) : super(NotUsingSystemState());

  NotUsingSystemPageVariablesEntity pageVariables =
      NotUsingSystemPageVariablesEntity();
  FilterNotUsingSystemEntity filterEntity = FilterNotUsingSystemEntity();

  void init(String idUser) {
    pageVariables = NotUsingSystemPageVariablesEntity();
    filterEntity = FilterNotUsingSystemEntity();
  }

  Future<void> getNotUsingSystem({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getNotUsingSystemStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getNotUsingSystemStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getNotUsingSystemUsecase(
          GetNotUsingSystemParams(
            skip: pageVariables.allList.length,
            filter: pageVariables.searchController.text,
            fkUser: filterEntity.userIdNotifier.value,
            fkRegion: filterEntity.regionIdNotifier.value?.branchId,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getNotUsingSystemStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getNotUsingSystemStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getNotUsingSystemStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_not_using_system',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
