import 'dart:ui' as myui;

import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/helpers/number_formatter.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/common/widgets/web/pagination_controls.dart'; // Add this import
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/invoices_section_cubit.dart';
import '../widgets/filter_invoices_sheet.dart';
import '../widgets/invoice_status_widget.dart';

class WebClientsInvoicesPage extends StatefulWidget {
  const WebClientsInvoicesPage({super.key});

  @override
  State<WebClientsInvoicesPage> createState() => _WebClientsInvoicesPageState();
}

class _WebClientsInvoicesPageState extends State<WebClientsInvoicesPage> {
  late final InvoicesSectionCubit _cubit;
  late final PrivilegesCubit _privilegeCubit;

  @override
  void initState() {
    super.initState();
    _privilegeCubit = context.read<PrivilegesCubit>();
    _cubit = context.read<InvoicesSectionCubit>()
      ..clearFilters()
      ..getInvoicesByPrivileges();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'فواتير العملاء'),
      body: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildSearchAndFilterRow(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_privilegeCubit.checkPrivilege('288')) ...[
                  BlocConsumer<InvoicesSectionCubit, InvoicesSectionState>(
                    listenWhen: (previous, current) {
                      return previous.exportInvoicesToExcelStatus !=
                          current.exportInvoicesToExcelStatus;
                    },
                    listener: (context, state) {
                      if (state.exportInvoicesToExcelStatus.isFailed()) {
                        AppSnackbar.showSnakeBar(
                          state.exportInvoicesToExcelStatus.error,
                          color: ToastColorsEnum.error,
                        );
                      }
                    },
                    buildWhen: (previous, current) {
                      return previous.exportInvoicesToExcelStatus !=
                          current.exportInvoicesToExcelStatus;
                    },
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading:
                            state.exportInvoicesToExcelStatus.isLoading(),
                        text: "تصدير إلى Excel",
                        onPressed: _cubit.exportInvoicesToExcel,
                      );
                    },
                  ),
                ],
              ],
            ),
            SizedBox(height: 10),
            BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
              builder: (context, state) {
                if (state.getInvoicesStatus.isLoading) {
                  return AppLoader(isExpanded: true);
                }
                if (state.getInvoicesStatus.isFailed) {
                  return AppErrorWidget(
                    message: 'حدث خطأ ما',
                    onPressed: () {
                      _cubit.getInvoicesByPrivileges(isNewFilter: true);
                    },
                  );
                }
                if (state.getInvoicesStatus.isSuccess &&
                    _cubit.invoicesList.isEmpty) {
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
    );
  }

  Widget _buildSearchAndFilterRow() {
    return Row(
      children: [
        Expanded(
          child: CustomSearchWidget(
            searchController: _cubit.searchController,
            hint: 'اسم المؤسسة، رقم الفاتورة...',
            onChanged: (value) {
              _cubit.searchController.text = value;
              EasyDebounce.debounce(
                'get_invoices-debounce',
                Duration(milliseconds: 500),
                () => _cubit.getInvoicesByPrivileges(),
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
                  _cubit.getInvoicesByPrivileges();
                },
              ),
            ).then(
              (value) {
                if (value != true) {
                  _cubit.getPreviousState();
                }
              },
            );
          },
        ),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildInvoicesTable() {
    return Expanded(
      child: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: AppText('رقم الفاتورة',overflow: TextOverflow.ellipsis,)),
            DataColumn(label: AppText('الفرع')),
            DataColumn(label: AppText('التاريخ')),
            DataColumn(label: AppText('موضوع الفاتورة',overflow: TextOverflow.ellipsis,)),
            DataColumn(label: AppText('اسم المؤسسة',overflow: TextOverflow.ellipsis,)),
            DataColumn(label: AppText('الاجمالي')),
            DataColumn(label: AppText('المدفوع')),
            DataColumn(label: AppText('المتبقي')),
            DataColumn(label: AppText('التجديد السنوي',overflow: TextOverflow.ellipsis,)),
            DataColumn(label: AppText('العملة')),
            DataColumn(label: AppText('الحالة')),
          ],
          rows: _buildTableRows(),
        ),
      ),
    );
  }

  List<DataRow> _buildTableRows() {
    return _cubit.invoicesList
        .map((invoice) => DataRow(
              onSelectChanged: (_) {
                // Handle row tap here
                AppNavigator.go(
                  ClientProfile(idClient: invoice.fkIdClient),
                  isNew: false,
                );
              },
              cells: [
                DataCell(AppText("${invoice.idInvoice}#")),
                DataCell(AppText(invoice.name_regoin_invoice)),
                DataCell(AppText(invoice.date_approve)),
                DataCell(AppText(invoice.address_invoice)),
                DataCell(AppText(invoice.name_enterprise)),
                DataCell(AppText(_handleNum(invoice.total.toString()))),
                DataCell(AppText(_handleNum(invoice.amountPaid.toString()))),
                DataCell(
                  invoice.total != null && invoice.amountPaid != null
                      ? AppText(
                          _handleRemaining(invoice.total, invoice.amountPaid))
                      : AppText(''),
                ),
                DataCell(AppText(_handleNum(invoice.renewYear.toString()))),
                DataCell(AppText(
                    HelperFunctions.getCurrencyName(invoice.currency_name))),
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
      currentPage: _cubit.currentPage,
      totalPages: _cubit.totalPages,
      onPageChanged: (page) {
        _cubit.getInvoicesByPage(page);
      },
    );
  }
}
