import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../data/models/level_model.dart';
import '../../../domain/entities/add_level_form_variables.dart';
import '../../../domain/entities/levels_page_variables_entity.dart';
import '../../../domain/use_cases/add_level_usecase.dart';
import '../../../domain/use_cases/get_levels_usecase.dart';

part 'levels_state.dart';

@injectable
class LevelsCubit extends Cubit<LevelsState> {
  final GetLevelsUsecase _getLevelsUsecase;
  final AddLevelUsecase _addLevelUsecase;

  LevelsCubit(
    this._getLevelsUsecase,
    this._addLevelUsecase,
  ) : super(LevelsState());

  LevelsPageVariablesEntity pageVariables = LevelsPageVariablesEntity();
  AddLevelFormVariables addLevelFormVariables = AddLevelFormVariables();

  void init() {
    pageVariables = LevelsPageVariablesEntity();
    addLevelFormVariables = AddLevelFormVariables();
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

  Future<void> addLevel() async {
    emit(state.copyWith(addLevelStatus: BlocStatus.loading()));
    final result = await _addLevelUsecase(AddLevelParams(
      levelName: addLevelFormVariables.nameController.text,
    ));
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(addLevelStatus: BlocStatus.fail(error: error)));
      },
      (value) {
        _addLevelLocally(value.data);
        emit(state.copyWith(
            addLevelStatus: BlocStatus.success(data: value..data)));
      },
    );
  }

  void _addLevelLocally(String? levelId) {
    emit(state.copyWith(getLevelStatus: BlocStatus.loading()));
    if (levelId != null) {
      pageVariables.allList.insert(
          0,
          LevelModel(
            idLevel: levelId,
            nameLevel: addLevelFormVariables.nameController.text,
          ));
      pageVariables.totalCount++;
    }
    emit(state.copyWith(getLevelStatus: BlocStatus.success()));
  }
}
