import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_previous_ratings_entity.dart';
import '../../domain/entities/previous_ratings_page_variables_entity.dart';
import '../../domain/use_cases/get_previous_ratings_usecase.dart';

part 'previous_ratings_state.dart';

@injectable
class PreviousRatingsCubit extends Cubit<PreviousRatingsState> {
  final GetPreviousRatingsUsecase _getPreviousRatingsUsecase;

  PreviousRatingsCubit(
    this._getPreviousRatingsUsecase,
  ) : super(PreviousRatingsState());

  PreviousRatingsPageVariablesEntity pageVariables =
      PreviousRatingsPageVariablesEntity();
  FilterPreviousRatingsEntity filterEntity = FilterPreviousRatingsEntity();

  void init(String idUser) {
    pageVariables = PreviousRatingsPageVariablesEntity();
    filterEntity = FilterPreviousRatingsEntity();
  }

  Future<void> getPreviousRatings({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        // if (state.getPreviousRatingsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getPreviousRatingsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getPreviousRatingsUsecase(
          GetPreviousRatingsParams(
            typeCommunication: pageVariables.typeCommunication,
            fkUser: filterEntity.careEmployeeNotifier.value?.id,
            userInstall: filterEntity.supportEmployeeNotifier.value?.id,
            starClient: filterEntity.starClientNotifier.value,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getPreviousRatingsStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterPreviousRatings();
            if (pageVariables.filteredList.isEmpty) {
              return emit(state.copyWith(
                getPreviousRatingsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getPreviousRatingsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_previous_ratings',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterPreviousRatings() {
    emit(state.copyWith(
        locallyFilterPreviousRatingsStatus: BlocStatus.loading()));
    pageVariables.filteredList = pageVariables.allList.where((element) {
      return element.searchString(pageVariables.searchController.text);
    }).toList();
    emit(state.copyWith(
        locallyFilterPreviousRatingsStatus: BlocStatus.success()));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
