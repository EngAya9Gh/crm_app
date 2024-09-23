import 'dart:ui' as myui;

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/helpers/number_formatter.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/invoices_section_cubit.dart';
import '../widgets/filter_invoices_sheet.dart';
import '../widgets/invoices_paginated_list.dart';
import '../widgets/invoice_status_widget.dart';
import '../../../../../core/common/widgets/pagination_controls.dart'; // Add this import

class ClientsInvoicesPage2 extends StatefulWidget {
  const ClientsInvoicesPage2({super.key});

  @override
  State<ClientsInvoicesPage2> createState() => _ClientsInvoicesPageState();
}

class _ClientsInvoicesPageState extends State<ClientsInvoicesPage2> {
  late final InvoicesSectionCubit _cubit;

  @override
  void initState() {
    super.initState();
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
            _buildCountPaginatedList(),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: _buildInvoicesTable()),
                  _buildPaginationControls(), // Add this line
                ],
              ),
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

  Widget _buildCountPaginatedList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CountPaginatedList<InvoicesSectionCubit, InvoicesSectionState>(
        countSelector: (state) => _cubit.invoicesList.length,
        totalCount: (state) => _cubit.totalNumberOfInvoices,
      ),
    );
  }

  Widget _buildInvoicesTable() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
            builder: (context, state) {
              return DataTable(
                columns: [
                  DataColumn(label: AppText('رقم الفاتورة')),
                  DataColumn(label: AppText('الفرع')),
                  DataColumn(label: AppText('التاريخ')),
                  DataColumn(label: AppText('موضوع الفاتورة')),
                  DataColumn(label: AppText('اسم المؤسسة')),
                  DataColumn(label: AppText('الاجمالي')),
                  DataColumn(label: AppText('المدفوع')),
                  DataColumn(label: AppText('المتبقي')),
                  DataColumn(label: AppText('التجديد السنوي')),
                  DataColumn(label: AppText('العملة')),
                  DataColumn(label: AppText('الحالة')),
                ],
                rows: _buildTableRows(),
              );
            },
          ),
        ),
      ),
    );
  }

  List<DataRow> _buildTableRows() {
    return _cubit.invoicesList.map((invoice) => DataRow(
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
              ? AppText(_handleRemaining(invoice.total, invoice.amountPaid))
              : AppText(''),
        ),
        DataCell(AppText(_handleNum(invoice.renewYear.toString()))),
        DataCell(AppText(HelperFunctions.getCurrencyName(invoice.currency_name))),
        DataCell(
            prepareStatusWidget(
          isShowDeleted: invoice.isDeleted??false, // Adjust this based on your requirements
          isDeleted: invoice.isDeleted,
          isApprove: invoice.isApprove,
          stateclient: invoice.stateclient,
        )),

      ],
    )).toList();
  }

  String _handleRemaining(total, amountPaid) {
    final num1 = num.tryParse(total?.toString() ?? '0') ?? 0;
    final num2 =
        num.tryParse(amountPaid?.toString() ?? '0') ?? 0;
    final result = num1 - num2;
    return _handleNum(result.toString());
  }

  String _handleNum(String? value) {
    return formatNumber(num.tryParse(value ?? '0') ?? 0);
  }

  Widget _buildPaginationControls() {
    return BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
      builder: (context, state) {
        return PaginationControls(
          currentPage: _cubit.currentPage,
          totalPages: _cubit.totalPages,
          onPageChanged: (page) {
            _cubit.getInvoicesByPage(page);
          },
        );
      },
    );
  }
}
