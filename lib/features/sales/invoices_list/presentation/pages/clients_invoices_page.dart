import 'dart:ui' as myui;

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/invoices_section_cubit.dart';
import '../widgets/filter_invoices_sheet.dart';
import '../widgets/invoices_paginated_list.dart';

class ClientsInvoicesPage extends StatefulWidget {
  const ClientsInvoicesPage({Key? key}) : super(key: key);

  @override
  State<ClientsInvoicesPage> createState() => _ClientsInvoicesPageState();
}

class _ClientsInvoicesPageState extends State<ClientsInvoicesPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'فواتير العملاء',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
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
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<InvoicesSectionCubit,
                  InvoicesSectionState>(
                countSelector: (state) => _cubit.invoicesList.length,
                totalCount: (state) => _cubit.totalNumberOfInvoices,
              ),
            ),
            SizedBox(height: 10),
            InvoicesPaginatedList(),
          ],
        ),
      ),
    );
  }
}
