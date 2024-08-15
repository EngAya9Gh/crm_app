import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../domain/use_cases/get_users_usecase.dart';

part 'users_type_state.dart';

@injectable
class UsersTypeCubit extends Cubit<UsersTypeState> {
  final GetUsersUsecase _getUsersUsecase;

  UsersTypeCubit(
    this._getUsersUsecase,
  ) : super(UsersTypeState());

  Map<String, List<UserEntity>> usersMap = {};
  Map<String, UserEntity?> _selectedUser = {};

  UserEntity? selectedUser(UserType userType) {
    return _selectedUser[userType.name];
  }

  void setSelectedUser(UserEntity? user, UserType userType) {
    emit(state.copyWith(selectUserStatus: BlocStatus.loading()));
    _selectedUser[userType.name] = user;
    emit(state.copyWith(selectUserStatus: BlocStatus.success()));
  }

  Future<void> getUsersByType(
    UserType userType, {
    Function? onSuccess,
  }) async {
    emit(
      state.copyWith(
        getUsersStatus: BlocStatus.loading(),
        tag: userType.name,
      ),
    );

    final result = await _getUsersUsecase(
      GetUsersParams(user: userType),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          getUsersStatus: BlocStatus.fail(error: l),
          tag: userType.name,
        ),
      ),
      (r) {
        usersMap[userType.name] = r;
        emit(
          state.copyWith(
            getUsersStatus: BlocStatus.success(),
            tag: userType.name,
          ),
        );
      },
    );
    onSuccess?.call();
  }

  void loadCurrentUserById({required UserType userType, String? userId}) {
    if (userId == null) {
      return setSelectedUser(null, userType);
    }
    final user = usersMap[userType.name]?.firstWhere(
      (element) => element.id == userId,
    );
    setSelectedUser(user, userType);
  }
}
