import 'package:crm_smart/core/common/widgets/count_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/latest_clients_updates_cubit.dart';
import '../widgets/custom_sorting_icon.dart';
import '../widgets/filter_latest_updates_sheet.dart';
import '../widgets/latest_clients_updates_paginated_list.dart';

class LatestClientsUpdatesPage extends StatefulWidget {
  LatestClientsUpdatesPage({super.key});

  @override
  State<LatestClientsUpdatesPage> createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<LatestClientsUpdatesPage> {
  late final LatestClientsUpdatesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<LatestClientsUpdatesCubit>();
    _cubit.init(
      fkCountry: AppConstants.currentCountry,
      isMarketing: context.read<PrivilegesCubit>().checkPrivilege('155'),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getLatestClients();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'آخر تحديثات العملاء'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                8.width,
                CustomSortingIcon(
                  onTap: () => _cubit.sortLatestClients(),
                ),
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.pageVariables.searchController,
                    onChanged: (value) {
                      _cubit.getLatestClients(isDebounced: true);
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterLatestUpdatesSheet(),
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
              child: CountPaginatedList<LatestClientsUpdatesCubit,
                  LatestClientsUpdatesState>(
                countSelector: (state) {
                  return _cubit.pageVariables.latestUpdates.length;
                },
                totalCount: (state) => _cubit.pageVariables.totalClientsCount,
              ),
            ),
            15.height,
            Expanded(
              child: BlocBuilder<LatestClientsUpdatesCubit,
                  LatestClientsUpdatesState>(
                buildWhen: (previous, current) {
                  return previous.getLatestClientsStatus !=
                          current.getLatestClientsStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  if (state.getLatestClientsStatus.isLoading()) {
                    return AppLoader();
                  } else if (state.getLatestClientsStatus.isFailed()) {
                    return AppErrorWidget(
                      message: state.getLatestClientsStatus.error,
                    );
                  } else if (_cubit.pageVariables.totalClientsCount == 0) {
                    return AppErrorWidget(message: 'لا يوجد نتائج');
                  }
                  return LatestClientsUpdatesPaginatedList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
