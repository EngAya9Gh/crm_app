import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/support_clients_accept_cubit.dart';
import '../widgets/clients_support_accept_paginated_list.dart';
import '../widgets/filter_support_client_accept_sheet.dart';
import '../widgets/support_clients_accept_count.dart';

class SupportClientsAcceptPage extends StatefulWidget {
  const SupportClientsAcceptPage({super.key});

  @override
  State<SupportClientsAcceptPage> createState() => _SupportClientAcceptState();
}

class _SupportClientAcceptState extends State<SupportClientsAcceptPage> {
  late final SupportClientsAcceptCubit clientsAcceptCubit;

  @override
  void initState() {
    clientsAcceptCubit = context.read<SupportClientsAcceptCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await clientsAcceptCubit.getSupportClientsAccept(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      clientsAcceptCubit.filterClientLocally();
                      // clientsAcceptCubit.getSupportClientsAccept(
                      //   fkCountry: AppConstants.currentCountry(context) ?? '',
                      //   isDebounced: true,
                      // );
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterSupportClientAcceptSheet(),
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
              child: SupportClientsAcceptCount(),
            ),
            15.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<SupportClientsAcceptCubit,
                    SupportClientsAcceptState>(
                  buildWhen: (previous, current) {
                    return previous.getClientsAcceptStatus !=
                            current.getClientsAcceptStatus &&
                        clientsAcceptCubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getClientsAcceptStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => ClientsSupportAcceptPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () =>
                            clientsAcceptCubit.getSupportClientsAccept(
                          fkCountry: AppConstants.currentCountry(context) ?? '',
                        ),
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
