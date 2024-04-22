import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/participate_enum.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../domain/use_cases/add_date_install_usecase.dart';
import '../../../domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../../domain/use_cases/set_date_done_usecase.dart';
import '../../../domain/use_cases/set_ready_install_usecase.dart';

part 'support_tab_state.dart';

@injectable
class SupportTabCubit extends Cubit<SupportTabState> {
  final GetInvoiceByClientUsecase _getInvoiceByClientUsecase;
  final AddDateInstallUsecase _addDateInstallUsecase;
  final SetDateDoneUsecase _setDateDoneUsecase;
  final SetReadyInstallUsecase _setReadyInstallUsecase;

  SupportTabCubit(
    this._getInvoiceByClientUsecase,
    this._addDateInstallUsecase,
    this._setDateDoneUsecase,
    this._setReadyInstallUsecase,
  ) : super(SupportTabState());

  List<InvoiceModel> listinvoiceClientSupport = [];
  List<InvoiceModel> listinvoices = [];

  /* Methods */

  Future<void> getClientInvoice({
    required GetInvoiceByClientParams getInvoiceByClientParams,
    required ParticipateEnum type,
  }) async {
    emit(state.copyWith(getInvoiceByClientStatus: StateStatus.loading));

    bool isParticipate = type == ParticipateEnum.participate;
    listinvoiceClientSupport = [];
    if (!isParticipate) {
      emit(state.copyWith(getInvoiceByClientStatus: StateStatus.success));
      return;
    }
    final result = await _getInvoiceByClientUsecase(getInvoiceByClientParams);
    result.fold((l) {
      emit(state.copyWith(
        getInvoiceByClientStatus: StateStatus.failure,
        getInvoiceByClientMessage: l,
      ));
    }, (r) {
      listinvoiceClientSupport = r.where((element) {
        return element.fkIdClient == getInvoiceByClientParams.idClient &&
            element.isApprove != null;
      }).toList();
      emit(state.copyWith(
        getInvoiceByClientStatus: StateStatus.success,
      ));
    });
  }

  Future<void> addDateInstall(AddDateInstallParams addDateInstallParams) async {
    emit(state.copyWith(addDateInstallStatus: StateStatus.loading));

    final result = await _addDateInstallUsecase(addDateInstallParams);

    result.fold((l) {
      emit(state.copyWith(
        addDateInstallStatus: StateStatus.failure,
        addDateInstallMessage: l,
      ));
    }, (r) {
      emit(state.copyWith(
        addDateInstallStatus: StateStatus.success,
      ));
    });
  }

  Future<bool> setDateDone(
    SetDateDoneParams setDateDoneParams,
  ) async {
    emit(state.copyWith(setDateDoneStatus: StateStatus.loading));
    final result = await _setDateDoneUsecase(setDateDoneParams);
    return result.fold((l) {
      emit(state.copyWith(
        setDateDoneStatus: StateStatus.failure,
        setDateDoneMessage: l,
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
    result.fold((l) {
      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.failure,
        setReadyInstallMessage: l,
      ));
    }, (r) {
      _updateInvoicesList(setReadyInstallParams.id_invoice, r);

      emit(state.copyWith(
        setReadyInstallStatus: StateStatus.success,
      ));
    });
  }

  void _updateInvoicesList(String idInvoice, InvoiceModel r) {
    int index1 = listinvoiceClientSupport
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listinvoiceClientSupport[index1] = r;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }
}
