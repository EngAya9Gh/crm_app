import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/invoices_section_cubit.dart';
import '../widgets/filter_invoices_sheet.dart';
import '../widgets/invoices_paginated_list.dart';

class MobClientsInvoicesPage extends StatefulWidget {
  const MobClientsInvoicesPage({super.key});

  @override
  State<MobClientsInvoicesPage> createState() => _MobClientsInvoicesPageState();
}

class _MobClientsInvoicesPageState extends State<MobClientsInvoicesPage> {
  late final InvoicesSectionCubit _cubit;
  late final PrivilegesCubit _privilegeCubit;

  @override
  void initState() {
    super.initState();
    _privilegeCubit = context.read<PrivilegesCubit>();
    _cubit = context.read<InvoicesSectionCubit>()
      ..clearFilters()
      ..getInvoicesByPrivileges();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'فواتير العملاء',
        actions: [
          if (_privilegeCubit.checkPrivilege('288')) ...[
            Directionality(
              textDirection: TextDirection.rtl,
              child: BlocConsumer<InvoicesSectionCubit, InvoicesSectionState>(
                listenWhen: (previous, current) {
                  return previous.exportInvoicesToExcelStatus !=
                      current.exportInvoicesToExcelStatus;
                },
                listener: (context, state) {
                  if (state.exportInvoicesToExcelStatus.isFailed()) {
                    AppSnackbar.showSnakeBar(
                      state.exportInvoicesToExcelStatus.error,
                      color: ToastColorsEnum.error,
                    );
                  }
                },
                buildWhen: (previous, current) {
                  return previous.exportInvoicesToExcelStatus !=
                      current.exportInvoicesToExcelStatus;
                },
                builder: (context, state) {
                  if (state.exportInvoicesToExcelStatus.isLoading()) {
                    return AppLoader(color: AppColors.white);
                  }
                  return AppTextButton(
                    text: "تصدير إلى\nExcel",
                    onPressed: _cubit.exportInvoicesToExcel,
                    textStyle: AppStyles.textStyle.copyWith(
                      fontSize: (16.0).scaleFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.fontFamily1,
                      color: AppColors.white,
                    ),
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
          ],
        ],
      ),
      body: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.searchController,
                    hint: 'اسم المؤسسة، رقم الفاتورة...',
                    onChanged: (value) {
                      _cubit.searchController.text = value;
                      EasyDebounce.debounce(
                        'get_invoices-debounce',
                        Duration(milliseconds: 500),
                        () => _cubit.getInvoicesByPrivileges(),
                      );
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () {
                    AppBottomSheet.show(
                      context: context,
                      child: FilterInvoicesSheet(
                        onFilter: () {
                          _cubit.getInvoicesByPrivileges();
                        },
                      ),
                    ).then(
                      (value) {
                        if (value != true) {
                          _cubit.getPreviousState();
                        }
                      },
                    );
                  },
                ),
                SizedBox(width: 8),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<InvoicesSectionCubit,
                  InvoicesSectionState>(
                countSelector: (state) => _cubit.invoicesList.length,
                totalCount: (state) => _cubit.totalNumberOfInvoices,
              ),
            ),
            SizedBox(height: 10),
            InvoicesPaginatedList(),
          ],
        ),
      ),
    );
  }
}
