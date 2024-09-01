import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_wrong_numbers_entity.dart';
import '../../domain/entities/wrong_numbers_page_variables_entity.dart';
import '../../domain/use_cases/get_wrong_numbers_usecase.dart';

part 'wrong_numbers_state.dart';

@injectable
class WrongNumbersCubit extends Cubit<WrongNumbersState> {
  final GetWrongNumbersUsecase _getWrongNumbersUsecase;

  WrongNumbersCubit(
    this._getWrongNumbersUsecase,
  ) : super(WrongNumbersState());

  WrongNumbersPageVariablesEntity pageVariables =
      WrongNumbersPageVariablesEntity();
  FilterWrongNumbersEntity filterEntity = FilterWrongNumbersEntity();

  void init(String idUser) {
    pageVariables = WrongNumbersPageVariablesEntity();
    filterEntity = FilterWrongNumbersEntity();
  }

  Future<void> getWrongNumbers({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getWrongNumbersStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getWrongNumbersStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getWrongNumbersUsecase(
          GetWrongNumbersParams(
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
              getWrongNumbersStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getWrongNumbersStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getWrongNumbersStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_wrong_numbers',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
