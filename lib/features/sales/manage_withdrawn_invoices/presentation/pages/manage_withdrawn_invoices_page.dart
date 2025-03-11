import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../common/branches/presentation/manager/branches_cubit.dart';
import '../../../clients/latest_clients_updates/presentation/widgets/custom_sorting_icon.dart';
import '../../../invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../manager/manage_withdrawn_invoices_cubit.dart';
import '../widgets/filter_manage_withdrawn_invoices_sheet.dart';
import '../widgets/manage_withdrawn_invoices_paginated_list.dart';

class ManageWithdrawnInvoicesPage extends StatefulWidget {
  const ManageWithdrawnInvoicesPage({super.key});

  @override
  State<ManageWithdrawnInvoicesPage> createState() =>
      _ManageWithdrawnInvoicesPageState();
}

class _ManageWithdrawnInvoicesPageState
    extends State<ManageWithdrawnInvoicesPage> {
  late final ManageWithdrawnInvoicesCubit _cubit;
  final ValueNotifier<bool> closeNotApply = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ManageWithdrawnInvoicesCubit>()..init();
    context.read<InvoicesSectionCubit>().getAllUsers();
    context
        .read<BranchesCubit>()
        .getBranchesByIdCountry(fkCountry: AppConstants.currentCountry);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<UserProvider>(context, listen: false).getAllUsers();
      await _cubit.getManageWithdrawnInvoices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'إدارة الفواتير المنسحبة'),
      body: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: _cubit.filterEntity.sortAsc,
                  builder: (context, value, child) => CustomSortingIcon(
                    activeColor: !value,
                    onTap: () {
                      _cubit.filterEntity.sortAsc.value =
                          !(_cubit.filterEntity.sortAsc.value);
                      _cubit.getManageWithdrawnInvoices();
                    },
                  ),
                ),
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.pageVariables.searchController,
                    onChanged: (value) {
                      _cubit.getManageWithdrawnInvoices(isDebounced: true);
                    },
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomFilterIcon(
                      onTap: () async {
                        final value = await AppBottomSheet.show(
                          context: context,
                          child: FilterManageWithdrawnInvoicesSheet(),
                        );
                        if (value != true) {
                          _cubit.returnToPreviousState();
                          closeNotApply.value = !closeNotApply.value;
                        }
                      },
                    ),
                    ValueListenableBuilder(
                      valueListenable: closeNotApply,
                      builder: (context, value, child) => ListenableBuilder(
                        listenable: Listenable.merge(
                          _cubit.filterEntity.listenables(),
                        ),
                        builder: (context, child) {
                          return _cubit.filterEntity.checkIfFilterIsNotEmpty()
                              ? Positioned(
                                  right: -5,
                                  top: -2,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor:
                                        AppColors.statusErrorActive,
                                  ),
                                )
                              : SizedBox.shrink();
                        },
                      ),
                    )
                  ],
                ),
                8.width,
              ],
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<ManageWithdrawnInvoicesCubit,
                  ManageWithdrawnInvoicesState>(
                label: "عدد الفواتير",
                countSelector: (state) => _cubit.pageVariables.allList.length,
                totalCount: (state) => _cubit.pageVariables.totalCount,
              ),
            ),
            10.height,
            Expanded(
              child: BlocBuilder<ManageWithdrawnInvoicesCubit,
                  ManageWithdrawnInvoicesState>(
                buildWhen: (previous, current) {
                  return previous.getManageWithdrawnInvoicesStatus !=
                          current.getManageWithdrawnInvoicesStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  return state.getManageWithdrawnInvoicesStatus.when(
                    success: (data) => ManageWithdrawnInvoicesPaginatedList(),
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getManageWithdrawnInvoices(),
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
