import 'package:crm_smart/features/sales/exceeded_clients/presentation/widgets/transfer_exceeded_clients_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/exceeded_clients_cubit.dart';
import '../widgets/exceeded_clients_paginated_list.dart';
import '../widgets/filter_exceeded_clients_sheet.dart';

class ExceededClientsPage extends StatefulWidget {
  const ExceededClientsPage({super.key});

  @override
  State<ExceededClientsPage> createState() => _SupportClientAcceptState();
}

class _SupportClientAcceptState extends State<ExceededClientsPage> {
  late final ExceededClientsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ExceededClientsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getExceededClients();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تحويلات عملاء التسويق لميداني'),
      bottomNavigationBar: TransferExceededClientsButton(),
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
                      _cubit.filterClientLocally();
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterExceededClientsSheet(),
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
              child: CountPaginatedList<ExceededClientsCubit,
                  ExceededClientsState>(
                countSelector: (state) => _cubit.pageVariables.allList.length,
              ),
            ),
            15.height,
            Expanded(
              child: BlocBuilder<ExceededClientsCubit, ExceededClientsState>(
                buildWhen: (previous, current) {
                  return previous.getExceededClientsStatus !=
                          current.getExceededClientsStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  if (state.getExceededClientsStatus.isLoading()) {
                    return AppLoader();
                  } else if (state.getExceededClientsStatus.isFailed()) {
                    return AppErrorWidget(
                      onPressed: () => _cubit.getExceededClients(),
                      message: state.getExceededClientsStatus.error,
                    );
                  } else if (_cubit.pageVariables.filteredClientsList.isEmpty) {
                    return AppErrorWidget(message: 'لا يوجد نتائج');
                  }
                  return ExceededClientsPaginatedList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
