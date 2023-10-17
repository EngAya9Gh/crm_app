import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../common/models/page_state/bloc_status.dart';
import '../../../../../../features/manage_users/domain/use_cases/get_allusers_usecase.dart';
import '../../../../../../model/usermodel.dart';
import '../../data/models/invoice_withdrawal_series_model.dart';
import '../../data/models/user_series.dart';
import '../../domain/use_cases/get_user_series_usecase.dart';
import '../../domain/use_cases/get_withdrawal_invoice_details_usecase.dart';
import '../../domain/use_cases/update_user_series_usecase.dart';

part 'manage_withdrawals_state.dart';

@lazySingleton
class ManageWithdrawalsCubit extends Cubit<ManageWithdrawalsState> {
  ManageWithdrawalsCubit(
    this._getUserSeriesUsecase,
    this._updateSeriesUsecase,
    this._getAllUsersUsecase,
    this._getWithdrawalsInvoicesUsecase,
    this._getWithdrawalInvoiceDetailsUsecase,
  ) : super(ManageWithdrawalsState());
  final GetUserSeriesUsecase _getUserSeriesUsecase;
  final UpdateSeriesUsecase _updateSeriesUsecase;
  final GetAllUsersUsecase _getAllUsersUsecase;
  final GetWithdrawalsInvoicesUsecase _getWithdrawalsInvoicesUsecase;
  final GetWithdrawalInvoiceDetailsUsecase _getWithdrawalInvoiceDetailsUsecase;

  getUsersSeries(final String fkCountry) async {
    emit(state.copyWith(allUsersSeries: PageState.loading()));

    if (state.allUsers.isNotEmpty) {
      await _getUsers(fkCountry);
      return;
    }

    final response = await _getAllUsersUsecase();

    await response.fold(
      (exception, message) async => emit(state.copyWith(allUsersSeries: PageState.error())),
      (users) async {
        emit(state.copyWith(allUsers: users.message));
        await _getUsers(fkCountry);
      },
    );
  }

  _getUsers(fkCountry) async {
    final responseManage = await _getUserSeriesUsecase(GetUserSeriesParams(fkCountry));

    responseManage.fold(
      (exception, message) => emit(state.copyWith(allUsersSeries: PageState.error())),
      (usersSeries) {
        final maps = <UserWithdrawalsManager?, List<UserWithdrawalsManager>>{};
        usersSeries.message!.forEachIndexed((index, userSeries) {
          final user = state.allUsers.firstWhere((element) => element.idUser == userSeries.fkUser);
          final userWithdrawalsManager = UserWithdrawalsManager(user.idUser, user.nameUser);
          final list = usersSeries.message?.getRange(0, index).toList() ?? [];

          maps[userWithdrawalsManager] = List.of(state.allUsers)
              .where((elementUser) => !list.any((elementFilterList) => elementFilterList.fkUser == elementUser.idUser))
              .map((e) => UserWithdrawalsManager(e.idUser, e.nameUser))
              .toList();
        });

        emit(
          state.copyWith(
            allUsersSeries: PageState.loaded(data: usersSeries.message ?? []),
            allUsers: state.allUsers,
            handleUsersSeries: maps,
          ),
        );
      },
    );
  }

  updateUsersSeries(final String fkCountry, VoidCallback onSuccess) async {
    emit(state.copyWith(updateUsersSeriesState: BlocStatus.loading()));

    final ids = state.handleUsersSeries.keys.where((element) => element != null).map((e) => e!.idUser!).toList();

    final response = await _updateSeriesUsecase(UpdateSeriesParams(fkCountry, ids));

    response.fold(
      (exception, message) => emit(state.copyWith(updateUsersSeriesState: BlocStatus.fail(error: message))),
      (users) {
        emit(state.copyWith(updateUsersSeriesState: BlocStatus.success()));
      },
    );
  }

  onAddWithdrawalsManager(VoidCallback onWarning) {
    final maps = Map.of(state.handleUsersSeries);

    if (maps.containsKey(null)) {
      onWarning();
      return;
    }
    final list = maps.keys.toList();
    maps[null] = List.of(state.allUsers)
        .where((elementUser) => !list.any((elementFilterList) => elementFilterList?.idUser == elementUser.idUser))
        .map((e) => UserWithdrawalsManager(e.idUser, e.nameUser))
        .toList();

    emit(state.copyWith(handleUsersSeries: maps));
  }

  onChangeWithdrawalsManager(
      UserWithdrawalsManager selectedUserWithdrawalsManager, UserWithdrawalsManager? oldSelectedUserKey) {
    Map<UserWithdrawalsManager?, List<UserWithdrawalsManager>> maps = Map.of(state.handleUsersSeries);

    maps = maps.map(
      (key, value) {
        // final index = maps.keys.toList().indexOf(key);

        if (key == oldSelectedUserKey) {
          final list = maps.keys.toList().where((element) => element != key);

          final newValue = List.of(state.allUsers)
              .where((elementUser) => !list.any((elementFilterList) => elementFilterList?.idUser == elementUser.idUser))
              .map((e) => UserWithdrawalsManager(e.idUser, e.nameUser))
              .toList();

          return MapEntry(selectedUserWithdrawalsManager, newValue);
        } else {
          final list = maps.keys.toList().where((element) => element != key && element != oldSelectedUserKey);

          final newValue = List.of(state.allUsers)
              .where((elementUser) =>
                  !(list.any((elementFilterList) => elementFilterList?.idUser == elementUser.idUser) ||
                      elementUser.idUser == selectedUserWithdrawalsManager.idUser))
              .map((e) => UserWithdrawalsManager(e.idUser, e.nameUser))
              .toList();

          return MapEntry(key, newValue);
        }
      },
    );

    emit(state.copyWith(handleUsersSeries: maps));
  }

  onRemoveWithdrawalsManager(UserWithdrawalsManager? removedKey) {
    Map<UserWithdrawalsManager?, List<UserWithdrawalsManager>> maps = Map.of(state.handleUsersSeries);
    maps.remove(removedKey);
    maps = maps.map((key, value) {
      if (removedKey == null) {
        return MapEntry(key, value);
      }

      final newValue = value;
      newValue.add(removedKey);
      final list = state.allUsers
          .where((element) => newValue.any((e) => element.idUser == e.idUser))
          .map((e) => e.asUserWithdrawalsManager)
          .toList();

      return MapEntry(key, list);
    });

    emit(state.copyWith(handleUsersSeries: maps));
  }

  getWithdrawalsInvoices() async {
    emit(state.copyWith(withdrawalsInvoice: PageState.loading()));

    final response = await _getWithdrawalsInvoicesUsecase();

    response.fold(
      (exception, message) => emit(state.copyWith(withdrawalsInvoice: PageState.error())),
      (withdrawalsInvoice) {
        emit(state.copyWith(withdrawalsInvoice: PageState.loaded(data: withdrawalsInvoice.data ?? [])));
      },
    );
  }

  getWithdrawalInvoiceDetails(String fkInvoice) async {
    emit(state.copyWith(withdrawalInvoiceDetails: PageState.loading()));

    final response = await _getWithdrawalInvoiceDetailsUsecase(GetWithdrawalInvoiceDetailsParams(fkInvoice));

    response.fold(
      (exception, message) => emit(state.copyWith(withdrawalInvoiceDetails: PageState.error())),
      (withdrawalInvoiceDetails) {
        emit(state.copyWith(withdrawalInvoiceDetails: PageState.loaded(data: withdrawalInvoiceDetails.message ?? [])));
      },
    );
  }

  @override
  Future<void> close() {
    GetIt.I.resetLazySingleton<ManageWithdrawalsCubit>();
    return super.close();
  }
}
