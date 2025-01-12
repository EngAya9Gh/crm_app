import 'dart:ui' as myui;

import 'package:crm_smart/core/common/enums/client/client_debt_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/invoices_section_cubit.dart';
import 'filter_users_drop_down.dart';

class FilterInvoicesSheet extends StatefulWidget {
  const FilterInvoicesSheet({
    Key? key,
    required this.onFilter,
  });

  final VoidCallback onFilter;

  @override
  State<FilterInvoicesSheet> createState() => _FilterInvoicesSheetState();
}

class _FilterInvoicesSheetState extends State<FilterInvoicesSheet> {
  late final InvoicesSectionCubit _invoicesSectionCubit;
  late final PrivilegesCubit _privilegeCubit;

  @override
  void initState() {
    _invoicesSectionCubit = context.read<InvoicesSectionCubit>();
    _invoicesSectionCubit.filtersEntity.savePreviousState();
    _privilegeCubit = context.read<PrivilegesCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myui.TextDirection.rtl,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _invoicesSectionCubit.filtersEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _invoicesSectionCubit.filtersEntity
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _invoicesSectionCubit.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            10.height,
            CustomDropDown<SellerTypeEnum>(
              hint: "النوع",
              items: SellerTypeEnum.values,
              itemAsString: (item) => item!.value,
              height: 160.h,
              selectedItem: _invoicesSectionCubit
                  .filtersEntity.filterInvoicesSellerType.value,
              onChanged: (value) async {
                _invoicesSectionCubit
                    .filtersEntity.filterInvoicesSellerType.value = value;
                _invoicesSectionCubit.getUsers();
              },
            ),
            ListenableBuilder(
              listenable:
                  _invoicesSectionCubit.filtersEntity.filterInvoicesSellerType,
              builder: (context, child) {
                if (_isAgentOrParticipateOrEmployee()) {
                  return BlocBuilder<InvoicesSectionCubit,
                      InvoicesSectionState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FilterUsersDropDown(),
                      );
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
            if (_privilegeCubit.checkPrivilege('1')) ...[
              10.height,
              BranchSearchableDropDown(
                hint: 'الفرع',

                selectedBranchId: _invoicesSectionCubit
                    .filtersEntity.filterSelectedRegion.value?.branchId,

                onSelected: (region) {
                  if (region == null) return;
                  _invoicesSectionCubit
                      .filtersEntity.filterSelectedRegion.value = region;
                },
              ),
            ],
            10.height,
            Row(
              children: [
                Expanded(
                  child: CustomDateTimePicker(
                    hintText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController:
                        _invoicesSectionCubit.filtersEntity.dateFromController,
                    style2: true,
                  ),
                ),
                10.width,
                Expanded(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController:
                        _invoicesSectionCubit.filtersEntity.dateToController,
                    style2: true,
                  ),
                ),
              ],
            ),
            10.height,
            Row(
              children: [
                if (_privilegeCubit.checkPrivilege('156')) ...[
                  Expanded(
                    child: CustomDropDown<ClientStatusEnum>(
                      hint: 'حالة الفاتورة',
                      items: ClientStatusEnum.values,
                      itemAsString: (item) => item!.value,
                      selectedItem: _invoicesSectionCubit
                          .filtersEntity.filterClientStatus.value,
                      onChanged: (value) async {
                        _invoicesSectionCubit
                            .filtersEntity.filterClientStatus.value = value;
                      },
                      height: 70.h,
                    ),
                  ),
                ],
                if (_privilegeCubit.checkPrivilege('193')) ...[
                  10.width,
                  Expanded(
                    child: CustomDropDown<DevicesStateFilterEnum>(
                      hint: 'الأجهزة',
                      items: DevicesStateFilterEnum.values,
                      itemAsString: (item) => item!.value,
                      selectedItem: _invoicesSectionCubit
                          .filtersEntity.filterDeviceState.value,
                      onChanged: (value) async {
                        _invoicesSectionCubit
                            .filtersEntity.filterDeviceState.value = value;
                      },
                      height: 100.h,
                    ),
                  ),
                ],
              ],
            ),
            20.height,
            CustomDropDown<TypeOfInvoice>(
              hint: 'نوع الفاتورة',
              items: TypeOfInvoice.values,
              itemAsString: (item) => item!.text,
              selectedItem: _invoicesSectionCubit
                  .filtersEntity.filterInvoiceType.value,
              onChanged: (value) async {
                _invoicesSectionCubit
                    .filtersEntity.filterInvoiceType.value = value;
              },
              height: 70.h,
            ),
            20.height,
            AppElevatedButton(
              text: 'فلترة',
              width: double.infinity,
              onPressed: () => _filterAndCloseDialog(),
            ),
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    widget.onFilter();
    AppNavigator.pop(result: true);
  }

  bool _isAgentOrParticipateOrEmployee() {
    if ((_invoicesSectionCubit.filtersEntity.filterInvoicesSellerType.value
                ?.isAgentOrDistributor() ??
            false) ||
        (_invoicesSectionCubit.filtersEntity.filterInvoicesSellerType.value
                ?.isParticipate() ??
            false) ||
        (_invoicesSectionCubit.filtersEntity.filterInvoicesSellerType.value
                ?.isEmployee() ??
            false)) {
      return true;
    }
    return false;
  }
}
