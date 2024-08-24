import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
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
      await clientsAcceptCubit.getClientsAccept(
        fkCountry: AppConstants.currentCountry,
      );
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
                      clientsAcceptCubit.getClientsAccept(
                        fkCountry: AppConstants.currentCountry,
                        isDebounced: true,
                      );
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
                    clientsAcceptCubit.pageVariables.clientsList.length,
                totalCount: (state) =>
                    clientsAcceptCubit.pageVariables.totalClientsCount,
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
                  if (state.getClientsAcceptStatus.isLoading()) {
                    return AppLoader();
                  } else if (state.getClientsAcceptStatus.isFailed()) {
                    return AppErrorWidget(
                      message: state.getClientsAcceptStatus.error,
                    );
                  } else if (clientsAcceptCubit
                          .pageVariables.totalClientsCount ==
                      0) {
                    return AppErrorWidget(message: 'لا يوجد نتائج');
                  }
                  return ClientsAcceptPaginatedList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
