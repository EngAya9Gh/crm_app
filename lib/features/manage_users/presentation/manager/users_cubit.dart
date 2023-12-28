import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/usermodel.dart';
import '../../../task_management/data/models/user_region_department.dart';
import '../../../task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart';
import '../../domain/use_cases/action_user_usecase.dart';
import '../../domain/use_cases/get_allusers_usecase.dart';

part 'users_state.dart';

@injectable
class UsersCubit extends Cubit<UsersState> {
  UsersCubit(
    this._getAllUsersUsecase,
    this._actionUserUsecase,
    this._getUsersByDepartmentAndRegionUsecase,
  ) : super(UsersState());

  final GetAllUsersUsecase _getAllUsersUsecase;
  final ActionUserUsecase _actionUserUsecase;
  final GetUsersByDepartmentAndRegionUsecase _getUsersByDepartmentAndRegionUsecase;

  void getAllUsers() async {
    emit(state.copyWith(allUsersList: const PageState.loading()));
    final allUsers = await _getAllUsersUsecase();

    allUsers.fold(
      (exception, message) => emit(state.copyWith(allUsersList: const PageState.error())),
      (value) => emit(
        state.copyWith(
          allUsersList: PageState.loaded(data: value.message ?? []),
          allUsers: value.message,
        ),
      ),
    );
  }

  storeCurrentUser(UserModel userModel) {
    emit(state.copyWith(currentUser: userModel));
  }

  onSearch(String query) {
    emit(state.copyWith(allUsersList: PageState.loaded(data: filterList(query))));
  }

  List<UserModel> filterList(String query) {
    List<UserModel> list = List<UserModel>.from(state.allUsers);
    list = list.where((element) => (element.nameUser?.toLowerCase().contains(query) ?? false)).toList();
    return list;
  }

  actionUser({
    UserModel? updateUser,
    required ActionUserParams addUserParams,
    required List<UserRegion> mainCityList,
    required ValueChanged<String?> onSuccess,
  }) async {
    emit(state.copyWith(actionUserState: BlocStatus.loading()));

    final response = await _actionUserUsecase(addUserParams);

    response.fold(
      (exception, message) => emit(state.copyWith(actionUserState: BlocStatus.fail(error: message))),
      (value) {
        final user = value.message!;

        if (user.idUser == '0') {
          onSuccess.call("repeat");
          return;
        }

        user.maincitylist_user = mainCityList;
        List<UserModel> users = state.allUsers;

        if (updateUser != null) {
          users = users.map((e) => e.idUser == user.idUser ? user : e).toList();
        } else {
          users.insert(0, user);
        }

        final usersState = PageState.loaded(data: users);
        emit(
          state.copyWith(
            actionUserState: BlocStatus.success(),
            allUsersList: usersState,
            allUsers: users,
            currentUser: updateUser != null ? user : null,
          ),
        );

        onSuccess.call(null);
      },
    );
  }

  getUsersByDepartmentAndRegion({required String? regionId, required String? departmentId}) async {
    emit(state.copyWith(usersByDepartmentAndRegion: const PageState.loading()));

    final result = await _getUsersByDepartmentAndRegionUsecase(GetUsersByDepartmentAndRegionParams(
      departmentId: departmentId,
      regionId: regionId,
    ));

    result.fold(
      (exception, message) => emit(state.copyWith(usersByDepartmentAndRegion: const PageState.error())),
      (value) => emit(state.copyWith(usersByDepartmentAndRegion: PageState.loaded(data: value.data ?? []))),
    );
  }
}
