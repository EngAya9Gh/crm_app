import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/withdrawn_invoices_cubit.dart';
import '../widgets/filter_withdrawn_invoices_sheet.dart';
import '../widgets/withdrawn_invoices_paginated_list.dart';

class WithdrawnInvoicesPage extends StatefulWidget {
  const WithdrawnInvoicesPage({super.key});

  @override
  State<WithdrawnInvoicesPage> createState() => _WithdrawnInvoicesPageState();
}

class _WithdrawnInvoicesPageState extends State<WithdrawnInvoicesPage> {
  late final WithdrawnInvoicesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<WithdrawnInvoicesCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getWithdrawnInvoices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'الفواتير المنسحبة'),
      body: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.pageVariables.searchController,
                    onChanged: (value) {
                      _cubit.getWithdrawnInvoices(isDebounced: true);
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterWithdrawnInvoicesSheet(),
                    );
                    if (value != true) {
                      _cubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<WithdrawnInvoicesCubit,
                  WithdrawnInvoicesState>(
                label: "عدد الفواتير",
                countSelector: (state) => _cubit.pageVariables.allList.length,
                totalCount: (state) => _cubit.pageVariables.totalCount,
              ),
            ),
            10.height,
            Expanded(
              child:
                  BlocBuilder<WithdrawnInvoicesCubit, WithdrawnInvoicesState>(
                buildWhen: (previous, current) {
                  return previous.getWithdrawnInvoicesStatus !=
                          current.getWithdrawnInvoicesStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getWithdrawnInvoicesStatus.when(
                    success: (data) => WithdrawnInvoicesPaginatedList(),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getWithdrawnInvoices(),
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
