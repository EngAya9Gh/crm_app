import 'dart:ui' as myui;

import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/helpers/api_helper.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/helpers/number_formatter.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/common/widgets/web/pagination_controls.dart'; // Add this import
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../core/services/di/di_container.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../../../sales/invoices_list/presentation/widgets/filter_invoices_sheet.dart';
import '../../../../sales/invoices_list/presentation/widgets/invoice_status_widget.dart';
import '../manager/verified_invoice_bloc.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../widgets/insure_transfer_inoivce_dialog.dart';

class WebVerifiedInvoicesPage extends StatefulWidget {
  const WebVerifiedInvoicesPage({super.key});

  @override
  State<WebVerifiedInvoicesPage> createState() => _WebVerifiedInvoicesPageState();
}

class _WebVerifiedInvoicesPageState extends State<WebVerifiedInvoicesPage> {
  late final VerifiedInvoiceBloc _bloc;
  final ScrollController _horizontalScrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = getIt<VerifiedInvoiceBloc>();
    _bloc.add(GetVerifiedInvoiceEvent());
    context.read<InvoicesSectionCubit>().clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: AppScaffold(
        appBar: CustomAppBar(title: 'فواتير بحاجة توثيق'),
        body: Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(height: 10),
              _buildSearchAndFilterRow(),
              SizedBox(height: 10),
              BlocBuilder<VerifiedInvoiceBloc, VerifiedInvoiceState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state.verifiedInvoiceList.isLoading()) {
                    return AppLoader(isExpanded: true);
                  }
                  if (state.verifiedInvoiceList.isFailed()) {
                    return AppErrorWidget(
                      message: 'حدث خطأ ما',
                      onPressed: () {
                        _bloc.add(GetVerifiedInvoiceEvent(addNewFilter: true));
                      },
                    );
                  }
                  if (state.verifiedInvoiceList.isSuccess() && (state.verifiedInvoiceList.data?.isEmpty ?? true)) {
                    return AppErrorWidget(message: 'لا توجد فواتير');
                  }

                  return Expanded(
                    child: Column(
                      children: [
                        _buildInvoicesTable(),
                        _buildPaginationControls(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAndFilterRow() {
    return BlocBuilder<VerifiedInvoiceBloc, VerifiedInvoiceState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CustomSearchWidget(
                searchController: searchController,
                hint: 'اسم المؤسسة، رقم الفاتورة...',
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'get_verified_invoices-debounce',
                    Duration(milliseconds: 500),
                        () =>
                        _bloc.add(GetVerifiedInvoiceEvent(
                            getInvoicesByPrivilegesParams:
                            (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(searchQuery: value))),
                  );
                },
              ),
            ),
            CustomFilterIcon(
              onTap: () {
                AppBottomSheet.show(
                  context: context,
                  child: FilterInvoicesSheet(
                    onFilter: () {
                      var _blocFilter = context.read<InvoicesSectionCubit>();
                      var params = (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(
                        searchQuery: searchController.text,
                        typeSeller: _blocFilter.filtersEntity.filterInvoicesSellerType.value,
                        participateFk: _blocFilter.prepareUserId(SellerTypeEnum.collaborator),
                        fkAgent: _blocFilter.prepareUserId(SellerTypeEnum.agent),
                        fkIdUser: _blocFilter.prepareUserId(SellerTypeEnum.employee),
                        fkRegionInvoice: _blocFilter.filtersEntity.filterSelectedRegion.value?.branchId,
                        from: _blocFilter.filtersEntity.dateFromController.text,
                        to: _blocFilter.filtersEntity.dateToController.text,
                        typeReadyClient: _blocFilter.filtersEntity.filterClientStatus.value?.toParam,
                        hasDevices: _blocFilter.filtersEntity.filterDeviceState.value?.toParam,
                      );
                      _bloc.add(GetVerifiedInvoiceEvent(
                        getInvoicesByPrivilegesParams: params,
                      ));
                      // InvoicesSectionCubit
                      // _cubit.getInvoicesByPrivileges();
                    },
                  ),
                );
              },
            ),
            SizedBox(width: 8),
          ],
        );
      },
    );
  }

  Widget _buildInvoicesTable() {
    return Expanded(
      child: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Scrollbar(
            controller: _horizontalScrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _horizontalScrollController,
              child: DataTable(
                columns: [
                  DataColumn(label: AppText('رقم الفاتورة')),
                  DataColumn(label: AppText('الفرع')),
                  DataColumn(label: AppText('التاريخ')),
                  DataColumn(label: AppText('موضوع الفاتورة')),
                  DataColumn(label: AppText('اسم المؤسسة')),
                  DataColumn(label: AppText('الاجمالي')),
                  DataColumn(label: AppText('المدفوع')),
                  DataColumn(label: AppText('المتبقي')),
                  DataColumn(
                      label: AppText(
                        'التجديد السنوي',
                      )),
                  DataColumn(label: AppText('العملة')),
                  DataColumn(label: AppText('الذي قام بالتعديل')),
                  DataColumn(label: AppText('اخر تعديل')),
                  DataColumn(label: AppText('عمليات على الفاتورة')),
                  DataColumn(label: AppText('الحالة')),
                ],
                rows: _buildTableRows(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> _buildTableRows() {
    return (_bloc.state.verifiedInvoiceList.data ?? [])
        .map((invoice) =>
        DataRow(
          onSelectChanged: (_) {
            AppNavigator.push(
              ClientProfile(idClient: invoice.fkIdClient),
              name: AppRoutesNames.clientProfile.inClientsList,
              pathParameters: {'idClient': invoice.fkIdClient.toString()},
            );
          },
          cells: [
            DataCell(AppText("${invoice.idInvoice}#", textAlign: TextAlign.center)),
            DataCell(AppText(invoice.name_regoin_invoice, textAlign: TextAlign.center)),
            DataCell(AppText(invoice.date_approve, textAlign: TextAlign.center)),
            DataCell(AppText(invoice.address_invoice, textAlign: TextAlign.center)),
            DataCell(AppText(invoice.name_enterprise, textAlign: TextAlign.center)),
            DataCell(AppText(_handleNum(invoice.total.toString()), textAlign: TextAlign.center)),
            DataCell(AppText(_handleNum(invoice.amountPaid.toString()), textAlign: TextAlign.center)),
            DataCell(
              AppText(invoice.total != null && invoice.amountPaid != null ? _handleRemaining(invoice.total, invoice.amountPaid) : "",
                  textAlign: TextAlign.center),
            ),
            DataCell(AppText(_handleNum(invoice.renewYear.toString()), textAlign: TextAlign.center)),
            DataCell(AppText(HelperFunctions.getCurrencyName(invoice.currency_name), textAlign: TextAlign.center)),
            DataCell(AppText(invoice.userDidOperation, textAlign: TextAlign.center)),
            DataCell(AppText(invoice.lastOperation, textAlign: TextAlign.center)),
            DataCell(AppElevatedButton(
              height: 30,
              text: 'ترحيل الفاتورة',
              onPressed: () {
                AppConstants.showAppDialog(
                  child: InsureTransferInoivceDialog(bloc: _bloc,invoiceModel: invoice,),
                );
              },
            )),
            DataCell(prepareStatusWidget(
              isDeleted: invoice.isDeleted,
              isApprove: invoice.isApprove,
              stateclient: invoice.stateclient,
            )),
          ],
        ))
        .toList();
  }

  String _handleRemaining(total, amountPaid) {
    final num1 = num.tryParse(total?.toString() ?? '0') ?? 0;
    final num2 = num.tryParse(amountPaid?.toString() ?? '0') ?? 0;
    final result = num1 - num2;
    return _handleNum(result.toString());
  }

  String _handleNum(String? value) {
    return formatNumber(num.tryParse(value ?? '0') ?? 0);
  }

  Widget _buildPaginationControls() {
    return PaginationControls(
      currentPage: ApiHelper.calculatePage(skip: (_bloc.state.getInvoicesByPrivilegesParams?.skip??0)),
      totalPages: ((_bloc.state.verifiedInvoiceList.data?.length ?? 0) / AppConstants.kPerPage).ceil(),
      onPageChanged: (page) {
        var _blocFilter = context.read<InvoicesSectionCubit>();
        var params = (_bloc.state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(
          skip: ((page - 1) * AppConstants.kPerPage).ceil(),
          searchQuery: searchController.text,
          typeSeller: _blocFilter.filtersEntity.filterInvoicesSellerType.value,
          participateFk: _blocFilter.prepareUserId(SellerTypeEnum.collaborator),
          fkAgent: _blocFilter.prepareUserId(SellerTypeEnum.agent),
          fkIdUser: _blocFilter.prepareUserId(SellerTypeEnum.employee),
          fkRegionInvoice: _blocFilter.filtersEntity.filterSelectedRegion.value?.branchId,
          from: _blocFilter.filtersEntity.dateFromController.text,
          to: _blocFilter.filtersEntity.dateToController.text,
          typeReadyClient: _blocFilter.filtersEntity.filterClientStatus.value?.toParam,
          hasDevices: _blocFilter.filtersEntity.filterDeviceState.value?.toParam,
        );

        _bloc.add(GetVerifiedInvoiceEvent(getInvoicesByPrivilegesParams: params));
      },
    );
  }
}
