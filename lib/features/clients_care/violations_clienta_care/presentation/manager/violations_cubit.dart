import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_violations_entity.dart';
import '../../domain/entities/violations_page_vars_entity.dart';
import '../../domain/use_cases/get_violations_usecase.dart';

part 'violations_state.dart';

@injectable
class ViolationsCubit extends Cubit<ViolationsState> {
  final GetViolationsUsecase _getViolationsUsecase;

  ViolationsCubit(
    this._getViolationsUsecase,
  ) : super(ViolationsState());

  ViolationsPageVarsEntity pageVariables =
  ViolationsPageVarsEntity();
  FilterViolationsEntity filterEntity = FilterViolationsEntity();

  void init(String idUser) {
    pageVariables = ViolationsPageVarsEntity();
    filterEntity = FilterViolationsEntity();
  }

  Future<void> getViolations({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getViolationsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getViolationsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getViolationsUsecase(
          GetViolationsParams(
            skip: pageVariables.allList.length,
            filter: pageVariables.searchController.text,
          //  fkUser: filterEntity.userIdNotifier.value,
          //  fkRegion: filterEntity.regionIdNotifier.value?.branchId,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getViolationsStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getViolationsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getViolationsStatus: BlocStatus.success(),
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
