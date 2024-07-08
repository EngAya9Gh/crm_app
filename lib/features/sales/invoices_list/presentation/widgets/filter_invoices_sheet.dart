import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/invoices_section_cubit.dart';

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
    _privilegeCubit = context.read<PrivilegeCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myui.TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            CustomDropDown<SellerTypeEnum>(
              hint: "النوع",
              items: SellerTypeEnum.values,
              itemAsString: (item) => item!.value,
              height: 160.h,
              selectedItem: _invoicesTabCubit.filterInvoicesSellerType.value,
              onChanged: (value) async {
                _invoicesTabCubit.filterInvoicesSellerType.value = value;
                _invoicesTabCubit.getUsers();
              },
            ),
            ListenableBuilder(
              listenable: _invoicesTabCubit.filterInvoicesSellerType,
              builder: (context, child) {
                if (_isAgentOrParticipate()) {
                  return BlocBuilder<InvoicesSectionCubit,
                      InvoicesSectionState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: _UsersDropDown(),
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
                selectedItem: _invoicesTabCubit.filterSelectedRegion.value,
                itemAsString: (item) => item!.regionName,
                filterFn: (item, query) {
                  return item.regionName.contains(query);
                },
                onChanged: (region) {
                  if (region == null) return;
                  _invoicesTabCubit.filterSelectedRegion.value = region;
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
                    dateTimeController: _invoicesTabCubit.dateFromController,
                    style2: true,
                  ),
                ),
                10.width,
                Expanded(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _invoicesTabCubit.dateToController,
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
                      selectedItem: _invoicesTabCubit.filterClientStatus.value,
                      onChanged: (value) async {
                        _invoicesTabCubit.filterClientStatus.value = value;
                      },
                      height: 70.h,
                    ),
                  ),
                ],
                if (_privilegeCubit.checkPrivilege('193')) ...[
                  10.width,
                  Expanded(
                    child: CustomDropDown(
                      hint: 'الأجهزة',
                      items: DevicesStateFilterEnum.values,
                      itemAsString: (item) => item!.value,
                      selectedItem: _invoicesTabCubit.filterDeviceState.value,
                      onChanged: (value) async {
                        _invoicesTabCubit.filterDeviceState.value = value;
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
              onPressed: () {
                widget.onFilter();
                AppNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isAgentOrParticipate() {
    if ((_invoicesTabCubit.filterInvoicesSellerType.value
                ?.isAgentOrDistributor() ??
            false) ||
        (_invoicesTabCubit.filterInvoicesSellerType.value?.isParticipate() ??
            false)) {
      return true;
    }
    return false;
  }
}

class _UsersDropDown extends StatelessWidget {
  const _UsersDropDown();

  @override
  Widget build(BuildContext context) {
    final _invoicesTabCubit = context.read<InvoicesSectionCubit>();
    return BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
      builder: (context, state) {
        if (state.getUsersState.isLoading()) {
          return CustomLoadingIndicator();
        } else if (state.getUsersState.isFailed()) {
          return CustomErrorWidget(
            message: "حدث خطأ أثناء تحميل البيانات",
            onPressed: () => _invoicesTabCubit.getUsers(),
          );
        }
        return CustomSearchableDropDown<UserEntity>(
          hint: _invoicesTabCubit.filterInvoicesSellerType.value?.value ?? '',
          items: state.getUsersState.data ?? [],
          selectedItem: _invoicesTabCubit.filterSelectedUser.value,
          itemAsString: (item) => item!.name,
          filterFn: (item, query) {
            return item.name.contains(query);
          },
          onChanged: (user) {
            if (user == null) return;
            _invoicesTabCubit.filterSelectedUser.value = user;
          },
        );
      },
    );
  }
}
