import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../manager/deleted_invoices_cubit.dart';
import '../widgets/deleted_invoices_paginated_list.dart';

class DeletedInvoicesPage extends StatefulWidget {
  const DeletedInvoicesPage({super.key});

  @override
  State<DeletedInvoicesPage> createState() => _DeletedInvoicesPageState();
}

class _DeletedInvoicesPageState extends State<DeletedInvoicesPage> {
  late final DeletedInvoicesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<DeletedInvoicesCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getDeletedInvoices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'الفواتير المحذوفة'),
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
                      _cubit.getDeletedInvoices(isDebounced: true);
                    },
                  ),
                ),
              ],
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<DeletedInvoicesCubit,
                  DeletedInvoicesState>(
                label: "عدد الفواتير",
                countSelector: (state) => _cubit.pageVariables.allList.length,
                totalCount: (state) => _cubit.pageVariables.totalCount,
              ),
            ),
            10.height,
            Expanded(
              child: BlocBuilder<DeletedInvoicesCubit, DeletedInvoicesState>(
                buildWhen: (previous, current) {
                  return previous.getDeletedInvoicesStatus !=
                          current.getDeletedInvoicesStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getDeletedInvoicesStatus.when(
                    success: (data) => DeletedInvoicesPaginatedList(),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getDeletedInvoices(),
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
