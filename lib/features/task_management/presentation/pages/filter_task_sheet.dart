import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

import '../../../../common/helpers/helper_functions.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/regoin_model.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/manage_provider.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../manage_users/presentation/manager/users_cubit.dart';

class FilterTaskSheet extends StatefulWidget {
  const FilterTaskSheet({Key? key}) : super(key: key);

  @override
  State<FilterTaskSheet> createState() => _FilterTaskSheetState();
}

class _FilterTaskSheetState extends State<FilterTaskSheet> {
  late TextEditingController _fromDateController;
  late TextEditingController _toDateController;
  late PrivilegeCubit _privilegeCubit;
  late TaskCubit _taskCubit;
  late UsersCubit _usersCubit;

  @override
  void initState() {
    _taskCubit = GetIt.I<TaskCubit>();
    _usersCubit = GetIt.I<UsersCubit>()..getAllUsers();

    _fromDateController = TextEditingController();
    _toDateController = TextEditingController();
    _privilegeCubit = GetIt.I<PrivilegeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RegionProvider>()
        ..changeValuser(null, true)
        ..getRegions();
      context.read<manage_provider>()
        ..changevalue(null)
        ..getmanage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _taskCubit,
      child: BlocProvider.value(
        value: _usersCubit,
        child: Padding(
          padding: HWEdgeInsets.symmetric(horizontal: 15.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return BlocBuilder<PrivilegeCubit, PrivilegeState>(
                  builder: (context, privilegeState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        40.verticalSpace,
                        if (!_privilegeCubit.checkPrivilege('159')) ...{
                          Row(
                            children: [
                              Expanded(
                                child: Consumer<manage_provider>(
                                  builder: (context, manageList, child) {
                                    final list = manageList.listtext;
                                    return AppDropdownButtonFormField<ManageModel, String>(
                                      items: list,
                                      onChange: (value) => manageList.changevalue(value ?? ''),
                                      hint: "من القسم",
                                      itemAsValue: (ManageModel? item) => item!.idmange,
                                      itemAsString: (item) => item!.name_mange,
                                      value: manageList.selectedValuemanag,
                                      validator: HelperFunctions.instance.requiredFiled,
                                    );
                                  },
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: Consumer<manage_provider>(
                                  builder: (context, manageList, child) {
                                    final list = manageList.listtext;
                                    return AppDropdownButtonFormField<ManageModel, String>(
                                      items: list,
                                      onChange: (value) => manageList.changevalue(value ?? ''),
                                      hint: "إلى القسم",
                                      itemAsValue: (ManageModel? item) => item!.idmange,
                                      itemAsString: (item) => item!.name_mange,
                                      value: manageList.selectedValuemanag,
                                      validator: HelperFunctions.instance.requiredFiled,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                        },
                        if (_privilegeCubit.checkPrivilege('160'))
                          Consumer<manage_provider>(
                            builder: (context, manageList, child) {
                              final list = manageList.listtext;
                              return AppDropdownButtonFormField<ManageModel, String>(
                                items: list,
                                onChange: (value) => manageList.changevalue(value ?? ''),
                                hint: "من القسم",
                                itemAsValue: (ManageModel? item) => item!.idmange,
                                itemAsString: (item) => item!.name_mange,
                                value: manageList.selectedValuemanag,
                                validator: HelperFunctions.instance.requiredFiled,
                              );
                            },
                          ),
                        20.verticalSpace,
                        if (!_privilegeCubit.checkPrivilege('162')) ...{
                          Row(
                            children: [
                              Expanded(
                                child: Consumer<RegionProvider>(
                                  builder: (context, cart, child) {
                                    final list = cart.listRegion;
                                    return AppDropdownButtonFormField<RegionModel, String>(
                                      items: list,
                                      onChange: cart.changeVal,
                                      hint: "من الفرع",
                                      itemAsValue: (RegionModel? item) => item!.regionId,
                                      itemAsString: (item) => item!.regionName,
                                      value: cart.selectedRegionId,
                                      validator: HelperFunctions.instance.requiredFiled,
                                    );
                                  },
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: Consumer<RegionProvider>(
                                  builder: (context, cart, child) {
                                    final list = cart.listRegion;
                                    return AppDropdownButtonFormField<RegionModel, String>(
                                      items: list,
                                      onChange: cart.changeVal,
                                      hint: "إلى الفرع",
                                      itemAsValue: (RegionModel? item) => item!.regionId,
                                      itemAsString: (item) => item!.regionName,
                                      value: cart.selectedRegionId,
                                      validator: HelperFunctions.instance.requiredFiled,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                        },
                        if (_privilegeCubit.checkPrivilege('161'))
                          Consumer<RegionProvider>(
                            builder: (context, cart, child) {
                              final list = cart.listRegion;
                              return AppDropdownButtonFormField<RegionModel, String>(
                                items: list,
                                onChange: cart.changeVal,
                                hint: "من الفرع",
                                itemAsValue: (RegionModel? item) => item!.regionId,
                                itemAsString: (item) => item!.regionName,
                                value: cart.selectedRegionId,
                                validator: HelperFunctions.instance.requiredFiled,
                              );
                            },
                          ),
                        20.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: state.filterFromDate ??DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(Duration(days: 365)),
                                  );
                                  if (date == null) return;

                                  _fromDateController.text = Intl.DateFormat('dd MMM yyyy').format(date);
                                  _taskCubit.onChangeFilterFromDate(date);
                                },
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: AppTextField(
                                    labelText: "من تاريخ",
                                    maxLines: 1,
                                    validator: HelperFunctions.instance.requiredFiled,
                                    readOnly: true,
                                    controller: _fromDateController,
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            20.horizontalSpace,
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate: state.filterToDate ?? DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(Duration(days: 365)),
                                  );

                                  if (date == null) return;

                                  _toDateController.text = Intl.DateFormat('dd MMM yyyy').format(date);
                                  _taskCubit.onChangeToDate(date);
                                },
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: AppTextField(
                                    labelText: "إلى تاريخ",
                                    maxLines: 1,
                                    validator: HelperFunctions.instance.requiredFiled,
                                    readOnly: true,
                                    controller: _toDateController,
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: BlocBuilder<UsersCubit, UsersState>(
                                builder: (context, userState) {
                                  return DropdownSearch<UserModel>(
                                    mode: Mode.DIALOG,
                                    filterFn: (user, filter) => user!.nameUser!.contains(filter!),
                                    compareFn: (item, selectedItem) => item?.idUser == selectedItem?.idUser,
                                    items: userState.allUsersList.getDataWhenSuccess ?? [],
                                    itemAsString: (u) => u!.userAsString(),
                                    onChanged: (data) {
                                      _taskCubit.onChangeFilterAssignFrom(data);
                                    },
                                    selectedItem: state.filterAssignFrom,
                                    showSearchBox: true,
                                    dropdownSearchDecoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'اسناد من',
                                      hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
                                      contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      suffixIcon: userState.allUsersList.isLoading
                                          ? CupertinoActivityIndicator()
                                          : userState.allUsersList.isError
                                              ? IconButton(
                                                  onPressed: () => _usersCubit.getAllUsers(), icon: Icon(Icons.refresh))
                                              : null,
                                    ),
                                    // InputDecoration(border: InputBorder.none),
                                  );
                                },
                              ),
                            ),
                            20.horizontalSpace,
                            Expanded(
                              child: BlocBuilder<UsersCubit, UsersState>(
                                builder: (context, userState) {
                                  return DropdownSearch<UserModel>(
                                    mode: Mode.DIALOG,
                                    filterFn: (user, filter) => user!.nameUser!.contains(filter!),
                                    compareFn: (item, selectedItem) => item?.idUser == selectedItem?.idUser,
                                    items: userState.allUsersList.getDataWhenSuccess ?? [],
                                    itemAsString: (u) => u!.userAsString(),
                                    onChanged: (data) {
                                      _taskCubit.onChangeFilterAssignTo(data);
                                    },
                                    selectedItem: state.filterAssignTo,
                                    showSearchBox: true,
                                    dropdownSearchDecoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'اسناد إلى',
                                      hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
                                      contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      suffixIcon: userState.allUsersList.isLoading
                                          ? CupertinoActivityIndicator()
                                          : userState.allUsersList.isError
                                              ? IconButton(
                                                  onPressed: () => _usersCubit.getAllUsers(), icon: Icon(Icons.refresh))
                                              : null,
                                    ),
                                    // InputDecoration(border: InputBorder.none),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // 20.verticalSpace,
                        // AppDropdownButtonFormField<TaskStatus, TaskStatus>(
                        //   items: TaskStatus.values,
                        //   onChange: (value) {},
                        //   hint: "الحالة",
                        //   itemAsValue: (TaskStatus? item) => item,
                        //   itemAsString: (item) => item!.name,
                        //   value: null,
                        // ),
                        20.verticalSpace,

                        SizedBox(
                          width: double.infinity,
                          child: AppElevatedButton(
                            isLoading: state.tasksState.isLoading,
                            onPressed: () {
                              _taskCubit.getTasks(
                                onSuccess: () => Navigator.pop(context),
                              );
                            },
                            text: 'فلترة',
                          ),
                        ),
                        40.verticalSpace,
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
