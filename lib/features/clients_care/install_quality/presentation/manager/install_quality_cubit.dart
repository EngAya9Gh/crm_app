import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_install_quality_entity.dart';
import '../../domain/entities/install_quality_page_variables_entity.dart';
import '../../domain/use_cases/get_install_use_case.dart';

part 'install_quality_state.dart';

@injectable
class InstallQualityCubit extends Cubit<InstallQualityState> {
  final GetInstallUseCase _getInstallUsecase;

  InstallQualityCubit(
    this._getInstallUsecase,
  ) : super(InstallQualityState());

  InstallQualityPageVariablesEntity pageVariables =
      InstallQualityPageVariablesEntity();
  FilterInstallQualityEntity filterEntity = FilterInstallQualityEntity();

  void init() {
    pageVariables = InstallQualityPageVariablesEntity();
    filterEntity = FilterInstallQualityEntity();
  }

  Future<void> getInstall({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getInstallStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getInstallStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getInstallUsecase(
          GetInstallParams(
            skip: pageVariables.allList.length,
            installQualityType: pageVariables.installQualityType,
            filter: pageVariables.searchController.text,
            fkUser: filterEntity.userIdNotifier.value,
            fkRegion: filterEntity.regionIdNotifier.value?.branchId,
            status: filterEntity.statusNotifier.value,
            dateFrom: filterEntity.dateFromController.text,
            dateTo: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getInstallStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getInstallStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getInstallStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_get_install',
      isDebounced: isDebounced,
    );
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
