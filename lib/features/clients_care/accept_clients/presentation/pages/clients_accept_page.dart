import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_accept_cubit.dart';
import '../widgets/clients_accept_paginated_list.dart';
import '../widgets/filter_client_accept_sheet.dart';

class ClientsAcceptPage extends StatefulWidget {
  ClientsAcceptPage({super.key});

  @override
  _ClientAcceptState createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<ClientsAcceptPage> {
  late final ClientsAcceptCubit clientsAcceptCubit;

  @override
  void initState() {
    clientsAcceptCubit = context.read<ClientsAcceptCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await clientsAcceptCubit.getClientsAccept();
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
            15.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController:
                        clientsAcceptCubit.pageVariables.searchController,
                    onChanged: (value) {
                      clientsAcceptCubit.getClientsAccept(isDebounced: true);
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterClientAcceptSheet(),
                    );
                    if (value != true) {
                      clientsAcceptCubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<ClientsAcceptCubit, ClientsAcceptState>(
                countSelector: (state) =>
                    clientsAcceptCubit.pageVariables.allList.length,
                totalCount: (state) =>
                    clientsAcceptCubit.pageVariables.totalCount,
              ),
            ),
            15.height,
            Expanded(
              child: BlocBuilder<ClientsAcceptCubit, ClientsAcceptState>(
                buildWhen: (previous, current) {
                  return previous.getClientsAcceptStatus !=
                          current.getClientsAcceptStatus &&
                      clientsAcceptCubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getClientsAcceptStatus.when(
                    success: (data) => ClientsAcceptPaginatedList(),
                    failure: (error, data) {
                      return AppErrorWidget(message: error);
                    },
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
