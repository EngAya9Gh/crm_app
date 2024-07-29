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
import '../manager/exceeded_clients_cubit.dart';
import '../widgets/exceeded_clients_count.dart';
import '../widgets/exceeded_clients_paginated_list.dart';
import '../widgets/filter_exceeded_clients_sheet.dart';

class ExceededClientsPage extends StatefulWidget {
  const ExceededClientsPage({super.key});

  @override
  State<ExceededClientsPage> createState() => _SupportClientAcceptState();
}

class _SupportClientAcceptState extends State<ExceededClientsPage> {
  late final ExceededClientsCubit clientsAcceptCubit;

  @override
  void initState() {
    clientsAcceptCubit = context.read<ExceededClientsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await clientsAcceptCubit.getExceededClients(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          context: context, title: 'تحويلات عملاء التسويق لميداني'),
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
              child: ExceededClientsCount(),
            ),
            15.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<ExceededClientsCubit, ExceededClientsState>(
                  buildWhen: (previous, current) {
                    return previous.getExceededClientsStatus !=
                            current.getExceededClientsStatus &&
                        clientsAcceptCubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    if (state.getExceededClientsStatus.isLoading()) {
                      return AppLoader();
                    } else if (state.getExceededClientsStatus.isFailed()) {
                      return CustomErrorWidget(
                        onPressed: () => clientsAcceptCubit.getExceededClients(
                          fkCountry: AppConstants.currentCountry(context) ?? '',
                        ),
                        message: state.getExceededClientsStatus.error,
                      );
                    } else if (
                        // todo: use this when pagination is implemented
                        // clientsAcceptCubit.pageVariables.totalClientsCount == 0
                        clientsAcceptCubit
                            .pageVariables.filteredClientsList.isEmpty) {
                      return CustomErrorWidget(message: 'لا يوجد نتائج');
                    }
                    return ExceededClientsPaginatedList();
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
