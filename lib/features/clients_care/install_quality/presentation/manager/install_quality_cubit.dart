import 'package:bloc/bloc.dart';
import 'package:crm_smart/model/communication_modle.dart';
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

  void init(String idUser) {
    pageVariables = InstallQualityPageVariablesEntity();
    filterEntity = FilterInstallQualityEntity();
  }

  Future<void> getInstall({
    required String fkCountry,
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
            fkCountry: fkCountry,
            installQualityType: pageVariables.installQualityType,
            fkUser: filterEntity.userIdNotifier.value,
            dateFrom: filterEntity.dateFromController.text,
            dateTo: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) => emit(state.copyWith(
            getInstallStatus: BlocStatus.fail(error: e),
          )),
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            filterInstall();
            if (pageVariables.filteredList.isEmpty) {
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
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  void filterInstall() {
    emit(state.copyWith(
      locallyFilterInstallStatus: BlocStatus.loading(),
    ));
    _searchLocallyImpl();
    emit(state.copyWith(
      locallyFilterInstallStatus: BlocStatus.success(),
    ));
  }

  void _searchLocallyImpl() {
    pageVariables.filteredList = List.from(pageVariables.allList.where(
      (element) {
        return _filterConditions(element);
      },
    ));
  }

  bool _filterConditions(CommunicationModel element) {
    bool isFilterTrue = true;
    isFilterTrue &= element.searchString(pageVariables.searchController.text);
    if (filterEntity.employeeNotifier.value != null) {
      isFilterTrue &=
          element.userinstall == filterEntity.employeeNotifier.value?.idUser;
    }
    if (filterEntity.regionIdNotifier.value != null) {
      isFilterTrue &=
          element.fk_regoin == filterEntity.regionIdNotifier.value?.regionId;
    }
    if (filterEntity.statusNotifier.value != null) {
      isFilterTrue &= _filterUsingStatus(element);
    }
    return isFilterTrue;
  }

  bool _filterUsingStatus(CommunicationModel element) {
    if (filterEntity.statusNotifier.value == 'تم التأكد من الجودة') {
      return element.dateCommunication != null;
    } else if (filterEntity.statusNotifier.value == 'انتظار الجودة') {
      return element.dateCommunication == null;
    }
    return true;
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
