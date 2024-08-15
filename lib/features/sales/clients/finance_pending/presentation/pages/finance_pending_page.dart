import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../manager/finance_pending_cubit.dart';
import '../widgets/finance_pending_count.dart';
import '../widgets/finance_pending_paginated_list.dart';

class FinancePendingPage extends StatefulWidget {
  const FinancePendingPage({super.key});

  @override
  State<FinancePendingPage> createState() => _FinancePendingState();
}

class _FinancePendingState extends State<FinancePendingPage> {
  late final FinancePendingCubit financePendingCubit;

  @override
  void initState() {
    financePendingCubit = context.read<FinancePendingCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await financePendingCubit.getFinancePendingInvoices();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'طلبات اعتماد المالية'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            CustomSearchWidget(
              searchController:
                  financePendingCubit.pageVariables.searchController,
              onChanged: (value) {
                financePendingCubit.filterFinancePendingInvoices();
              },
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FinancePendingCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<FinancePendingCubit, FinancePendingState>(
                  buildWhen: (previous, current) {
                    return previous.getFinancePendingStatus !=
                            current.getFinancePendingStatus &&
                        financePendingCubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getFinancePendingStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => FinancePendingPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () =>
                            financePendingCubit.getFinancePendingInvoices(),
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
