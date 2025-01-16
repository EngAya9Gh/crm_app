import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/enums/periodic_communication_client_type_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_periodic_communication_entity.dart';
import '../../domain/entities/periodic_communication_page_variables_entity.dart';
import '../../domain/use_cases/get_periodic_communication_use_case.dart';

part 'periodic_communication_state.dart';

@injectable
class PeriodicCommunicationCubit extends Cubit<PeriodicCommunicationState> {
  final GetPeriodicCommunicationUseCase _getPeriodicCommunicationUsecase;

  PeriodicCommunicationCubit(
    this._getPeriodicCommunicationUsecase,
  ) : super(PeriodicCommunicationState());

  PeriodicCommunicationPageVariablesEntity pageVariables =
      PeriodicCommunicationPageVariablesEntity();

  FilterPeriodicCommunicationEntity filterEntity =
      FilterPeriodicCommunicationEntity();

  void init() {
    pageVariables = PeriodicCommunicationPageVariablesEntity();
    filterEntity = FilterPeriodicCommunicationEntity();
  }

  Future<void> getPeriodicCommunication({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getPeriodicCommunicationStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(
            getPeriodicCommunicationStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getPeriodicCommunicationUsecase(
          GetPeriodicCommunicationParams(
            skip: pageVariables.allList.length,
            filter: pageVariables.searchController.text,
            periodicCommunicationType: pageVariables.periodicCommunicationType,
            fkUser: filterEntity.userIdNotifier.value,
            fkRegion: filterEntity.regionNotifier.value?.branchId,
            dateFrom: filterEntity.dateFromController.text,
            type: filterEntity.type.value?.name.toString(),
            dateTo: filterEntity.dateToController.text,
            rate: filterEntity.rateNotifier.value,
             clientWhoNotRate: filterEntity.isClientWhoNotRate.value?1:0
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getPeriodicCommunicationStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getPeriodicCommunicationStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getPeriodicCommunicationStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_get_periodic_Communication',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
