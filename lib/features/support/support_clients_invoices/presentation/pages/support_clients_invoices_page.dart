import 'package:crm_smart/core/common/widgets/search_filter_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/support_clients_invoices_cubit.dart';
import '../widgets/filter_support_clients_invoices_sheet.dart';
import '../widgets/support_clients_invoices_paginated_list.dart';

class SupportClientsInvoicesPage extends StatefulWidget {
  const SupportClientsInvoicesPage({super.key});

  @override
  State<SupportClientsInvoicesPage> createState() =>
      _SupportClientsInvoicesState();
}

class _SupportClientsInvoicesState extends State<SupportClientsInvoicesPage> {
  late final SupportClientsInvoicesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<SupportClientsInvoicesCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.loadCities(context);
      await _cubit.getSupportClientInvoices();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'فواتير العملاء'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            SearchFilterRow(
              searchController: _cubit.pageVariables.searchController,
              onSearchChanged: (value) {
                _cubit.getSupportClientInvoices(isDebounced: true);
              },
              onFilterPressed: () async {
                final value = await AppBottomSheet.show(
                  context: context,
                  child: FilterSupportClientsInvoicesSheet(),
                );
                if (value != true) {
                  _cubit.returnToPreviousState();
                }
              },
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<SupportClientsInvoicesCubit,
                  SupportClientsInvoicesState>(
                label: 'عدد الفواتير: ',
                countSelector: (state) => _cubit.pageVariables.allList.length,
                totalCount: (state) => _cubit.pageVariables.totalCount,
              ),
            ),
            Expanded(
              child: BlocBuilder<SupportClientsInvoicesCubit,
                  SupportClientsInvoicesState>(
                buildWhen: (previous, current) {
                  return previous.getSupportClientInvoicesStatus !=
                          current.getSupportClientInvoicesStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getSupportClientInvoicesStatus.when(
                    loading: () => AppLoader(),
                    success: (data) => SupportClientsInvoicesPaginatedList(),
                    empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getSupportClientInvoices(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
