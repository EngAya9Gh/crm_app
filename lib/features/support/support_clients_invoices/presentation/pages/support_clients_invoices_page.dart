import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/support_clients_invoices_cubit.dart';
import '../widgets/filter_support_clients_invoices_sheet.dart';
import '../widgets/support_clients_invoices_count.dart';
import '../widgets/support_clients_invoices_paginated_list.dart';

class SupportClientsInvoicesPage extends StatefulWidget {
  const SupportClientsInvoicesPage({super.key});

  @override
  State<SupportClientsInvoicesPage> createState() =>
      _SupportClientsInvoicesState();
}

class _SupportClientsInvoicesState extends State<SupportClientsInvoicesPage> {
  late final SupportClientsInvoicesCubit _cubit;
  late final MainCityProvider _mainCityProvider;

  @override
  void initState() {
    _cubit = context.read<SupportClientsInvoicesCubit>()..init();
    _mainCityProvider = context.read<MainCityProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.loadCities(context);
      await _cubit.getSupportClientInvoices(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'فواتير العملاء'),
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
                      _cubit.getSupportClientInvoices(
                        fkCountry: AppConstants.currentCountry(context) ?? '',
                      );
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterSupportClientsInvoicesSheet(),
                    );
                    if (value != true) _cubit.returnToPreviousState();
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SupportClientsInvoicesCount(),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<SupportClientsInvoicesCubit,
                    SupportClientsInvoicesState>(
                  buildWhen: (previous, current) {
                    return previous.getSupportClientInvoicesStatus !=
                            current.getSupportClientInvoicesStatus &&
                        _cubit.pageVariables.isNewFilter;
                  },
                  builder: (context, state) {
                    return state.getSupportClientInvoicesStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => SupportClientsInvoicesPaginatedList(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getSupportClientInvoices(
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
