import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/client_logs_cubit/client_logs_tab_cubit.dart';
import '../widgets/client_logs_paginated_list.dart';
import '../widgets/filter_client_logs_sheet.dart';

class ClientLogsTabPage extends StatefulWidget {
  const ClientLogsTabPage({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  State<ClientLogsTabPage> createState() => _SupportClientAcceptState();
}

class _SupportClientAcceptState extends State<ClientLogsTabPage> {
  late final ClientLogsTabCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientLogsTabCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getClientLogs(widget.client.idClients!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                    _cubit.localSearch();
                  },
                ),
              ),
              CustomFilterIcon(
                onTap: () async {
                  final value = await AppBottomSheet.show(
                    context: context,
                    child: FilterClientLogsSheet(
                        idClient: widget.client.idClients!),
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
            child: CountPaginatedList<ClientLogsTabCubit, ClientLogsTabState>(
              countSelector: (state) => _cubit.pageVariables.filterList.length,
              totalCount: (state) => _cubit.pageVariables.totalCount,
            ),
          ),
          15.height,
          Expanded(
            child: BlocBuilder<ClientLogsTabCubit, ClientLogsTabState>(
              buildWhen: (previous, current) {
                return previous.getClientLogsStatus !=
                        current.getClientLogsStatus &&
                    _cubit.pageVariables.isNewFilter;
              },
              builder: (context, state) {
                return state.getClientLogsStatus.when(
                  success: (data) => ClientLogsPaginatedList(),
                  failure: (error, data) => AppErrorWidget(
                    message: error,
                    onPressed: () =>
                        _cubit.getClientLogs(widget.client.idClients!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
