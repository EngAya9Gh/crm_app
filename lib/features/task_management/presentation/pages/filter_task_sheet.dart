import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/managmodel.dart';
import '../../../../provider/manage_provider.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../mangement/manage_users/presentation/manager/users_cubit.dart';
import '../../data/models/user_region_department.dart';
import '../manager/task_cubit.dart';

class FilterTaskSheet extends StatefulWidget {
  const FilterTaskSheet({super.key});

  @override
  State<FilterTaskSheet> createState() => _FilterTaskSheetState();
}

class _FilterTaskSheetState extends State<FilterTaskSheet> {
  late TextEditingController _fromDateController;
  late TextEditingController _toDateController;
  late TaskCubit _taskCubit;
  late UsersCubit _usersCubit;
  late PrivilegesCubit privilegeBloc;
  String? regionId;
  String? departmentId;

  @override
  void initState() {
    privilegeBloc = getIt<PrivilegesCubit>();
    final currentUser = context.read<UserProvider>().currentUser;
    departmentId = privilegeBloc.checkPrivilege('159')
        ? currentUser.typeAdministration
        : null;
    regionId =
        privilegeBloc.checkPrivilege('162') ? currentUser.fkRegoin : null;

    _taskCubit = getIt<TaskCubit>();
    _usersCubit = context.read<UsersCubit>()
      ..getUsersByDepartmentAndRegion(
          regionId: regionId, departmentId: departmentId);

    _fromDateController = TextEditingController();
    _toDateController = TextEditingController();
    if (_taskCubit.state.filterFromDate != null) {
      _fromDateController.text = Intl.DateFormat('dd MMM yyyy')
          .format(_taskCubit.state.filterFromDate!);
    }
    if (_taskCubit.state.filterToDate != null) {
      _toDateController.text =
          Intl.DateFormat('dd MMM yyyy').format(_taskCubit.state.filterToDate!);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RegionProvider>()
        ..changeValuser(null, true)
        ..getRegions();
      context.read<manage_provider>()
        ..changevalue(null)
        ..getManages();
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
                return BlocBuilder<PrivilegesCubit, PrivilegesState>(
                  builder: (context, privilegeState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            AppTextButton(
                              text: 'إعادة الافتراضي',
                              onPressed: state.tasksState.isLoading
                                  ? null
                                  : () => _taskCubit.resetFilter(
                                      () => Navigator.pop(context)),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        if (privilegeBloc.checkPrivilege('160')) ...{
                          Row(
                            children: [
                              Expanded(
                                child: Consumer<manage_provider>(
                                  builder: (context, manageList, child) {
                                    final list = manageList.listtext;
                                    return AppDropdownButtonFormField<
                                        ManageModel, ManageModel>(
                                      items: list,
                                      onChange: (value) => _taskCubit
                                          .onChangeDepartmentFrom(value),
                                      hint: "من القسم",
                                      itemAsValue: (ManageModel? item) => item,
                                      itemAsString: (item) => item!.name_mange,
                                      value: state.departmentFrom,
                                    );
                                  },
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: Consumer<manage_provider>(
                                  builder: (context, manageList, child) {
                                    final list = manageList.listtext;
                                    return AppDropdownButtonFormField<
                                        ManageModel, ManageModel>(
                                      items: list,
                                      onChange: (value) => _taskCubit
                                          .onChangeDepartmentTo(value),
                                      hint: "إلى القسم",
                                      itemAsValue: (ManageModel? item) => item,
                                      itemAsString: (item) => item!.name_mange,
                                      value: state.departmentTo,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                        },
                        if (privilegeBloc.checkPrivilege('161')) ...{
                          Row(
                            children: [
                              Expanded(
                                child: Consumer<RegionProvider>(
                                  builder: (context, cart, child) {
                                    final list = cart.listRegion;
                                    return AppDropdownButtonFormField<
                                        BranchModel, BranchModel>(
                                      items: list,
                                      onChange: (value) =>
                                          _taskCubit.onChangeRegionFrom(value),
                                      hint: "من الفرع",
                                      itemAsValue: (BranchModel? item) => item,
                                      itemAsString: (item) => item!.branchName,
                                      value: state.regionFrom,
                                    );
                                  },
                                ),
                              ),
                              20.horizontalSpace,
                              Expanded(
                                child: Consumer<RegionProvider>(
                                  builder: (context, cart, child) {
                                    final list = cart.listRegion;

                                    return AppDropdownButtonFormField<
                                        BranchModel, BranchModel>(
                                      items: list,
                                      onChange: (value) =>
                                          _taskCubit.onChangeRegionTo(value),
                                      hint: "إلى الفرع",
                                      itemAsValue: (BranchModel? item) => item,
                                      itemAsString: (item) => item!.branchName,
                                      value: state.regionTo,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                        },
                        // if (_privilegeCubit.checkPrivilege('161'))
                        //   Consumer<RegionProvider>(
                        //     builder: (context, cart, child) {
                        //       final list = cart.listRegion;
                        //       return AppDropdownButtonFormField<RegionModel, String>(
                        //         items: list,
                        //         onChange: cart.changeVal,
                        //         hint: "من الفرع",
                        //         itemAsValue: (RegionModel? item) => item!.regionId,
                        //         itemAsString: (item) => item!.regionName,
                        //         value: cart.selectedRegionId,
                        //         validator: InputValidator.requiredFiled,
                        //       );
                        //     },
                        //   ),
                        // 20.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        state.filterFromDate ?? DateTime.now(),
                                    firstDate: DateTime.now()
                                        .subtract(Duration(days: 365 * 2)),
                                    lastDate:
                                        DateTime.now().add(Duration(days: 365)),
                                  );
                                  if (date == null) return;

                                  _fromDateController.text =
                                      Intl.DateFormat('dd MMM yyyy')
                                          .format(date);
                                  _taskCubit.onChangeFilterFromDate(date);
                                },
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: AppTextField(
                                    labelText: "من تاريخ",
                                    maxLines: 1,
                                    validator: InputValidator.requiredFiled,
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
                                    initialDate:
                                        state.filterToDate ?? DateTime.now(),
                                    firstDate: DateTime.now()
                                        .subtract(Duration(days: 365 * 2)),
                                    lastDate:
                                        DateTime.now().add(Duration(days: 365)),
                                  );

                                  if (date == null) return;

                                  _toDateController.text =
                                      Intl.DateFormat('dd MMM yyyy')
                                          .format(date);
                                  _taskCubit.onChangeToDate(date);
                                },
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: AppTextField(
                                    labelText: "إلى تاريخ",
                                    maxLines: 1,
                                    validator: InputValidator.requiredFiled,
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
                                  return CustomSearchableDropDown<
                                      UserRegionDepartment>(
                                    hint: 'اسناد من',
                                    items: userState.usersByDepartmentAndRegion
                                            .getDataWhenSuccess ??
                                        [],
                                    itemAsString: (u) => u!.nameUser!,
                                    onChanged: (data) {
                                      _taskCubit.onChangeFilterAssignFrom(data);
                                    },
                                    selectedItem: state.filterAssignFrom,
                                    filterFn: (user, filter) =>
                                        user.nameUser!.contains(filter),
                                  );
                                },
                              ),
                            ),
                            20.horizontalSpace,
                            Expanded(
                              child: BlocBuilder<UsersCubit, UsersState>(
                                builder: (context, userState) {
                                  return CustomSearchableDropDown<
                                      UserRegionDepartment>(
                                    hint: 'اسناد إلى',
                                    items: userState.usersByDepartmentAndRegion
                                            .getDataWhenSuccess ??
                                        [],
                                    itemAsString: (u) => u!.nameUser!,
                                    onChanged: (data) {
                                      _taskCubit.onChangeFilterAssignTo(data);
                                    },
                                    selectedItem: state.filterAssignTo,
                                    filterFn: (user, filter) =>
                                        user.nameUser!.contains(filter),
                                    compareFn: (item, selectedItem) =>
                                        item.idUser == selectedItem.idUser,
                                    buttonDecoration: AppStyles
                                        .roundedDropdownButtonDecoration(
                                      context: context,
                                      hintText: 'اسناد إلى',
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
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
