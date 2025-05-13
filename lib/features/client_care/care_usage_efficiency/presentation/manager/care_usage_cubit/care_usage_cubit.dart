import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../data/models/care_usage_model.dart';
import '../../../domain/entities/care_usage.dart';
import '../../../domain/entities/care_usage_page_variables_entity.dart';
import '../../../domain/entities/filter_care_usage_entity.dart';
import '../../../domain/repositories/care_usage_repository.dart';
import '../../../domain/usecases/get_care_usage_list.dart';

part 'care_usage_state.dart';

@injectable
class CareUsageCubit extends Cubit<CareUsageState> {
  final GetCareUsageListUseCase _getCareUsageListUseCase;
  final CareUsageRepository _repository;

  CareUsageCubit(
    this._getCareUsageListUseCase,
    this._repository,
  ) : super(const CareUsageState());

  CareUsagePageVariablesEntity pageVariables = CareUsagePageVariablesEntity();

  // استخدام كيان الفلتر مباشرة
  FilterCareUsageEntity filterEntity = FilterCareUsageEntity();

  Future<void> getCareUsageList({
    bool isNewFilter = true,
    bool isDebounced = false,
    int? shouldCommunicate,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getCareUsageListStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getCareUsageListStatus: BlocStatus.loading()));

        // حفظ الحالة السابقة للفلاتر
        filterEntity.savePreviousState();

        print('Filters being sent to API:');
        print(
            'lastActivityFrom: ${filterEntity.lastActivityFromNotifier.value}');
        print('lastActivityTo: ${filterEntity.lastActivityToNotifier.value}');
        print('activityTypeFk: ${filterEntity.activityTypeFkNotifier.value}');
        print('fkRegoin: ${filterEntity.fkRegoinNotifier.value}');
        print('state: ${filterEntity.stateNotifier.value}');
        print('premium: ${filterEntity.premiumNotifier.value}');
        print('package: ${filterEntity.packageNotifier.value}');

        final result = await _getCareUsageListUseCase(
          GetCareUsageListParams(
            skip: pageVariables.allList.length,
            filter: pageVariables.searchController.text,
            endFrom: filterEntity.endFromNotifier.value,
            endTo: filterEntity.endToNotifier.value,
            startFrom: filterEntity.startFromNotifier.value,
            startTo: filterEntity.startToNotifier.value,
            lastActivityFrom: filterEntity.lastActivityFromNotifier.value,
            lastActivityTo: filterEntity.lastActivityToNotifier.value,
            state: pageVariables.type,
            premium: filterEntity.premiumNotifier.value,
            package: filterEntity.packageNotifier.value,
            fkRegoin: filterEntity.fkRegoinNotifier.value,
            activityTypeFk: filterEntity.activityTypeFkNotifier.value,

            // shouldCommunicate: shouldCommunicate ??
            //     (pageVariables.shouldCommunicate == 1 ? 1 : 0),
          ),
        );

        result.fold(
          (error) {
            if (AppConstants.shouldReturnEarly(error)) return;
            emit(state.copyWith(
              getCareUsageListStatus: BlocStatus.fail(error: error),
            ));
          },
          (response) {
            final careUsageList = response.data as List<CareUsageModel>;
            pageVariables.allList.addAll(careUsageList);
            pageVariables.totalCount = response.count ?? 0;
            pageVariables.hasReachedEnd = careUsageList.isEmpty;

            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getCareUsageListStatus: BlocStatus.empty(),
              ));
            }

            emit(state.copyWith(
              getCareUsageListStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_get_care_usage',
      isDebounced: isDebounced,
    );
  }

  void toggleCommunicationTab(int index) {
    pageVariables.type = index == 0 ? 'online' : 'rare';
    getCareUsageList();
  }

  // إضافة وظائف الفلاتر هنا
  void applyFilters() {
    getCareUsageList();
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }

  Future<void> doneCommunication(int communicationId) async {
    emit(state.copyWith(
      doneCommunicationStatus: const BlocStatus.loading(),
    ));

    try {
      final result = await _repository.doneCommunication(communicationId);
      result.fold(
        (failure) => emit(state.copyWith(
          doneCommunicationStatus: BlocStatus.fail(error: failure.toString()),
        )),
        (careUsage) {
          final updatedList = pageVariables.allList.map((item) {
            if (item.idCommunication == communicationId) {
              return careUsage;
            }
            return item;
          }).toList();

          pageVariables.allList = updatedList;

          emit(state.copyWith(
            careUsageList: updatedList,
            doneCommunicationStatus: const BlocStatus.success(),
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        doneCommunicationStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }
}
