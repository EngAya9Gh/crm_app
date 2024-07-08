import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../model/regoin_model.dart';
import '../../../public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import '../../../public_relations/participates/domain/use_cases/get_participate_list_usecase.dart';
import '../../domain/use_cases/get_invoices_by_privileges_usecase.dart';

part 'invoices_section_state.dart';

@injectable
class InvoicesSectionCubit extends Cubit<InvoicesSectionState> {
  final GetInvoicesByPrivilegesUsecase _getInvoicesByPrivilegesUsecase;
  final GetAgentsAndDistributorsUseCase _getAgentsAndDistributorsUseCase;
  final ParticipateListUsecase _participateListUsecase;

  InvoicesSectionCubit(
    this._getInvoicesByPrivilegesUsecase,
    this._getAgentsAndDistributorsUseCase,
    this._participateListUsecase,
  ) : super(InvoicesSectionState());

  GetInvoicesByPrivilegesParams getInvoicesParams =
      GetInvoicesByPrivilegesParams();
  final TextEditingController searchController = TextEditingController();

  ValueNotifier<SellerTypeEnum?> filterInvoicesSellerType = ValueNotifier(null);
  ValueNotifier<UserEntity?> filterSelectedUser = ValueNotifier(null);
  ValueNotifier<RegionModel?> filterSelectedRegion = ValueNotifier(null);
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();
  ValueNotifier<ClientStatusEnum?> filterClientStatus = ValueNotifier(null);
  ValueNotifier<DevicesStateFilterEnum?> filterDeviceState =
      ValueNotifier<DevicesStateFilterEnum?>(null);
  bool isNewFilter = true;

  final List<InvoiceModel> invoicesList = [];

  bool hasReachedEnd = false;
  int totalNumberOfInvoices = 0;

  void clearFilters() {
    invoicesList.clear();
    totalNumberOfInvoices = 0;
    hasReachedEnd = false;
    getInvoicesParams = GetInvoicesByPrivilegesParams();
    searchController.clear();
    filterInvoicesSellerType.value = null;
    filterSelectedUser.value = null;
    filterSelectedRegion.value = null;
    dateFromController.clear();
    dateToController.clear();
    filterClientStatus.value = null;
    filterDeviceState.value = null;
  }

  Future<void> getInvoicesByPrivileges({
    bool isNewFilter = true,
  }) async {
    if (state.getInvoicesStatus == StateStatus.loading) return;
    this.isNewFilter = isNewFilter;
    if (isNewFilter) {
      invoicesList.clear();
      hasReachedEnd = false;
    }
    if (hasReachedEnd) return;
    emit(state.copyWith(getInvoicesStatus: StateStatus.loading));

    final result = await _getInvoicesByPrivilegesUsecase(_getInvoicesParams());
    result.fold((l) {
      emit(state.copyWith(
        getInvoicesStatus: StateStatus.failure,
        getInvoicesMessage: l,
      ));
    }, (r) {
      totalNumberOfInvoices = r.$2;
      final List<InvoiceModel> invoices = r.$1;
      if (invoices.isEmpty) {
        hasReachedEnd = true;
      }
      invoicesList.addAll(invoices);
      emit(state.copyWith(
        getInvoicesStatus: StateStatus.success,
      ));
    });
  }

  GetInvoicesByPrivilegesParams _getInvoicesParams() {
    getInvoicesParams = getInvoicesParams.copyWith(
      skip: invoicesList.length,
      searchQuery: searchController.text,
      typeSeller: filterInvoicesSellerType.value,
      participateFk: _prepareUserId(SellerTypeEnum.collaborator),
      fkAgent: _prepareUserId(SellerTypeEnum.agent),
      fkIdUser: _prepareUserId(SellerTypeEnum.employee),
      fkRegionInvoice: filterSelectedRegion.value?.regionId,
      from: dateFromController.text,
      to: dateToController.text,
      typeReadyClient: filterClientStatus.value?.toParam,
      hasDevices: filterDeviceState.value?.toParam,
    );
    return getInvoicesParams;
  }

  String? _prepareUserId(SellerTypeEnum sellerType) {
    if (sellerType == filterInvoicesSellerType.value) {
      return filterSelectedUser.value?.id;
    }
    if (sellerType.isAgent() &&
        (filterInvoicesSellerType.value?.isDistributor() ?? false)) {
      return filterSelectedUser.value?.id;
    }

    return '';
  }

  Future<void> getUsers() async {
    filterSelectedUser.value = null;
    state.copyWith(getUsersState: const BlocStatus.initial());
    if (filterInvoicesSellerType.value!.isAgentOrDistributor()) {
      await _getAgentsAndDistributors();
    } else if (filterInvoicesSellerType.value!.isParticipate()) {
      await _getParticipateList();
    }
    return null;
  }

  Future<void> _getAgentsAndDistributors() async {
    emit(state.copyWith(getUsersState: const BlocStatus.loading()));

    final response = await _getAgentsAndDistributorsUseCase(
      GetAgentsAndDistributorsParams(),
    );

    response.fold(
      (exception) {
        emit(state.copyWith(getUsersState: BlocStatus.fail(error: exception)));
      },
      (value) {
        emit(state.copyWith(
          getUsersState: BlocStatus.success(data: value),
        ));
      },
    );
  }

  Future<void> _getParticipateList() async {
    emit(state.copyWith(getUsersState: BlocStatus.loading()));

    final response = await _participateListUsecase(GetParticipateListParams());

    response.extract(
      (exception, message) {
        emit(state.copyWith(
            getUsersState: BlocStatus.fail(error: exception.message)));
      },
      (value) {
        emit(state.copyWith(
          getUsersState: BlocStatus.success(data: value.message),
        ));
      },
    );
  }
}
