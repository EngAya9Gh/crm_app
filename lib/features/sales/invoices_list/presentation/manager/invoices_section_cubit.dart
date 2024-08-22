import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../model/usermodel.dart';
import '../../../public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import '../../../public_relations/participates/domain/use_cases/get_participate_list_usecase.dart';
import '../../domain/entities/_invoices_section_filter_entity.dart';
import '../../domain/use_cases/get_all_users_usecase.dart';
import '../../domain/use_cases/get_invoices_by_privileges_usecase.dart';

part 'invoices_section_state.dart';

@injectable
class InvoicesSectionCubit extends Cubit<InvoicesSectionState> {
  final GetInvoicesByPrivilegesUsecase _getInvoicesByPrivilegesUsecase;
  final GetAgentsAndDistributorsUseCase _getAgentsAndDistributorsUseCase;
  final ParticipateListUsecase _participateListUsecase;
  final GetAllUsersUseCase _getAllUsersUseCase;

  InvoicesSectionCubit(
    this._getInvoicesByPrivilegesUsecase,
    this._getAgentsAndDistributorsUseCase,
    this._participateListUsecase,
    this._getAllUsersUseCase,
  ) : super(InvoicesSectionState());

  GetInvoicesByPrivilegesParams getInvoicesParams =
      GetInvoicesByPrivilegesParams();

  final TextEditingController searchController = TextEditingController();
  InvoicesSectionFilterEntity filtersEntity = InvoicesSectionFilterEntity();

  bool isNewFilter = true;

  final List<InvoiceModel> invoicesList = [];

  bool hasReachedEnd = false;
  int totalNumberOfInvoices = 0;

  void clearFilters() {
    invoicesList.clear();
    totalNumberOfInvoices = 0;
    hasReachedEnd = false;
    getInvoicesParams = GetInvoicesByPrivilegesParams();
    filtersEntity.clearFilters();
    searchController.clear();
  }

  void getPreviousState() {
    filtersEntity = filtersEntity.returnToPreviousState;
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
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        getInvoicesStatus: StateStatus.failure,
        getInvoicesMessage: e,
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
      typeSeller: filtersEntity.filterInvoicesSellerType.value,
      participateFk: _prepareUserId(SellerTypeEnum.collaborator),
      fkAgent: _prepareUserId(SellerTypeEnum.agent),
      fkIdUser: _prepareUserId(SellerTypeEnum.employee),
      fkRegionInvoice: filtersEntity.filterSelectedRegion.value?.regionId,
      from: filtersEntity.dateFromController.text,
      to: filtersEntity.dateToController.text,
      typeReadyClient: filtersEntity.filterClientStatus.value?.toParam,
      hasDevices: filtersEntity.filterDeviceState.value?.toParam,
    );
    return getInvoicesParams;
  }

  String? _prepareUserId(SellerTypeEnum sellerType) {
    if (sellerType == filtersEntity.filterInvoicesSellerType.value) {
      return filtersEntity.filterSelectedUser.value?.id;
    }
    if (sellerType.isAgent() &&
        (filtersEntity.filterInvoicesSellerType.value?.isDistributor() ??
            false)) {
      return filtersEntity.filterSelectedUser.value?.id;
    }

    return '';
  }

  Future<void> getUsers() async {
    filtersEntity.filterSelectedUser.value = null;
    state.copyWith(getUsersState: const BlocStatus.initial());
    if (filtersEntity.filterInvoicesSellerType.value!.isAgentOrDistributor()) {
      await _getAgentsAndDistributors();
    } else if (filtersEntity.filterInvoicesSellerType.value!.isParticipate()) {
      await _getParticipateList();
    } else if (filtersEntity.filterInvoicesSellerType.value!.isEmployee()) {
      await _getAllUsers();
    }
  }

  Future<void> _getAgentsAndDistributors() async {
    emit(state.copyWith(getUsersState: const BlocStatus.loading()));

    final result = await _getAgentsAndDistributorsUseCase(
      GetAgentsAndDistributorsParams(),
    );

    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(getUsersState: BlocStatus.fail(error: e)));
      },
      (value) {
        emit(state.copyWith(
          getUsersState: BlocStatus.success(
              data: value.where((element) {
            return element.typeAgent.toString() ==
                filtersEntity.filterInvoicesSellerType.value!.toParam;
          }).toList()),
        ));
      },
    );
  }

  Future<void> _getParticipateList() async {
    emit(state.copyWith(getUsersState: BlocStatus.loading()));

    final response = await _participateListUsecase(GetParticipateListParams());

    response.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
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

  Future<void> _getAllUsers() async {
    emit(state.copyWith(getUsersState: const BlocStatus.loading()));

    final result = await _getAllUsersUseCase(GetAllUsersParams());

    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(getUsersState: BlocStatus.fail(error: e)));
      },
      (value) {
        emit(state.copyWith(
          getUsersState: BlocStatus.success(data: _filterEmployees(value)),
        ));
      },
    );
  }

  List<UserModel> _filterEmployees(List<UserModel> value) {
    return value
        .where((element) =>
            element.isActive == '1' &&
            element.typeAdministration ==
                UserTypeEnum.SalesManagement.type.toString())
        .toList();
  }
}
