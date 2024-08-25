import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/nullable.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/usermodel.dart';
import '../../data/models/level_model.dart';
import '../../data/models/privilege_model.dart';
import '../../domain/entities/filter_privileges_entity.dart';
import '../../domain/entities/privileges_page_variables_entity.dart';
import '../../domain/use_cases/add_level_usecase.dart';
import '../../domain/use_cases/get_levels_usecase.dart';
import '../../domain/use_cases/get_privilege_usecase.dart';
import '../../domain/use_cases/update_privilege_usecase.dart';

part 'privilege_state.dart';

@lazySingleton
class PrivilegeCubit extends Cubit<PrivilegeState> {
  final GetLevelsUsecase _getLevelsUsecase;
  final GetPrivilegesUsecase _getPrivilegesUsecase;
  final UpdatePrivilegeUsecase _updatePrivilegeUsecase;
  final AddLevelUsecase _addLevelUsecase;

  PrivilegeCubit(
    this._getLevelsUsecase,
    this._getPrivilegesUsecase,
    this._updatePrivilegeUsecase,
    this._addLevelUsecase,
  ) : super(PrivilegeState());

  PrivilegesPageVariablesEntity pageVariables = PrivilegesPageVariablesEntity();
  FilterPrivilegesEntity filterEntity = FilterPrivilegesEntity();

  void init() {
    pageVariables = PrivilegesPageVariablesEntity();
    filterEntity = FilterPrivilegesEntity();
  }

  Future<void> getPrivilegesByLevel(
    String idLevel, {
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        // if (state.getPrivileges.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getPrivileges: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getPrivilegesUsecase(GetPrivilegesParams(
          levelId: idLevel,
        ));
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(getPrivileges: BlocStatus.fail(error: e)));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            if (pageVariables.allList.isEmpty) {
              emit(state.copyWith(getPrivileges: BlocStatus.empty()));
              return;
            }
            emit(state.copyWith(getPrivileges: BlocStatus.success()));
          },
        );
      },
      tag: 'search_clients_accept',
      isDebounced: isDebounced,
    );
  }

  getLevels(UserModel user, {bool isRefresh = false}) async {
    if (!isRefresh && state.levelsStatus.getDataWhenSuccess != null) {
      _processLevels(state.levelsStatus.data, user);
      return;
    }

    if (!isRefresh) {
      emit(state.copyWith(levelsState: const PageState.loading()));
    }

    final result = await _getLevelsUsecase();

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(levelsState: const PageState.error()));
      },
      (value) => _processLevels(value.message ?? [], user),
    );
  }

  void _processLevels(List<LevelModel> levels, UserModel user) {
    final list = _filterPriorityLevels(levels, user.priority!);
    if (list.indexWhere((element) => element.idLevel == user.typeLevel) == -1) {
      list.add(LevelModel(
          idLevel: user.typeLevel,
          nameLevel: user.name_level,
          periorty: user.priority));
    }

    emit(state.copyWith(
        levelsState: PageState.loaded(data: levels), priorityState: list));
  }

  addLevel(String level, VoidCallback onSuccess) async {
    emit(state.copyWith(addLevelStatus: BlocStatus.loading()));

    final result = await _addLevelUsecase(AddLevelParams(level));

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(addLevelStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        onSuccess();
        emit(state.copyWith(
          addLevelStatus: BlocStatus.success(),
          levelsState: PageState.loaded(
              data: (state.levelsStatus.getDataWhenSuccess ?? [])
                ..insert(
                    0, LevelModel(nameLevel: level, idLevel: value.message))),
        ));
      },
    );
  }

  setUserPrivileges({required List<PrivilegeModel> privilegeList}) {
    emit(state.copyWith(
      userPrivilegesState: PageState.loaded(data: privilegeList),
    ));
  }

  changePrivilege({
    required PrivilegeModel privilegeModel,
  }) {
    if (state.updatePrivilegeStatus.isLoading()) {
      return;
    }

    emit(state.copyWith(
      tempPrivileges: PageState.loaded(
        data: state.tempPrivileges.data
            .map((e) => e.idPrivilegeUser == privilegeModel.idPrivilegeUser
                ? e.copyWith(isCheck: !e.isCheck!)
                : e)
            .toList(),
      ),
    ));
  }

  updatePrivilege() async {
    final difference = state.tempPrivileges.data
        .toSet()
        .difference(state.getPrivileges.data.toSet())
        .toList();

    emit(state.copyWith(updatePrivilegeStatus: const BlocStatus.loading()));

    final result = await _updatePrivilegeUsecase(UpdatePrivilegeParams(
      isCheckList: difference.map((e) => e.isCheck! ? 1 : 0).toList(),
      privilegeUserIdList:
          difference.map((e) => int.parse(e.idPrivilegeUser!)).toList(),
    ));

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(
            updatePrivilegeStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(
          updatePrivilegeStatus: const BlocStatus.success(),
          userPrivilegesState: PageState.loaded(
              data: state.userPrivilegesState.data.map((e) {
            final privilege = difference.firstWhereOrNull(
                (element) => element.idPrivilegeUser == e.idPrivilegeUser);
            if (privilege != null) {
              return e.copyWith(isCheck: privilege.isCheck);
            } else {
              return e;
            }
          }).toList()),
        ));
      },
    );
  }

  bool checkPrivilege(String? privilegeId) {
    if (privilegeId?.isEmpty ?? true) return true;

    int start = 0, end = state.userPrivilegesState.data.length - 1, mid = 0;
    String midPrivilegeId = "";

    while (start <= end) {
      mid = start + ((end - start) ~/ 2);
      midPrivilegeId = state.userPrivilegesState.data[mid].fkPrivilege!;

      if (midPrivilegeId == privilegeId) {
        return state.userPrivilegesState.data[mid].isCheck!;
      }

      if (int.parse(midPrivilegeId) > int.parse(privilegeId!)) {
        end = mid - 1;
      } else {
        start = mid + 1;
      }
    }

    return false;
  }

  List<LevelModel> _filterPriorityLevels(
      List<LevelModel> levels, final String priority) {
    if (priority == '0') {
      return levels;
    }
    final isPrev = checkPrivilege("180");

    if (isPrev)
      return levels
          .where((element) =>
              int.parse(element.periorty ?? '1') >= int.parse(priority))
          .toList();
    else
      return levels
          .where((element) =>
              int.parse(element.periorty ?? '1') > int.parse(priority))
          .toList();
  }

  onChangeLevelId(String? levelModel) {
    emit(state.copyWith(selectedLevelId: Nullable<String?>.value(levelModel)));
  }
}
