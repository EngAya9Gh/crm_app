import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../domain/entities/levels_page_variables_entity.dart';
import '../../../domain/use_cases/get_levels_usecase.dart';

part 'levels_state.dart';

@injectable
class LevelsCubit extends Cubit<LevelsState> {
  final GetLevelsUsecase _getLevelsUsecase;

  LevelsCubit(
    this._getLevelsUsecase,
  ) : super(LevelsState());

  LevelsPageVariablesEntity pageVariables = LevelsPageVariablesEntity();

  void init() {
    pageVariables = LevelsPageVariablesEntity();
  }

  Future<void> getLevels({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getLevelStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getLevelStatus: BlocStatus.loading()));
        final result = await _getLevelsUsecase(GetLevelsParams());
        result.fold(
          (error) {
            if (AppConstants.shouldReturnEarly(error)) return;
            emit(state.copyWith(getLevelStatus: BlocStatus.fail(error: error)));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            emit(state.copyWith(getLevelStatus: BlocStatus.success()));
          },
        );
      },
      tag: 'search_get_levels',
      isDebounced: isDebounced,
    );
  }
}
