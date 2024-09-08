import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/search_filter_row.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/support_clients_accept_cubit.dart';
import '../widgets/clients_support_accept_paginated_list.dart';
import '../widgets/filter_support_client_accept_sheet.dart';

class SupportClientsAcceptPage extends StatefulWidget {
  const SupportClientsAcceptPage({super.key});

  @override
  State<SupportClientsAcceptPage> createState() => _SupportClientAcceptState();
}

class _SupportClientAcceptState extends State<SupportClientsAcceptPage> {
  late final SupportClientsAcceptCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<SupportClientsAcceptCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getSupportClientsAccept();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'العملاء المشتركين'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            SearchFilterRow(
              searchController: _cubit.pageVariables.searchController,
              onSearchChanged: (value) {
                _cubit.getSupportClientsAccept(isDebounced: true);
              },
              onFilterPressed: () async {
                final value = await AppBottomSheet.show(
                  context: context,
                  child: FilterSupportClientAcceptSheet(),
                );
                if (value != true) {
                  _cubit.returnToPreviousState();
                }
              },
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<SupportClientsAcceptCubit,
                  SupportClientsAcceptState>(
                countSelector: (state) => _cubit.pageVariables.allList.length,
                totalCount: (state) => _cubit.pageVariables.totalCount,
              ),
            ),
            10.height,
            Expanded(
              child: BlocBuilder<SupportClientsAcceptCubit,
                  SupportClientsAcceptState>(
                buildWhen: (previous, current) {
                  return previous.getClientsAcceptStatus !=
                          current.getClientsAcceptStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getClientsAcceptStatus.when(
                    success: (data) => ClientsSupportAcceptPaginatedList(),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getSupportClientsAccept(),
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
