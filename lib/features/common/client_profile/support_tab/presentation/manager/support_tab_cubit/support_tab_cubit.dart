import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/enums/participate_enum.dart';
import '../../../../../../../model/invoiceModel.dart';
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
  final GetDateInstallationUsecase _getDateInstallationUsecase;

  SupportTabCubit(
    this._getInvoiceByClientUsecase,
    this._addDateInstallUsecase,
    this._setDateDoneUsecase,
    this._setReadyInstallUsecase,
    this._getDateInstallationUsecase,
  ) : super(SupportTabState());

  List<InvoiceModel> clientInvoicesList = [];
  List<InvoiceModel> listinvoiceClientSupport = [];
  String? changedIdUser;

  List<EventModel> allEvents = [];
  List<MainCityModel> allMainCities = [];
  List<MainCityModel> _filterSelectedMainCity = [];
  String _filterIdUser = '';

  String? get filterIdUser => _filterIdUser;

  set filterIdUser(String? value) {
    _filterIdUser = value ?? '';
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  List<MainCityModel> get filterSelectedMainCity => _filterSelectedMainCity;

  set filterSelectedMainCity(List<MainCityModel> value) {
    _filterSelectedMainCity = value;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  void resetFilter(List<MainCityModel> cities) {
    allMainCities = List.from(cities);
    filterSelectedMainCity = List.from(cities);
    filterIdUser = null;

    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  Future<void> getDateInstallation(
    GetDateInstallationParams getDateInstallationParams, {
    Function(List<EventModel> listEvents)? onSuccess,
  }) async {
    emit(state.copyWith(getDateInstallationStatus: BlocStatus.loading()));

    getDateInstallationParams = getDateInstallationParams.copyWith(
      mainCityFks: filterSelectedMainCity.map((e) => e.id_maincity).toList(),
      fkUser: filterIdUser,
    );

    final result = await _getDateInstallationUsecase(getDateInstallationParams);
    result.fold((l) {
      emit(state.copyWith(
        getDateInstallationStatus: BlocStatus.fail(error: l),
      ));
    }, (r) {
      allEvents = r.map((e) => e.asEvent()).toList();
      onSuccess?.call(allEvents);
      emit(state.copyWith(
        getDateInstallationStatus: BlocStatus.success(data: r),
      ));
    });
  }

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
      clientInvoicesList = r;
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
