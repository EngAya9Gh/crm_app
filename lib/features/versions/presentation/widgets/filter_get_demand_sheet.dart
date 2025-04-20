import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_demands_usecase.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../view_model/user_vm_provider.dart';

class FilterGetDemandSheet extends StatefulWidget {
  const FilterGetDemandSheet({
    Key? key,
    required this.bloc,
  });
  final VersionsBloc bloc;
  @override
  State<FilterGetDemandSheet> createState() => _FilterGetDemandSheetState();
}

class _FilterGetDemandSheetState extends State<FilterGetDemandSheet> {
  @override
  void initState() {
    Provider.of<manage_provider>(context, listen: false).getManages();
    Provider.of<UserProvider>(context, listen: false).getUsersVm();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListenableBuilder(
          listenable: Listenable.merge(widget.bloc.filterEntity.listenables()),
          builder: (context, child) => Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AppTextButton(
                  text: "إعادة الافتراضي",
                  onPressed: widget.bloc.filterEntity.checkIfFilterIsNotEmpty()
                      ? () {
                          widget.bloc.filterEntity.clearFilters();
                          _filterAndCloseDialog();
                        }
                      : null,
                  appButtonStyle: AppButtonStyle.secondary,
                ),
              ),
              CustomDropDown<DemandVersionStatus>(
                hint: 'الحالة',
                items: DemandVersionStatus.values,
                compareFn: (item, selectedItem) => item.index == selectedItem.index,
                itemAsString: (item) => item!.text,
                selectedItem: widget.bloc.filterEntity.selectedStatus.value,
                onChanged: (status) {
                  widget.bloc.filterEntity.selectedStatus.value = status!;
                },
                height: 270.scaleHeight,
              ),
              10.height,
              Consumer<UserProvider>(builder: (context, value, child) {
                if (value.isLoading) return AppLoader();
                return CustomSearchableDropDown<UserModel>(
                  hint: 'الموظف',
                  items: value.allUsers,
                  itemAsString: (u) => u!.name,
                  selectedItem: widget.bloc.filterEntity.selectedUsers.value,
                  onChanged: (data) {
                    widget.bloc.filterEntity.selectedUsers.value = data;
                  },
                  filterFn: (user, filter) {
                    return user.name.contains(filter);
                  },
                  compareFn: (user, value) {
                    return user.name == value.name;
                  },
                );
              }),
              10.height,
              Consumer<manage_provider>(builder: (context, value, child) {
                if (value.isLoading) return AppLoader();
                return CustomSearchableDropDown<ManageModel>(
                  hint: 'الادارة',
                  items: List.of(value.listtext)..insert(0, ManageModel(idMange: '0', name_mange: 'عام', fk_country: '0')),
                  itemAsString: (u) => u!.name_mange,
                  selectedItem: widget.bloc.filterEntity.selectedManagment.value,
                  onChanged: (data) {
                    widget.bloc.filterEntity.selectedManagment.value = data;
                  },
                  filterFn: (user, filter) {
                    return user.name_mange.contains(filter);
                  },
                  compareFn: (user, value) {
                    return user.name_mange == value.name_mange;
                  },
                );
              }),
              10.height,
              Row(
                children: [
                  Flexible(
                    child: CustomDateTimePicker(
                      hintText: 'من تاريخ',
                      dateTimeType: DateTimeEnum.date,
                      dateTimeController: widget.bloc.filterEntity.fromController,
                      style2: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: CustomDateTimePicker(
                      hintText: 'إلى تاريخ',
                      dateTimeType: DateTimeEnum.date,
                      dateTimeController: widget.bloc.filterEntity.toController,
                      style2: true,
                    ),
                  ),
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
      ),
    );
  }

  void _filterAndCloseDialog() {
    var params = GetDemandParams(
      page: 1,
      from: widget.bloc.filterEntity.fromController.text,
      to: widget.bloc.filterEntity.toController.text,
      status: widget.bloc.filterEntity.selectedStatus.value?.text,
      user_id: (widget.bloc.filterEntity.selectedUsers.value?.id != null) ? int.tryParse(widget.bloc.filterEntity.selectedUsers.value!.id) : null,
      management_id: (widget.bloc.filterEntity.selectedManagment.value?.idMange != null)
          ? int.tryParse(widget.bloc.filterEntity.selectedManagment.value!.idMange)
          : null,
    );
    widget.bloc.add(GetDenmadsEvent(params: params));
    AppNavigator.pop(result: true);
  }
}
