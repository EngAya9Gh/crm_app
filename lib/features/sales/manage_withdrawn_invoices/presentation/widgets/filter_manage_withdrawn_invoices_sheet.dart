import 'package:crm_smart/core/common/models/location/branch_model.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/common/branches/presentation/pages/branch_searchable_drop_down.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as Intl;

import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/branches/presentation/manager/branches_cubit.dart';
import '../../../../mangement/manage_users/presentation/manager/users_cubit.dart';
import '../../../invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/manage_withdrawn_invoices_cubit.dart';

class FilterManageWithdrawnInvoicesSheet extends StatefulWidget {
  const FilterManageWithdrawnInvoicesSheet({
    Key? key,
  });

  @override
  State<FilterManageWithdrawnInvoicesSheet> createState() =>
      _FilterManageWithdrawnInvoicesSheetState();
}

class _FilterManageWithdrawnInvoicesSheetState
    extends State<FilterManageWithdrawnInvoicesSheet> {
  late final ManageWithdrawnInvoicesCubit _cubit;
  late final BranchesCubit _branchCubit;
  late final UsersCubit userCubit;
  final ValueNotifier<UserEntity?> selectedUserSales = ValueNotifier(null);

  @override
  void initState() {
    _cubit = context.read<ManageWithdrawnInvoicesCubit>();
    userCubit = context.read<UsersCubit>();
    _branchCubit = context.read<BranchesCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _cubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _cubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            CustomDropDown<WithdrawalInvoiceStatusEnum>(
              hint: 'الحالة',
              items: WithdrawalInvoiceStatusEnum.values,
              compareFn: (item, selectedItem) =>
                  item.index == selectedItem.index,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.statusNotifier.value,
              onChanged: (status) {
                _cubit.filterEntity.statusNotifier.value = status!;
              },
              height: 270.scaleHeight,
            ),
            10.height,
            BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
              builder: (context, state) {
                return CustomSearchableDropDown<UserEntity>(
                  hint: 'موظف المبيعات',
                  items: state.getUsersState.data ?? [],
                  itemAsString: (u) => u!.name,
                  selectedItem: _cubit.filterEntity.selectedUserSales.value,
                  onChanged: (data) {
                    _cubit.filterEntity.selectedUserSales.value = data;
                  },
                  filterFn: (user, filter) {
                    return user.name.contains(filter);
                  },
                  compareFn: (user, value) {
                    return user.name == value.name;
                  },
                );
              },
            ),
            10.height,
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomDateTimePicker(
            //         dateTimeType: DateTimeEnum.date,
            //         hintText: 'تاريخ بداية القبول',
            //         isStartFromNow: true,
            //         formatDate: Intl.DateFormat('yyyy-MM-dd'),
            //         isRequired: true,
            //         dateTimeController:
            //             _cubit.filterEntity.dateApproveFromController,
            //         style2: true,
            //         onDateChange: (p0, p1) {
            //           // _taskCubit.onChangeStartDate(p0);
            //         },
            //       ),
            //     ),
            //     15.width,
            //     Expanded(
            //       child: CustomDateTimePicker(
            //         dateTimeType: DateTimeEnum.date,
            //         hintText: 'تاريخ نهاية القبول',
            //         isStartFromNow: true,
            //         isRequired: true,
            //         formatDate: Intl.DateFormat('yyyy-MM-dd'),
            //         dateTimeController:
            //             _cubit.filterEntity.dateApproveToController,
            //         style2: true,
            //         onDateChange: (p0, p1) {
            //           // _deadLineDateController.text = Intl.DateFormat('dd MMM yyyy HH:mm:ss').format(p0);
            //           // _taskCubit.onChangeDeadLineDate(p0);
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 2),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText('تاريخ الموافقة'),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController:
                        _cubit.filterEntity.dateApproveFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController:
                        _cubit.filterEntity.dateApproveToController,
                    style2: true,
                  ),
                ),
              ],
            ),
            10.height,
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomDateTimePicker(
            //         dateTimeType: DateTimeEnum.date,
            //         hintText: 'تاريخ بداية الانسحاب',
            //         isStartFromNow: true,
            //         formatDate: Intl.DateFormat('yyyy-MM-dd'),
            //         isRequired: true,
            //         dateTimeController:
            //             _cubit.filterEntity.dateWithdrawnFromController,
            //         style2: true,
            //         onDateChange: (p0, p1) {
            //           // _taskCubit.onChangeStartDate(p0);
            //         },
            //       ),
            //     ),
            //     15.width,
            //     Expanded(
            //       child: CustomDateTimePicker(
            //         dateTimeType: DateTimeEnum.date,
            //         hintText: 'تاريخ نهاية الانسحاب',
            //         isStartFromNow: true,
            //         isRequired: true,
            //         formatDate: Intl.DateFormat('yyyy-MM-dd'),
            //         dateTimeController:
            //             _cubit.filterEntity.dateWithdrawnToController,
            //         style2: true,
            //         onDateChange: (p0, p1) {
            //           // _deadLineDateController.text = Intl.DateFormat('dd MMM yyyy HH:mm:ss').format(p0);
            //           // _taskCubit.onChangeDeadLineDate(p0);
            //         },
            //       ),
            //     ),
            //   ],
            // ),

            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 2),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText('تاريخ الانسحاب'),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController:
                        _cubit.filterEntity.dateWithdrawnFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController:
                        _cubit.filterEntity.dateWithdrawnToController,
                    style2: true,
                  ),
                ),
              ],
            ),
            10.height,
            Consumer<UserProvider>(
              builder: (context, value, child) {
                return CustomSearchableDropDown<UserModel>(
                  hint: 'الموظف الذي قام بالانسحاب',
                  items: value.allUsers,
                  itemAsString: (u) => u!.name,
                  selectedItem: _cubit.filterEntity.withDrawnUser.value,
                  onChanged: (data) {
                    _cubit.filterEntity.withDrawnUser.value = data;
                  },
                  filterFn: (user, filter) {
                    return user.name.contains(filter);
                  },
                  compareFn: (user, value) {
                    return user.name == value.name;
                  },
                );
              },
            ),
            10.height,
            BlocBuilder<BranchesCubit, BranchesState>(
              builder: (context, state) {
                return CustomMultiSelectionDropdown<BranchModel>(
                  hint: 'فرع',
                  items: _branchCubit.branchesList,
                  selectedItems: _cubit.filterEntity.branchNotifier.value,
                  itemAsString: (item) => item?.branchName ?? '',
                  compareFn: (item, selectedItem) =>
                      item.branchId == selectedItem.branchId,
                  onSave: (value) {
                    _cubit.filterEntity.branchNotifier.value = value;
                  },
                  // selectedBranchId: _cubit.filterEntity.branchNotifier.value?.branchId,
                  // onSelected: (branch) {
                  //   return _cubit.filterEntity.branchNotifier.value = branch;
                  // },
                );
              },
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
    _cubit.getManageWithdrawnInvoices();
    AppNavigator.pop(result: true);
  }
}
