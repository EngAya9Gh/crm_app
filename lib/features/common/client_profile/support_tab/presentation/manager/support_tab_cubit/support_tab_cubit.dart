import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../model/calendar/event_model.dart';
import '../../../../../../../model/invoiceModel.dart';
import '../../../domain/use_cases/add_date_install_usecase.dart';
import '../../../domain/use_cases/cancel_date_usecase.dart';
import '../../../domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../../domain/use_cases/receive_device_usecase.dart';
import '../../../domain/use_cases/returnToApprove.dart';
import '../../../domain/use_cases/set_date_done_usecase.dart';
import '../../../domain/use_cases/set_ready_install_usecase.dart';

part 'support_tab_state.dart';

@injectable
class SupportTabCubit extends Cubit<SupportTabState> {
  final GetInvoiceByClientUsecase _getInvoiceByClientUsecase;
  final AddDateInstallUsecase _addDateInstallUsecase;
  final SetDateDoneUsecase _setDateDoneUsecase;
  final SetReadyInstallUsecase _setReadyInstallUsecase;
  final ReturnInvoiceApproveUsecase _returnInvoiceApproveUsecase;
  final ReceiveDeviceUsecase _receiveDeviceUsecaseUsecase;
  final CancelDateInstallUsecase _cancelDateInstallUsecase;

  SupportTabCubit(
    this._getInvoiceByClientUsecase,
    this._addDateInstallUsecase,
    this._setDateDoneUsecase,
    this._setReadyInstallUsecase,
    this._returnInvoiceApproveUsecase,
    this._receiveDeviceUsecaseUsecase,
    this._cancelDateInstallUsecase,
  ) : super(SupportTabState());

  List<InvoiceModel> clientInvoicesList = [];
  List<InvoiceModel> listInvoiceClientSupport = [];
  String? changedIdUser;

  Future<void> getClientInvoice({
    required GetInvoiceByClientParams getInvoiceByClientParams,
    Function(List<InvoiceModel> list, bool isParticipate)? onSuccess,
  }) async {
    emit(state.copyWith(getInvoiceByClientStatus: BlocStatus.loading()));

    final isParticipate = getInvoiceByClientParams.subscribed ?? false;
    listInvoiceClientSupport = [];
    if (!isParticipate) {
      emit(state.copyWith(getInvoiceByClientStatus: BlocStatus.success()));
      return;
    }
    getInvoiceByClientParams.copyWith(subscribed: isParticipate);
    final result = await _getInvoiceByClientUsecase(getInvoiceByClientParams);
    result.fold((l) {
      if (AppConstants.shouldReturnEarly(l)) return;
      emit(state.copyWith(getInvoiceByClientStatus: BlocStatus.fail(error: l)));
    }, (r) {
      if (!isParticipate) {
        clientInvoicesList = r;
      } else {
        listInvoiceClientSupport = r;
      }
      onSuccess?.call(r, isParticipate);

      emit(state.copyWith(getInvoiceByClientStatus: BlocStatus.success()));
    });
  }

  Future<void> addDateInstall(
    AddDateInstallParams addDateInstallParams, {
    Function(EventModel)? onSuccess,
  }) async {
    emit(state.copyWith(addDateInstallStatus: BlocStatus.loading()));

    final result = await _addDateInstallUsecase(addDateInstallParams);

    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(addDateInstallStatus: BlocStatus.fail(error: e)));
    }, (r) {
      onSuccess?.call(r);
      emit(state.copyWith(addDateInstallStatus: BlocStatus.success()));
    });
  }

  Future<bool> setDateDone(
    SetDateDoneParams setDateDoneParams,
  ) async {
    emit(state.copyWith(setDateDoneStatus: StateStatus.loading));
    final result = await _setDateDoneUsecase(setDateDoneParams);
    return result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return false;
      emit(state.copyWith(
        setDateDoneStatus: StateStatus.failure,
        setDateDoneMessage: e,
      ));
      return false;
    }, (r) {
      _updateInvoicesList(setDateDoneParams.id_invoice, r);

      emit(state.copyWith(
        setDateDoneStatus: StateStatus.success,
      ));
      return true;
    });
  }

  Future<void> setReadyInstall(
    SetReadyInstallParams setReadyInstallParams,
  ) async {
    emit(state.copyWith(setReadyInstallStatus: StateStatus.loading));

    final result = await _setReadyInstallUsecase(setReadyInstallParams);
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.failure,
        setReadyInstallMessage: e,
      ));
    }, (r) {
      _updateInvoicesList(setReadyInstallParams.id_invoice, r);

      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.success,
      ));
    });
  }

  Future<void> returnToAppove(
    ReturnToApproveParams returnToApproveParams,
  ) async {
    emit(state.copyWith(setReadyInstallStatus: StateStatus.loading));

    final result = await _returnInvoiceApproveUsecase(returnToApproveParams);
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.failure,
        setReadyInstallMessage: e,
      ));
    }, (r) {
      _updateAfterReturn(returnToApproveParams.id_invoice, r);

      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.success,
      ));
    });
  }

  Future<void> receiveDevice(
    ReceiveDeviceParams receiveParams,
  ) async {
    emit(state.copyWith(setReadyInstallStatus: StateStatus.loading));

    final result = await _receiveDeviceUsecaseUsecase(receiveParams);
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.failure,
        setReadyInstallMessage: e,
      ));
    }, (r) {
      _updateInvoicesList(receiveParams.id_invoice, r);

      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.success,
      ));
    });
  }

  void _updateInvoicesList(String idInvoice, InvoiceModel r) {
    int index1 = listInvoiceClientSupport
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listInvoiceClientSupport[index1] = r;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  void _updateAfterReturn(String idInvoice, InvoiceModel r) {
    int index1 = listInvoiceClientSupport
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listInvoiceClientSupport.removeAt(index1);
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  Future<void> cancelDateInstall(
    CancelDateInstallParams cancelDateInstallParams,
  ) async {
    emit(state.copyWith(cancelDateInstallStatus: BlocStatus.loading()));

    final result = await _cancelDateInstallUsecase(cancelDateInstallParams);
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(cancelDateInstallStatus: BlocStatus.fail(error: e)));
    }, (r) {
      _updateInvoicesList(cancelDateInstallParams.idInvoice, r);

      emit(state.copyWith(cancelDateInstallStatus: BlocStatus.success()));
    });
  }
}
