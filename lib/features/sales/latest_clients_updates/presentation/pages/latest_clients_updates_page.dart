import '../../../../../core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/latest_clients_updates_cubit.dart';
import '../widgets/custom_sorting_icon.dart';
import '../widgets/filter_latest_updates_sheet.dart';
import '../widgets/latest_clients_updates_count.dart';
import '../widgets/latest_clients_updates_paginated_list.dart';

class LatestClientsUpdatesPage extends StatefulWidget {
  LatestClientsUpdatesPage({Key? key}) : super(key: key);

  @override
  State<LatestClientsUpdatesPage> createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<LatestClientsUpdatesPage> {
  late final LatestClientsUpdatesCubit latestUpdatesCubit;

  @override
  void initState() {
    latestUpdatesCubit = context.read<LatestClientsUpdatesCubit>();
    latestUpdatesCubit.init(
      fkCountry: AppConstants.currentCountry(context) ?? '',
      isMarketing: context.read<PrivilegeCubit>().checkPrivilege('155'),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await latestUpdatesCubit.getLatestClients();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'آخر تحديثات العملاء'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                CustomSortingIcon(
                  onTap: () {
                    latestUpdatesCubit.sortLatestClients();
                  },
                ),
                Expanded(
                  child: CustomSearchWidget(
                    searchController:
                        latestUpdatesCubit.pageVariables.searchController,
                    onChanged: (value) {
                      latestUpdatesCubit.getLatestClients(isDebounced: true);
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
                      latestUpdatesCubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LatestClientsUpdatesCount(),
            ),
            15.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<LatestClientsUpdatesCubit,
                    LatestClientsUpdatesState>(
                  buildWhen: (previous, current) {
                    return previous.getLatestClientsStatus !=
                            current.getLatestClientsStatus &&
                        latestUpdatesCubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    if (state.getLatestClientsStatus.isLoading()) {
                      return CustomLoadingIndicator();
                    } else if (state.getLatestClientsStatus.isFailed()) {
                      return CustomErrorWidget(
                        message: state.getLatestClientsStatus.error,
                      );
                    } else if (latestUpdatesCubit
                            .pageVariables.totalClientsCount ==
                        0) {
                      return CustomErrorWidget(message: 'لا يوجد نتائج');
                    }
                    return LatestClientsUpdatesPaginatedList();
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
