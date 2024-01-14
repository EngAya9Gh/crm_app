import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_privilege/domain/use_cases/add_level_usecase.dart';
import 'package:crm_smart/features/manage_privilege/domain/use_cases/get_levels_usecase.dart';
import 'package:crm_smart/features/manage_privilege/domain/use_cases/get_privilege_usecase.dart';
import 'package:crm_smart/features/manage_privilege/domain/use_cases/update_privilege_usecase.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../common/models/nullable.dart';
import '../../data/models/level_model.dart';
import '../../data/models/privilege_model.dart';

part 'privilege_state.dart';

@lazySingleton
class PrivilegeCubit extends Cubit<PrivilegeState> {
  PrivilegeCubit(
    this._getLevelsUsecase,
    this._getPrivilegesUsecase,
    this._updatePrivilegeUsecase,
    this._addLevelUsecase,
  ) : super(PrivilegeState());

  final GetLevelsUsecase _getLevelsUsecase;
  final GetPrivilegesUsecase _getPrivilegesUsecase;
  final UpdatePrivilegeUsecase _updatePrivilegeUsecase;
  final AddLevelUsecase _addLevelUsecase;

  getLevels(UserModel user, {bool isRefresh = false}) async {
    if (state.levelsState.getDataWhenSuccess != null && !isRefresh) {
      final list =
          _filterPriorityLevels(state.levelsState.data, user.periorty!);
      emit(state.copyWith(
          levelsState: PageState.loaded(data: state.levelsState.data),
          priorityState: list));
      return;
    }

    if (!isRefresh)
      emit(state.copyWith(levelsState: const PageState.loading()));

    final result = await _getLevelsUsecase();

    result.fold(
      (exception, message) =>
          emit(state.copyWith(levelsState: const PageState.error())),
      (value) {
        final list = _filterPriorityLevels(value.message ?? [], user.periorty!);

        emit(state.copyWith(
          levelsState:
              PageState.loaded(data: value.message ?? value.data ?? []),
          priorityState: list,
        ));
      },
    );
  }

  addLevel(String level, VoidCallback onSuccess) async {
    emit(state.copyWith(addLevelStatus: BlocStatus.loading()));

    final result = await _addLevelUsecase(AddLevelParams(level));

    result.fold(
      (exception, message) =>
          emit(state.copyWith(addLevelStatus: BlocStatus.fail(error: message))),
      (value) {
        onSuccess();
        emit(state.copyWith(
          addLevelStatus: BlocStatus.success(),
          levelsState: PageState.loaded(
              data: (state.levelsState.getDataWhenSuccess ?? [])
                ..insert(
                    0, LevelModel(nameLevel: level, idLevel: value.message))),
        ));
      },
    );
  }

  getPrivilegesLevel(final String levelId) async {
    emit(state.copyWith(
      privilegesOfLevel: const PageState.loading(),
      privilegesOfLevelTemp: const PageState.loading(),
    ));

    final result = await _getPrivilegesUsecase(GetPrivilegesParams(levelId));

    result.fold(
      (exception, message) => emit(state.copyWith(
        privilegesOfLevel: const PageState.error(),
        privilegesOfLevelTemp: const PageState.error(),
      )),
      (value) => emit(state.copyWith(
        privilegesOfLevel:
            PageState.loaded(data: value.message ?? value.data ?? []),
        privilegesOfLevelTemp:
            PageState.loaded(data: value.message ?? value.data ?? []),
      )),
    );
  }

  Future<bool> getUserPrivileges(final String levelId) async {
    emit(state.copyWith(userPrivilegesState: const PageState.loading()));

    final result = await _getPrivilegesUsecase(GetPrivilegesParams(levelId));
    // return Future.value(true);
    return result.fold(
      (exception, message) {
        emit(state.copyWith(userPrivilegesState: const PageState.error()));
        return false;
      },
      (value) {
        emit(state.copyWith(
            userPrivilegesState:
                PageState.loaded(data: value.message ?? value.data ?? [])));
        return true;
      },
    );
  }

  onChangePrivilege(PrivilegeModel privilegeModel) {
    if (state.updatePrivilegeStatus.isLoading()) {
      return;
    }

    emit(state.copyWith(
        privilegesOfLevelTemp: PageState.loaded(
      data: state.privilegesOfLevelTemp.data
          .map((e) => e.idPrivilegeUser == privilegeModel.idPrivilegeUser
              ? e.copyWith(isCheck: !e.isCheck!)
              : e)
          .toList(),
    )));
  }

  updatePrivilege(String userId) async {
    final difference = state.privilegesOfLevelTemp.data
        .toSet()
        .difference(state.privilegesOfLevel.data.toSet())
        .toList();

    emit(state.copyWith(updatePrivilegeStatus: const BlocStatus.loading()));

    final result = await _updatePrivilegeUsecase(UpdatePrivilegeParams(
      userId,
      isCheckList: difference.map((e) => e.isCheck! ? 1 : 0).toList(),
      privilegeUserIdList:
          difference.map((e) => int.parse(e.idPrivilegeUser!)).toList(),
    ));

    result.fold(
      (exception, message) => emit(state.copyWith(
          updatePrivilegeStatus: BlocStatus.fail(error: message))),
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

  bool checkPrivilege(String privilegeId) {
    final privilege = state.userPrivilegesState.data
        .firstWhereOrNull((element) => element.fkPrivilege == privilegeId);
    return privilege?.isCheck! ?? false;
    // return true;
  }

  List<LevelModel> _filterPriorityLevels(
      List<LevelModel> levels, final String priority) {
    if (priority == '0') {
      return levels;
    }
    return levels
        .where((element) =>
            int.parse(element.periorty ?? '1') > int.parse(priority))
        .toList();
  }

  onChangeLevelId(String? levelModel) {
    emit(state.copyWith(selectedLevelId: Nullable<String?>.value(levelModel)));
  }
}
