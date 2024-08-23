import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../manager/clients_transfer_approvals_cubit.dart';
import '../widgets/clients_transfer_approvals_paginated_list.dart';

class ClientsTransferApprovalsPage extends StatefulWidget {
  const ClientsTransferApprovalsPage({super.key});

  @override
  State<ClientsTransferApprovalsPage> createState() =>
      _ClientsTransferApprovalsState();
}

class _ClientsTransferApprovalsState
    extends State<ClientsTransferApprovalsPage> {
  late final ClientsTransferApprovalsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsTransferApprovalsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getClientsTransferApprovals();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'موافقات تحويل العملاء'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            CustomSearchWidget(
              searchController: _cubit.pageVariables.searchController,
              onChanged: (value) {
                _cubit.filterClientsTransferApprovals();
              },
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<ClientsTransferApprovalsCubit,
                  ClientsTransferApprovalsState>(
                countSelector: (state) => _cubit.pageVariables.allList.length,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<ClientsTransferApprovalsCubit,
                    ClientsTransferApprovalsState>(
                  buildWhen: (previous, current) {
                    return previous.getClientsTransferApprovalsStatus !=
                            current.getClientsTransferApprovalsStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getClientsTransferApprovalsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) {
                        return ClientsTransferApprovalsPaginatedList();
                      },
                      empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => AppErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getClientsTransferApprovals(),
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
