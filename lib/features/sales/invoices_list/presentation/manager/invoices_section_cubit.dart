import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/helpers/app_files_helper.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../model/usermodel.dart';
import '../../../clients/clients_list/domain/use_cases/get_users_sales_usecase.dart';
import '../../../public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import '../../../public_relations/participates/domain/use_cases/get_participate_list_usecase.dart';
import '../../domain/entities/_invoices_section_filter_entity.dart';
import '../../domain/use_cases/export_invoices_to_excel_usecase.dart';
import '../../domain/use_cases/export_invoices_to_pdf_usecase.dart';
import '../../domain/use_cases/get_all_users_usecase.dart';
import '../../domain/use_cases/get_invoice_by_id_usecase.dart';
import '../../domain/use_cases/get_invoices_by_privileges_usecase.dart';

part 'invoices_section_state.dart';

@injectable
class InvoicesSectionCubit extends Cubit<InvoicesSectionState> {
  final GetInvoicesByPrivilegesUsecase _getInvoicesByPrivilegesUsecase;
  final GetAgentsAndDistributorsUseCase _getAgentsAndDistributorsUseCase;
  final ParticipateListUsecase _participateListUsecase;
  final GetAllUsersUseCase _getAllUsersUseCase;
  final GetUsersSalesUseCase _getUsersSalesUseCases;
  final GetInvoiceByIdUsecase _getInvoiceByIdUsecase;
  final ExportInvoicesToExcelUsecase _exportInvoicesToExcelUsecase;
  final ExportInvoicesToPdfUsecase _exportInvoicesToPdfUsecase;

  InvoicesSectionCubit(
    this._getInvoicesByPrivilegesUsecase,
    this._getAgentsAndDistributorsUseCase,
    this._participateListUsecase,
    this._getAllUsersUseCase,
    this._getUsersSalesUseCases,
    this._getInvoiceByIdUsecase,
    this._exportInvoicesToExcelUsecase,
    this._exportInvoicesToPdfUsecase,
  ) : super(InvoicesSectionState());

  GetInvoicesByPrivilegesParams getInvoicesParams = GetInvoicesByPrivilegesParams();

  final TextEditingController searchController = TextEditingController();
  InvoicesSectionFilterEntity filtersEntity = InvoicesSectionFilterEntity();

  bool isNewFilter = true;

  final List<InvoiceModel> invoicesList = [];

  bool hasReachedEnd = false;
  int totalNumberOfInvoices = 0;
  InvoiceModel? currentInvoice;

  int currentPage = 1;
  int totalPages = 100;

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

  Future<void> exportInvoicesToExcel() async {
    if (filtersEntity.dateFromController.text == "") {
      AppSnackbar.showSnakeBar("يرجى تحديد تاريخ بدء لتصدير ملف الاكسل");
      return;
    }
    emit(state.copyWith(exportInvoicesToExcelStatus: const BlocStatus.loading()));

    final result = await _exportInvoicesToExcelUsecase(_getInvoicesParams(isDownload: true));
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        exportInvoicesToExcelStatus: BlocStatus.fail(error: e),
      ));
    }, (r) async {
      final excelData = r.data;

      final filePath = await AppFilesHelper.downloadFileAndReturnPath(
        name: "invoices_list.xlsx",
        bytes: excelData,
      );

      await AppFilesHelper.openFile(filePath);
      emit(state.copyWith(exportInvoicesToExcelStatus: BlocStatus.success()));
    });
  }

  Future<void> exportInvoicesToPdf(ExportInvoiceToPdfParams params) async {
    emit(state.copyWith(exportInvoicesToPdfStatus: const BlocStatus.loading()));

    final result = await _exportInvoicesToPdfUsecase(params);
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        exportInvoicesToPdfStatus: BlocStatus.fail(error: e),
      ));
    }, (r) async {
      final pdfData = r.data;

      final filePath = await AppFilesHelper.downloadFileAndReturnPath(
        name: "pdfDetail.pdf",
        bytes: pdfData,
      );

      await AppFilesHelper.openFile(filePath);
      emit(state.copyWith(exportInvoicesToPdfStatus: BlocStatus.success()));
    });
  }

  GetInvoicesByPrivilegesParams _getInvoicesParams({
    bool isDownload = false,
  }) {
    print(filtersEntity.filterInvoiceType.value
        .map(
          (e) => e.value!,
        )
        .toList());
    getInvoicesParams = getInvoicesParams.copyWith(
      skip: invoicesList.length,
      searchQuery: searchController.text,
      typeSeller: filtersEntity.filterInvoicesSellerType.value,
      participateFk: prepareUserId(SellerTypeEnum.collaborator),
      fkAgent: prepareUserId(SellerTypeEnum.agent),
      fkIdUser: prepareUserId(SellerTypeEnum.employee),
      fkRegionInvoice: filtersEntity.filterSelectedRegion.value?.branchId,
      from: filtersEntity.dateFromController.text,
      to: filtersEntity.dateToController.text,
      typeReadyClient: filtersEntity.filterClientStatus.value?.toParam,
      invoiceType: () => filtersEntity.filterInvoiceType.value,
      statusInvoice: filtersEntity.filterInvoiceStatus.value?.value,
      hasDevices: filtersEntity.filterDeviceState.value?.toParam,
      download: isDownload ? '1' : null,
    );
    return getInvoicesParams;
  }

  String? prepareUserId(SellerTypeEnum sellerType) {
    if (sellerType == filtersEntity.filterInvoicesSellerType.value) {
      return filtersEntity.filterSelectedUser.value?.id;
    }
    if (sellerType.isAgent() && (filtersEntity.filterInvoicesSellerType.value?.isDistributor() ?? false)) {
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
      await getAllUsers();
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
            return element.typeAgent.toString() == filtersEntity.filterInvoicesSellerType.value!.toParam;
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
        emit(state.copyWith(getUsersState: BlocStatus.fail(error: exception.message)));
      },
      (value) {
        emit(state.copyWith(
          getUsersState: BlocStatus.success(data: value.message),
        ));
      },
    );
  }

  Future<void> getAllUsers() async {
    emit(state.copyWith(getUsersState: const BlocStatus.loading()));

    final result = await _getUsersSalesUseCases(GetUsersSalesParams());

    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(getUsersState: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(
          getUsersState: BlocStatus.success(data: value.message ?? []),
        ));
      },
    );
  }

  List<UserModel> _filterEmployees(List<UserModel> value) {
    return value.where((element) => element.isActive == '1' && element.typeAdministration == UserTypeEnum.SalesManagement.type.toString()).toList();
  }

  Future<void> getInvoiceById(String id, [ValueChanged<InvoiceModel>? onGettingData]) async {
    emit(state.copyWith(getInvoiceByIdStatus: const BlocStatus.loading()));

    final result = await _getInvoiceByIdUsecase(GetInvoiceByIdParams(id: id));

    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getInvoiceByIdStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) {
        currentInvoice = value.data;
        print("currentInvoice: ${value.data}");
        emit(state.copyWith(
          getInvoiceByIdStatus: BlocStatus.success(data: value),
        ));
        onGettingData?.call(currentInvoice!);
      },
    );
  }

  void setSuccessState() {
    emit(state.copyWith(getInvoiceByIdStatus: BlocStatus.success()));
  }

  Future<void> getInvoicesByPage(int page) async {
    if (state.getInvoicesStatus == StateStatus.loading) return;

    emit(state.copyWith(getInvoicesStatus: StateStatus.loading));

    final result = await _getInvoicesByPrivilegesUsecase(_getInvoicesParams1(page: page));
    result.fold((e) {
      if (AppConstants.shouldReturnEarly(e)) return;
      emit(state.copyWith(
        getInvoicesStatus: StateStatus.failure,
        getInvoicesMessage: e,
      ));
    }, (r) {
      totalNumberOfInvoices = r.$2;
      final List<InvoiceModel> invoices = r.$1;
      invoicesList.clear();
      invoicesList.addAll(invoices);
      currentPage = page;
      totalPages = (totalNumberOfInvoices / AppConstants.kPerPage).ceil();
      emit(state.copyWith(
        getInvoicesStatus: StateStatus.success,
      ));
    });
  }

  GetInvoicesByPrivilegesParams _getInvoicesParams1({int page = 1}) {
    getInvoicesParams = getInvoicesParams.copyWith(
      skip: (page - 1) * AppConstants.kPerPage,
      searchQuery: searchController.text,
      typeSeller: filtersEntity.filterInvoicesSellerType.value,
      participateFk: prepareUserId(SellerTypeEnum.collaborator),
      fkAgent: prepareUserId(SellerTypeEnum.agent),
      fkIdUser: prepareUserId(SellerTypeEnum.employee),
      fkRegionInvoice: filtersEntity.filterSelectedRegion.value?.branchId,
      from: filtersEntity.dateFromController.text,
      to: filtersEntity.dateToController.text,
      typeReadyClient: filtersEntity.filterClientStatus.value?.toParam,
      hasDevices: filtersEntity.filterDeviceState.value?.toParam,
    );
    return getInvoicesParams;
  }
}
