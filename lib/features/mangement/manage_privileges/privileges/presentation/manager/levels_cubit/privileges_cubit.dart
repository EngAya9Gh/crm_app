import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../data/models/privilege_model.dart';
import '../../../domain/entities/filter_privilege_entity.dart';
import '../../../domain/entities/privileges_page_variables_entity.dart';
import '../../../domain/use_cases/get_privileges_usecase.dart';
import '../../../domain/use_cases/update_privileges_usecase.dart';

part 'privileges_state.dart';

@singleton
class PrivilegesCubit extends Cubit<PrivilegesState> {
  final GetPrivilegesUsecase _getPrivilegesUsecase;
  final UpdatePrivilegesUsecase _updatePrivilegesUsecase;

  PrivilegesCubit(
    this._getPrivilegesUsecase,
    this._updatePrivilegesUsecase,
  ) : super(PrivilegesState());

  PrivilegesPageVariablesEntity pageVariables = PrivilegesPageVariablesEntity();
  FilterPrivilegeEntity filterEntity = FilterPrivilegeEntity();

  void init() {
    pageVariables = PrivilegesPageVariablesEntity();
    filterEntity = FilterPrivilegeEntity();
  }

  setUserPrivileges({required List<PrivilegeModel> privilegeList}) {
    pageVariables.userPrivileges = privilegeList;
  }

  Future<void> getPrivileges({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getPrivilegesStatus: BlocStatus.loading()));
        final result = await _getPrivilegesUsecase(GetPrivilegesParams(
          levelId: pageVariables.currentLevel.idLevel.toString(),
          filter: pageVariables.searchController.text,
          type: filterEntity.privilegeType.value?.name,
        ));
        result.fold(
          (error) {
            if (AppConstants.shouldReturnEarly(error)) return;
            emit(state.copyWith(
                getPrivilegesStatus: BlocStatus.fail(error: error)));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.tempList = List.from(pageVariables.allList);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            emit(state.copyWith(getPrivilegesStatus: BlocStatus.success()));
          },
        );
      },
      tag: 'search_privileges',
      isDebounced: isDebounced,
    );
  }

  Future<void> updatePrivileges() async {
    emit(state.copyWith(updatePrivilegesStatus: BlocStatus.loading()));

    final difference = pageVariables.tempList
        .toSet()
        .difference(pageVariables.allList.toSet())
        .toList();

    if (difference.isEmpty) return;

    final result = await _updatePrivilegesUsecase(
      UpdatePrivilegesParams(
        isCheckList: difference.map((e) => e.isCheck! ? '1' : '0').toList(),
        privilegeUserIdList: difference.map((e) {
          return e.idPrivilegeUser!;
        }).toList(),
      ),
    );
    result.fold(
      (error) {
        if (AppConstants.shouldReturnEarly(error)) return;
        emit(state.copyWith(
            updatePrivilegesStatus: BlocStatus.fail(error: error)));
      },
      (value) {
        emit(state.copyWith(
            updatePrivilegesStatus: BlocStatus.success(data: value..data)));
      },
    );
  }

  void changePrivilege({
    required PrivilegeModel privilegeModel,
  }) {
    if (state.updatePrivilegesStatus.isLoading()) return;

    pageVariables.tempList = pageVariables.tempList
        .map((e) => e.idPrivilegeUser == privilegeModel.idPrivilegeUser
            ? e.copyWith(isCheck: !e.isCheck!)
            : e)
        .toList();

    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }

  bool checkPrivilege(String? privilegeId) {
    if (privilegeId?.isEmpty ?? true) return true;

    int start = 0, end = pageVariables.userPrivileges.length - 1, mid = 0;
    String midPrivilegeId = "";

    while (start <= end) {
      mid = start + ((end - start) ~/ 2);
      midPrivilegeId = pageVariables.userPrivileges[mid].fkPrivilege!;

      if (midPrivilegeId == privilegeId) {
        return pageVariables.userPrivileges[mid].isCheck!;
      }

      if (int.parse(midPrivilegeId) > int.parse(privilegeId!)) {
        end = mid - 1;
      } else {
        start = mid + 1;
      }
    }

    return false;
  }

  List<String> getAllPrivileges() {
    final userPrivileges = <String>[];

    for (final privilege in pageVariables.userPrivileges) {
      if (checkPrivilege(privilege.fkPrivilege)) {
        userPrivileges.add(privilege.fkPrivilege!);
      }
    }

    print('userPrivileges: $userPrivileges');
    return userPrivileges;
  }
}
