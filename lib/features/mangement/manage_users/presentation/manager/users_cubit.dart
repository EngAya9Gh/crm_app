import 'package:bloc/bloc.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../../data/models/branch_model.dart';
import '../../domain/entities/users_page_variables_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../model/usermodel.dart';
import '../../../../task_management/data/models/user_region_department.dart';
import '../../../../task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart';
import '../../domain/entities/filter_users_entity.dart';
import '../../domain/entities/user_actions_entity.dart';
import '../../domain/use_cases/action_user_usecase.dart';
import '../../domain/use_cases/get_branches_for_user_usecase.dart';
import '../../domain/use_cases/get_levels_for_user_usecase.dart';
import '../../domain/use_cases/get_manages_for_user_usecase.dart';
import '../../domain/use_cases/get_users_usecase.dart';

part 'users_state.dart';

@injectable
class UsersCubit extends Cubit<UsersState> {
  final GetUsersUsecase _getAllUsersUsecase;
  final ActionUserUsecase _actionUserUsecase;
  final GetUsersByDepartmentAndRegionUsecase
      _getUsersByDepartmentAndRegionUsecase;
  final GetManagesForUserUsecase _getManagesForUserUsecase;
  final GetLevelsForUserUsecase _getLevelsForUserUsecase;
  final GetBranchesForUserUsecase _getBranchesForUserUsecase;

  UsersCubit(
    this._getAllUsersUsecase,
    this._actionUserUsecase,
    this._getUsersByDepartmentAndRegionUsecase,
    this._getManagesForUserUsecase,
    this._getLevelsForUserUsecase,
    this._getBranchesForUserUsecase,
  ) : super(UsersState());

  FilterUsersEntity filterUsersEntity = FilterUsersEntity();
  UsersPageVariablesEntity pageVariables = UsersPageVariablesEntity();
  UserActionsEntity userActionsEntity = UserActionsEntity();

  init() {
    _clear();
    _prepareData();
  }

  void _clear() {
    filterUsersEntity = FilterUsersEntity();
    pageVariables = UsersPageVariablesEntity();
    userActionsEntity = UserActionsEntity();
  }

  void _prepareData() {
    getUsers(isNewFilter: true);
    getManagesForUser();
    getLevelsForUser();
    getBranchesForUser();
  }

  void getUsers({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getUsersStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.usersList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;
        emit(state.copyWith(getUsersStatus: const BlocStatus.loading()));
        filterUsersEntity.savePreviousState();
        final allUsers = await _getAllUsersUsecase(
          GetUsersParams(
            skip: pageVariables.usersList.length,
            filter: pageVariables.searchController.text,
            isActive: filterUsersEntity.isActiveNotifier.value,
            branch: filterUsersEntity.branchNotifier.value,
            management: filterUsersEntity.manageNotifier.value,
            level: filterUsersEntity.levelNotifier.value,
            privileges: filterUsersEntity.privilegesNotifier.value,
          ),
        );

        allUsers.extract(
          (exception, message) {
            emit(state.copyWith(
                getUsersStatus: BlocStatus.fail(error: message)));
          },
          (value) {
            pageVariables.usersList.addAll(value.message!);
            pageVariables.totalUsersCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.message!.isEmpty;
            emit(
              state.copyWith(getUsersStatus: BlocStatus.success()),
            );
          },
        );
      },
      tag: 'search_manage_users',
      duration: Duration(milliseconds: isDebounced ? 500 : 0),
    );
  }

  storeCurrentUser(UserModel userModel) {
    emit(state.copyWith(currentUser: userModel));
  }

  actionUser({
    UserModel? updateUser,
    required ActionUserParams addUserParams,
    required List<UserRegion> mainCityList,
    required ValueChanged<String?> onSuccess,
    ValueChanged<String?>? onFail,
  }) async {
    emit(state.copyWith(actionUserState: BlocStatus.loading()));

    final response = await _actionUserUsecase(addUserParams);

    response.extract(
      (exception, message) {
        emit(state.copyWith(actionUserState: BlocStatus.fail(error: message)));
        onFail?.call(message);
      },
      (value) {
        final user = value.message!;

        if (user.idUser == '0') {
          onSuccess.call("repeat");
          return;
        }

        user.maincitylist_user = mainCityList;
        List<UserModel> users = pageVariables.usersList;

        if (updateUser != null) {
          users = users.map((e) => e.idUser == user.idUser ? user : e).toList();
        } else {
          users.insert(0, user);
        }

        emit(
          state.copyWith(
            actionUserState: BlocStatus.success(),
            currentUser: updateUser != null ? user : null,
          ),
        );

        onSuccess.call(null);
      },
    );
  }

  getUsersByDepartmentAndRegion(
      {required String? regionId, required String? departmentId}) async {
    emit(state.copyWith(usersByDepartmentAndRegion: const PageState.loading()));

    final result = await _getUsersByDepartmentAndRegionUsecase(
        GetUsersByDepartmentAndRegionParams(
      departmentId: departmentId,
      regionId: regionId,
    ));

    result.extract(
      (exception, message) => emit(
          state.copyWith(usersByDepartmentAndRegion: const PageState.error())),
      (value) => emit(state.copyWith(
          usersByDepartmentAndRegion:
              PageState.loaded(data: value.data ?? []))),
    );
  }

  void returnToPreviousState() {
    filterUsersEntity = filterUsersEntity.returnToPreviousState;
  }

  void getManagesForUser() async {
    emit(state.copyWith(managesStatus: const BlocStatus.loading()));

    final result = await _getManagesForUserUsecase(GetManagesForUserParams());

    result.fold(
      (l) => emit(state.copyWith(managesStatus: BlocStatus.fail(error: l))),
      (r) => emit(state.copyWith(managesStatus: BlocStatus.success(data: r))),
    );
  }

  void getLevelsForUser() async {
    emit(state.copyWith(levelsStatus: const BlocStatus.loading()));

    final result = await _getLevelsForUserUsecase(GetLevelsForUserParams());

    result.fold(
      (l) => emit(state.copyWith(levelsStatus: BlocStatus.fail(error: l))),
      (r) => emit(state.copyWith(levelsStatus: BlocStatus.success(data: r))),
    );
  }

  void getBranchesForUser() async {
    emit(state.copyWith(branchesStatus: const BlocStatus.loading()));

    final result = await _getBranchesForUserUsecase(GetBranchesForUserParams());

    result.fold(
      (l) => emit(state.copyWith(branchesStatus: BlocStatus.fail(error: l))),
      (r) => emit(state.copyWith(branchesStatus: BlocStatus.success(data: r))),
    );
  }
}
