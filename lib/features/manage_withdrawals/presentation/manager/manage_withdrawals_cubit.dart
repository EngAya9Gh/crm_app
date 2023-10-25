import 'dart:ui';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/withdrawn_details_model.dart';
import 'package:crm_smart/features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/utils/withdrawal_status.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';

import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../common/models/page_state/bloc_status.dart';
import '../../../../../../features/manage_users/domain/use_cases/get_allusers_usecase.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../model/reasonmodel.dart';
import '../../../../services/Invoice_Service.dart';
import '../../../../api/api.dart';
import '../../../../constants.dart';
import '../../../../services/configService.dart';
import '../../data/models/invoice_withdrawal_series_model.dart';
import '../../data/models/user_series.dart';
import '../../domain/use_cases/get_user_series_usecase.dart';
import '../../domain/use_cases/get_withdrawal_invoice_details_usecase.dart';
import '../../domain/use_cases/get_withdrawn_details_usecase.dart';
import '../../domain/use_cases/set_approve_series_usecase.dart';
import '../../domain/use_cases/update_user_series_usecase.dart';

import 'package:open_file/open_file.dart';


part 'manage_withdrawals_state.dart';

@lazySingleton
class ManageWithdrawalsCubit extends Cubit<ManageWithdrawalsState> {
  ManageWithdrawalsCubit(
    this._getUserSeriesUsecase,
    this._updateSeriesUsecase,
    this._getAllUsersUsecase,
    this._getWithdrawalsInvoicesUsecase,
    this._getWithdrawalInvoiceDetailsUsecase,
    this._setApproveSeriesUsecase,
    this._getWithdrawnDetailsUsecase,
  ) : super(ManageWithdrawalsState());
  final GetUserSeriesUsecase _getUserSeriesUsecase;
  final UpdateSeriesUsecase _updateSeriesUsecase;
  final GetAllUsersUsecase _getAllUsersUsecase;
  final GetWithdrawalsInvoicesUsecase _getWithdrawalsInvoicesUsecase;
  final GetWithdrawalInvoiceDetailsUsecase _getWithdrawalInvoiceDetailsUsecase;
  final SetApproveSeriesUsecase _setApproveSeriesUsecase;
  final GetWithdrawnDetailsUsecase _getWithdrawnDetailsUsecase;
  List<ReasonModel> reasons = [];


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
    emit(state.copyWith(withdrawalsInvoices: PageState.loading()));

    final response = await _getWithdrawalsInvoicesUsecase();

    response.fold(
      (exception, message) => emit(state.copyWith(withdrawalsInvoices: PageState.error())),
      (withdrawalsInvoice) {
        emit(state.copyWith(withdrawalsInvoices: PageState.loaded(data: withdrawalsInvoice.data ?? [])));
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

  setApproveSeries(SetApproveSeriesParams seriesParams, VoidCallback onSuccess) async {
    emit(state.copyWith(setApproveSeriesState: BlocStatus.loading()));

    final response = await _setApproveSeriesUsecase(seriesParams);

    response.fold(
      (exception, message) => emit(state.copyWith(setApproveSeriesState: BlocStatus.fail(error: message))),
      (users) {
        List<InvoiceWithdrawalSeries> list = state.withdrawalInvoiceDetails.getDataWhenSuccess ?? [];
        list = list
            .map((e) =>
                e.fkUser == seriesParams.id_user ? e.copyWith(withdrawalStatus: seriesParams.withdrawalStatus) : e)
            .toList();

        List<InvoiceModel> listInvoice = state.withdrawalsInvoices.getDataWhenSuccess ?? [];
        listInvoice = listInvoice.map((e) {
          final isDeclined = list.any((element) => element.withdrawalStatus.isDeclined);
          final isApproveWithdrawn = list.every((element) => element.withdrawalStatus.isApproved);
          return e.idInvoice == seriesParams.invoiceId
              ? e.copyWith(
                  approveBackDone: isDeclined ? "2" : (isApproveWithdrawn ? "1" : "0"),
                  stateclient: isApproveWithdrawn ? "منسحب" : null,
                )
              : e;
        }).toList();
        emit(state.copyWith(
          setApproveSeriesState: BlocStatus.success(),
          withdrawalInvoiceDetails: PageState.loaded(data: list),
          withdrawalsInvoices: PageState.loaded(data: listInvoice),
        ));
        onSuccess.call();
      },
    );
  }

  getWithdrawnDetails(final String fkInvoice) async {
    emit(state.copyWith(withdrawnDetailsState: PageState.loading()));
    final response = await _getWithdrawnDetailsUsecase(GetWithdrawnDetailsParams(fkInvoice));

    await response.fold(
      (exception, message) async => emit(state.copyWith(withdrawnDetailsState: PageState.error())),
      (result) async {
        try {
          final data = result.message!;
          if (reasons.isEmpty) reasons = await config_service().getreason('client');

          final reason = reasons.firstWhereOrNull((element) => element.idReason == data.reasonBack);

          emit(state.copyWith(
              withdrawnDetailsState: PageState.loaded(data: data.copyWith(reasonBack: reason?.nameReason))));
        } catch (e) {
          emit(state.copyWith(withdrawnDetailsState: PageState.error()));
        }
      },
    );
  }

  void deleteWithdrawalRequest(final String invoiceId, final String filePath, {VoidCallback? onSuccess}) async {
    try {
      emit(state.copyWith(deleteWithdrawnRequestStatus: BlocStatus.loading()));

      InvoiceModel data = await Invoice_Service().deleteBack(invoiceId, filePath);

      List<InvoiceModel> listInvoice = state.withdrawalsInvoices.getDataWhenSuccess ?? [];
      listInvoice.removeWhere((element) => element.idInvoice == invoiceId);
      emit(state.copyWith(
        deleteWithdrawnRequestStatus: BlocStatus.success(),
        withdrawalsInvoices: PageState.loaded(data: listInvoice),
      ));

      onSuccess?.call();
    } catch (e) {
      emit(state.copyWith(deleteWithdrawnRequestStatus: BlocStatus.fail(error: e.toString())));
    }
  }

  @override
  Future<void> close() {
    GetIt.I.resetLazySingleton<ManageWithdrawalsCubit>();
    return super.close();
  }
}
