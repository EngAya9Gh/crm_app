import 'dart:ui' as myui;

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/invoices_section_cubit.dart';
import '../widgets/filter_invoices_sheet.dart';
import '../widgets/invoices_paginated_list.dart';

class ClientsInvoicesPage extends StatefulWidget {
  const ClientsInvoicesPage({Key? key}) : super(key: key);

  @override
  State<ClientsInvoicesPage> createState() => _ClientsInvoicesPageState();
}

class _ClientsInvoicesPageState extends State<ClientsInvoicesPage> {
  late final InvoicesSectionCubit invoicesTabCubit;

  @override
  void initState() {
    super.initState();
    invoicesTabCubit = context.read<InvoicesSectionCubit>()
      ..clearFilters()
      ..getInvoicesByPrivileges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'فواتير العملاء',
          style: TextStyle(color: kWhiteColor),
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
                    searchController: invoicesTabCubit.searchController,
                    hint: 'اسم المؤسسة، رقم الفاتورة...',
                    onChanged: (value) {
                      invoicesTabCubit.searchController.text = value;
                      EasyDebounce.debounce(
                        'get_invoices-debounce',
                        Duration(milliseconds: 500),
                        () => invoicesTabCubit.getInvoicesByPrivileges(),
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
                          invoicesTabCubit.getInvoicesByPrivileges();
                        },
                      ),
                    ).then(
                      (value) {
                        if (value != true) {
                          invoicesTabCubit.getPreviousState();
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
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'عدد الفواتير',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
                    buildWhen: (previous, current) => true,
                    builder: (context, state) {
                      return AppText(
                        "${invoicesTabCubit.invoicesList.length}/${invoicesTabCubit.totalNumberOfInvoices}",
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
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
