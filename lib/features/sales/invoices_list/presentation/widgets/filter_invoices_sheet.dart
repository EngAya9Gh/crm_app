import 'dart:ui' as myui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
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
  late final InvoicesSectionCubit _invoicesTabCubit;
  late final PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _invoicesTabCubit = context.read<InvoicesSectionCubit>();
    _invoicesTabCubit.filtersEntity.savePreviousState();
    _privilegeCubit = context.read<PrivilegeCubit>();

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
                  _invoicesTabCubit.filtersEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _invoicesTabCubit.filtersEntity
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _invoicesTabCubit.clearFilters();
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
              selectedItem: _invoicesTabCubit
                  .filtersEntity.filterInvoicesSellerType.value,
              onChanged: (value) async {
                _invoicesTabCubit.filtersEntity.filterInvoicesSellerType.value =
                    value;
                _invoicesTabCubit.getUsers();
              },
            ),
            ListenableBuilder(
              listenable:
                  _invoicesTabCubit.filtersEntity.filterInvoicesSellerType,
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
              CustomSearchableDropDown(
                hint: 'الفرع',
                items: context.read<RegionProvider>().listRegionFilter,
                selectedItem:
                    _invoicesTabCubit.filtersEntity.filterSelectedRegion.value,
                itemAsString: (item) => item!.regionName,
                filterFn: (item, query) {
                  return item.regionName.contains(query);
                },
                onChanged: (region) {
                  if (region == null) return;
                  _invoicesTabCubit.filtersEntity.filterSelectedRegion.value =
                      region;
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
                        _invoicesTabCubit.filtersEntity.dateFromController,
                    style2: true,
                  ),
                ),
                10.width,
                Expanded(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController:
                        _invoicesTabCubit.filtersEntity.dateToController,
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
                      selectedItem: _invoicesTabCubit
                          .filtersEntity.filterClientStatus.value,
                      onChanged: (value) async {
                        _invoicesTabCubit
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
                      selectedItem: _invoicesTabCubit
                          .filtersEntity.filterDeviceState.value,
                      onChanged: (value) async {
                        _invoicesTabCubit
                            .filtersEntity.filterDeviceState.value = value;
                      },
                      height: 100.h,
                    ),
                  ),
                ],
              ],
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
    if ((_invoicesTabCubit.filtersEntity.filterInvoicesSellerType.value
                ?.isAgentOrDistributor() ??
            false) ||
        (_invoicesTabCubit.filtersEntity.filterInvoicesSellerType.value
                ?.isParticipate() ??
            false) ||
        (_invoicesTabCubit.filtersEntity.filterInvoicesSellerType.value
                ?.isEmployee() ??
            false)) {
      return true;
    }
    return false;
  }
}
