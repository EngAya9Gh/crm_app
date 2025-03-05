import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../model/usermodel.dart';
import '../../../../clients_care/violations_clienta_care/data/models/management_model.dart';
import '../../../../task_management/data/models/user_region_department.dart';
import '../../../../task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart';
import '../../../manage_privileges/levels/data/models/level_model.dart';
import '../../domain/entities/filter_users_entity.dart';
import '../../domain/entities/user_actions_entity.dart';
import '../../domain/entities/users_page_variables_entity.dart';
import '../../domain/use_cases/action_user_usecase.dart';
import '../../domain/use_cases/get_branches_for_user_usecase.dart';
import '../../domain/use_cases/get_levels_for_user_usecase.dart';
import '../../domain/use_cases/get_manages_for_user_usecase.dart';
import '../../domain/use_cases/get_user_by_id_usecase.dart';
import '../../domain/use_cases/get_user_select_task_management_usecase.dart';
import '../../domain/use_cases/get_users_all_usecase.dart';
import '../../domain/use_cases/get_users_usecase.dart';

part 'users_state.dart';

@injectable
class UsersCubit extends Cubit<UsersState> {
  final GetUsersUsecase _getAllUsersUsecase;
  final GetUserByIdUsecase _getUserByIdUsecase;
  final ActionUserUsecase _actionUserUsecase;
  final GetUsersByDepartmentAndRegionUsecase _getUsersByDepartmentAndRegionUsecase;
  final GetManagesForUserUsecase _getManagesForUserUsecase;
  final GetLevelsForUserUsecase _getLevelsForUserUsecase;
  final GetBranchesForUserUsecase _getBranchesForUserUsecase;
  final GetUserSelectUsecase _getUserSelectUsecase;
  final GetUsersAllUsecase _getUsersAllUsecase;

  UsersCubit(
    this._getAllUsersUsecase,
    this._getUserByIdUsecase,
    this._actionUserUsecase,
    this._getUsersByDepartmentAndRegionUsecase,
    this._getManagesForUserUsecase,
    this._getLevelsForUserUsecase,
    this._getBranchesForUserUsecase,
    this._getUserSelectUsecase,
    this._getUsersAllUsecase,
  ) : super(UsersState());

  FilterUsersEntity filterUsersEntity = FilterUsersEntity();
  UsersPageVariablesEntity pageVariables = UsersPageVariablesEntity();
  UserActionsEntity userActionsEntity = UserActionsEntity();

  Future<void> init() async {
    _clear();
    await _prepareData();
  }

  void _clear() {
    filterUsersEntity = FilterUsersEntity();
    pageVariables = UsersPageVariablesEntity();
    userActionsEntity = UserActionsEntity();
  }

  Future<void> _prepareData() async {
    await Future.wait([
      getUsers(isNewFilter: true),
      getManagesForUser(),
      getLevelsForUser(),
      getBranchesForUser(),
    ]);
  }

  void setSelectedManage(String? value) {
    userActionsEntity.selectedManage = state.managesStatus.data?.firstWhereOrNull((element) => element.idMange == value);
  }

  void setSelectedLevel(String? value) {
    userActionsEntity.selectedLevel = state.levelsStatus.data?.firstWhereOrNull((element) => element.idLevel == value);
  }

  void setSelectedBranch(String? value) {
    userActionsEntity.selectedBranch = state.branchesStatus.data?.firstWhereOrNull((element) => element.branchId == value);
  }

  Future<void> getUsers({
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
            if (AppConstants.shouldReturnEarly(message)) return;
            emit(state.copyWith(getUsersStatus: BlocStatus.fail(error: message)));
          },
          (value) {
            pageVariables.usersList.addAll(value.message!);
            pageVariables.totalUsersCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.message!.isEmpty;
            if (pageVariables.usersList.isEmpty) {
              emit(state.copyWith(getUsersStatus: BlocStatus.empty()));
              return;
            }
            emit(
              state.copyWith(getUsersStatus: BlocStatus.success()),
            );
          },
        );
      },
      tag: 'search_manage_users',
      isDebounced: isDebounced,
    );
  }

  Future<void> getUsersAll([String? type]) async {
    AppConstants.debounceFunction(
      () async {
        emit(state.copyWith(getUsersStatus: const BlocStatus.loading()));
        final allUsers = await _getUsersAllUsecase(GetUsersParams(type: type));

        allUsers.extract(
          (exception, message) {
            if (AppConstants.shouldReturnEarly(message)) return;
            emit(state.copyWith(getUsersStatus: BlocStatus.fail(error: message)));
          },
          (value) {
            pageVariables.usersAllList = value.message ?? [];
            pageVariables.totalUsersCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.message!.isEmpty;
            if (pageVariables.usersAllList.isEmpty) {
              emit(state.copyWith(getUsersStatus: BlocStatus.empty()));
              return;
            }
            emit(
              state.copyWith(getUsersStatus: BlocStatus.success()),
            );
          },
        );
      },
      tag: 'search_manage_users',
      isDebounced: false,
    );
  }

  void addNewUserState() {
    emit(
      state.copyWith(
        currentUser: null,
        getUserByIdStatus: const BlocStatus.success(),
      ),
    );
  }

  Future<void> getUserById(String id) async {
    emit(state.copyWith(getUserByIdStatus: const BlocStatus.loading()));

    final result = await _getUserByIdUsecase(GetUserByIdParams(id: id));

    result.fold(
      (l) {
        if (AppConstants.shouldReturnEarly(l)) return;
        emit(state.copyWith(getUserByIdStatus: BlocStatus.fail(error: l)));
      },
      (r) {
        emit(state.copyWith(
          getUserByIdStatus: BlocStatus.success(data: r.data),
          currentUser: r.data,
        ));
      },
    );
  }

  storeCurrentUser(UserModel userModel) {
    emit(state.copyWith(
      currentUser: userModel,
      getUserByIdStatus: BlocStatus.success(data: userModel),
    ));
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
        if (AppConstants.shouldReturnEarly(message)) return;
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
          users = users..insert(0, user);
          pageVariables.totalUsersCount = pageVariables.totalUsersCount + 1;
        }
        pageVariables.usersList = List.of(users);
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

  onGetUserSelected([String? type]) async {
    emit(state.copyWith(getUserSelected: const BlocStatus.loading()));
    final response = await _getUserSelectUsecase(GetUsersParams(type: type));

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(getUserSelected: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(getUserSelected: BlocStatus.success(data: value.message ?? [])));
      },
    );
  }

  getUsersByDepartmentAndRegion({required String? regionId, required String? departmentId}) async {
    emit(state.copyWith(usersByDepartmentAndRegion: const PageState.loading()));

    final result = await _getUsersByDepartmentAndRegionUsecase(GetUsersByDepartmentAndRegionParams(
      departmentId: departmentId,
      regionId: regionId,
    ));

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(usersByDepartmentAndRegion: const PageState.error()));
      },
      (value) => emit(state.copyWith(usersByDepartmentAndRegion: PageState.loaded(data: value.data ?? []))),
    );
  }

  void returnToPreviousState() {
    filterUsersEntity = filterUsersEntity.returnToPreviousState;
  }

  Future<void> getManagesForUser() async {
    emit(state.copyWith(managesStatus: const BlocStatus.loading()));

    final result = await _getManagesForUserUsecase(GetManagesForUserParams());

    result.fold(
      (l) {
        if (AppConstants.shouldReturnEarly(l)) return;
        emit(state.copyWith(managesStatus: BlocStatus.fail(error: l)));
      },
      (r) => emit(state.copyWith(managesStatus: BlocStatus.success(data: r))),
    );
  }

  Future<void> getLevelsForUser() async {
    emit(state.copyWith(levelsStatus: const BlocStatus.loading()));

    final result = await _getLevelsForUserUsecase(GetLevelsForUserParams());

    result.fold(
      (l) {
        if (AppConstants.shouldReturnEarly(l)) return;
        emit(state.copyWith(levelsStatus: BlocStatus.fail(error: l)));
      },
      (r) => emit(state.copyWith(levelsStatus: BlocStatus.success(data: r))),
    );
  }

  Future<void> getBranchesForUser() async {
    emit(state.copyWith(branchesStatus: const BlocStatus.loading()));

    final result = await _getBranchesForUserUsecase(GetBranchesForUserParams());

    result.fold(
      (l) {
        if (AppConstants.shouldReturnEarly(l)) return;
        emit(state.copyWith(branchesStatus: BlocStatus.fail(error: l)));
      },
      (r) => emit(state.copyWith(branchesStatus: BlocStatus.success(data: r))),
    );
  }
}
