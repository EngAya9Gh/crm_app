import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_debts_cubit.dart';
import '../widgets/clients_debts_count.dart';
import '../widgets/clients_debts_paginated_list.dart';
import '../widgets/clients_debts_sheet.dart';

class ClientsDebtsPage extends StatefulWidget {
  const ClientsDebtsPage({super.key});

  @override
  State<ClientsDebtsPage> createState() => _PendingInvoicesState();
}

class _PendingInvoicesState extends State<ClientsDebtsPage> {
  late final ClientsDebtsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsDebtsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getPendingInvoices();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'ديون العملاء'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.pageVariables.searchController,
                    onChanged: (value) {
                      _cubit.filterPendingInvoices();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: ClientsDebtsSheet(),
                    );
                    if (value != true) {
                      _cubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClientsDebtsCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<ClientsDebtsCubit, ClientsDebtsState>(
                  buildWhen: (previous, current) {
                    return previous.getPendingInvoicesStatus !=
                            current.getPendingInvoicesStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getPendingInvoicesStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => ClientsDebtsPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getPendingInvoices(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
