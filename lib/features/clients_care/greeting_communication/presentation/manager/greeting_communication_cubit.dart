import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_greeting_communication_entity.dart';
import '../../domain/entities/greeting_communication_page_variables_entity.dart';
import '../../domain/use_cases/get_greeting_communication_use_case.dart';

part 'greeting_communication_state.dart';

@injectable
class GreetingCommunicationCubit extends Cubit<GreetingCommunicationState> {
  final GetGreetingCommunicationUseCase _getGreetingCommunicationUsecase;

  GreetingCommunicationCubit(
    this._getGreetingCommunicationUsecase,
  ) : super(GreetingCommunicationState());

  GreetingCommunicationPageVariablesEntity pageVariables =
      GreetingCommunicationPageVariablesEntity();
  FilterGreetingCommunicationEntity filterEntity =
      FilterGreetingCommunicationEntity();

  void init(String idUser) {
    pageVariables = GreetingCommunicationPageVariablesEntity();
    filterEntity = FilterGreetingCommunicationEntity();
  }

  Future<void> getGreetingCommunication({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getGreetingCommunicationStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(
            getGreetingCommunicationStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getGreetingCommunicationUsecase(
          GetGreetingCommunicationParams(
            skip: pageVariables.allList.length,
            fkUser: filterEntity.userIdNotifier.value,
            filter: pageVariables.searchController.text,
            fkRegion: filterEntity.regionIdNotifier.value?.branchId,
            status: filterEntity.statusNotifier.value,
            from: filterEntity.dateFromController.text,
            to: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getGreetingCommunicationStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getGreetingCommunicationStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getGreetingCommunicationStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_get_greeting_communication',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
