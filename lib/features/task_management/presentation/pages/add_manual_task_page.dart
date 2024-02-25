import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/di/di_container.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/regoin_model.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/manage_provider.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../manage_users/presentation/manager/users_cubit.dart';
import '../../data/models/user_region_department.dart';
import '../manager/task_cubit.dart';
import '../pages/add_task_page.dart';
import '../widgets/grouped_button.dart';

class AddManualTaskPage extends StatefulWidget {
  const AddManualTaskPage({
    Key? key,
    required this.list,
    this.clientId,
    this.invoiceId,
  }) : super(key: key);

  final String? clientId;
  final String? invoiceId;
  final List<PublicType> list;

  @override
  State<AddManualTaskPage> createState() => _AddManualTaskPageState();
}

class _AddManualTaskPageState extends State<AddManualTaskPage> {
  late PrivilegeCubit privilegeBloc;
  late TaskCubit _taskCubit;

  late UsersCubit _usersCubit;
  late TextEditingController _taskNameController;
  late TextEditingController _taskDescriptionController;
  late TextEditingController _deadLineDateController;
  late GlobalKey<FormState> _formKey;
  String? regionId;
  String? departmentId;
  late UserModel currentUser;
  PublicType? selectedPublicType;

  @override
  void initState() {
    privilegeBloc = getIt<PrivilegeCubit>();
    _taskCubit = getIt<TaskCubit>();

    currentUser = context.read<UserProvider>().currentUser;
    departmentId = privilegeBloc.checkPrivilege('174')
        ? '2'
        : privilegeBloc.checkPrivilege('169')
            ? null
            : privilegeBloc.checkPrivilege('168') ||
                    privilegeBloc.checkPrivilege('166')
                ? currentUser.typeAdministration
                : null;
    regionId =
        privilegeBloc.checkPrivilege('167') ? currentUser.fkRegoin : null;

    _usersCubit = getIt<UsersCubit>()
      ..storeCurrentUser(currentUser)
      ..getAllUsers()
      ..getUsersByDepartmentAndRegion(
          regionId: regionId, departmentId: departmentId);

    _taskNameController = TextEditingController();
    _deadLineDateController = TextEditingController();
    _taskDescriptionController = TextEditingController();

    _formKey = GlobalKey<FormState>();

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
      value: _usersCubit,
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
                insetPadding:
                    HWEdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Padding(
                  padding: HWEdgeInsets.symmetric(horizontal: 12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        20.verticalSpace,
                        Row(
                          children: [
                            SizedBox(width: 10),
                            InkWell(
                                onTap: Navigator.of(context).pop,
                                child: Icon(Icons.close)),
                            Spacer(),
                            Text('إضافة مهمة',
                                style: context.textTheme.titleMedium),
                            SizedBox(width: 30),
                            Spacer(),
                          ],
                        ),
                        25.verticalSpace,
                        AppDropdownButtonFormField<PublicType, PublicType>(
                          items: widget.list,
                          hint: "نوع المهمة*",
                          itemAsValue: (PublicType? item) => item,
                          itemAsString: (item) => item!.text,
                          validator: (value) {
                            if (value == null) {
                              return "هذا الحقل مطلوب.";
                            }
                            return null;
                          },
                          value: selectedPublicType,
                          onChange: (value) {
                            if (value == null) {
                              return;
                            }

                            selectedPublicType = value;
                            setState(() {});
                          },
                        ),
                        10.verticalSpace,
                        if (selectedPublicType == PublicType.other) ...[
                          AppTextField(
                            labelText: "عنوان المهمة*",
                            maxLines: 1,
                            validator: (value) {
                              if (selectedPublicType != PublicType.other)
                                return null;

                              if (value?.trim().isEmpty ?? true) {
                                return "هذا الحقل مطلوب.";
                              }
                              return null;
                            },
                            controller: _taskNameController,
                          ),
                          10.verticalSpace,
                        ],
                        AppTextField(
                          labelText: "وصف المهمة*",
                          validator: HelperFunctions.instance.requiredFiled,
                          minLines: 3,
                          contentPadding: HWEdgeInsets.all(15),
                          controller: _taskDescriptionController,
                        ),
                        10.verticalSpace,
                        if (privilegeBloc.checkPrivilege('171'))
                          InkWell(
                            onTap: () async {
                              final selectedTime = TimeOfDay.fromDateTime(
                                  state.deadLineDate ?? DateTime.now());

                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate:
                                    state.deadLineDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                              );

                              if (date == null) return;

                              final time = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              );
                              if (time != null) {
                                date = date.copyWith(
                                    hour: time.hour, minute: time.minute);
                              }

                              _deadLineDateController.text =
                                  Intl.DateFormat('dd MMM yyyy, HH:mm')
                                      .format(date);
                              _taskCubit.onChangeDeadLineDate(date);
                            },
                            child: IgnorePointer(
                              ignoring: true,
                              child: AppTextField(
                                labelText: "تاريخ التسليم*",
                                maxLines: 1,
                                validator:
                                    HelperFunctions.instance.requiredFiled,
                                readOnly: true,
                                controller: _deadLineDateController,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        10.verticalSpace,
                        GroupedButtons<AssignedToType>(
                          title: 'اسناد إلى',
                          buttons: assignedToList,
                          buttonTextBuilder: (selected, value, context) =>
                              value.text,
                          onSelected: (value, index, isSelected) {
                            _taskCubit.onChangeSelectedAssignedToType(value);
                          },
                          selectedIndex: state.selectedAssignedToType?.index,
                        ),
                        10.verticalSpace,
                        assignToEmployeeWidget(state),
                        assignToRegionWidget(state),
                        assignToDepartmentWidget(state),
                        25.verticalSpace,
                        BlocBuilder<TaskCubit, TaskState>(
                          builder: (context, state) {
                            return Builder(builder: (context) {
                              return SizedBox(
                                width: double.infinity,
                                child: AppTextButton(
                                  onPressed: () {
                                    final isValid =
                                        _formKey.currentState!.validate();
                                    if (!isValid) return;

                                    if (state.selectedAssignedToType == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: AppText(
                                          "من فضلك قم باختيار اسناد إلى",
                                          style: context
                                              .textTheme.bodyMedium!.sb!
                                              .copyWith(
                                                  color: context
                                                      .colorScheme.white),
                                        ),
                                        backgroundColor:
                                            context.colorScheme.error,
                                      ));
                                      return;
                                    }

                                    final selectedRegionId = context
                                        .read<RegionProvider>()
                                        .selectedRegionId;
                                    final selectedValueManage = context
                                        .read<manage_provider>()
                                        .selectedValuemanag;

                                    _taskCubit.addTaskAction(
                                      taskName:
                                          selectedPublicType == PublicType.other
                                              ? _taskNameController.text
                                              : selectedPublicType?.text,
                                      onSuccess: () => Navigator.pop(
                                          context,
                                          selectedPublicType ==
                                              PublicType.linkComment),
                                      regionId: selectedRegionId,
                                      departmentId: selectedValueManage,
                                      userId: currentUser.idUser!,
                                      description:
                                          _taskDescriptionController.text,
                                      mainTypeTask: 'ProcessManual',
                                      publicType: selectedPublicType,
                                      clientId: widget.clientId,
                                      invoiceId: widget.invoiceId,
                                    );
                                  },
                                  text: "حفظ",
                                  appButtonStyle: AppButtonStyle.secondary,
                                  isLoading: state.addTaskStatus.isLoading(),
                                ),
                              );
                            });
                          },
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<AssignedToType> get assignedToList {
    final list = List.of(AssignedToType.values);
    if (!privilegeBloc.checkPrivilege('167') &&
        !privilegeBloc.checkPrivilege('174')) {
      list.remove(AssignedToType.region);
    }
    if (!privilegeBloc.checkPrivilege('168') &&
        !privilegeBloc.checkPrivilege('169')) {
      list.remove(AssignedToType.department);
    }
    if (!privilegeBloc.checkPrivilege('166')) {
      list.remove(AssignedToType.employee);
    }

    return list;
  }

  Widget assignToEmployeeWidget(TaskState taskState) {
    if (taskState.selectedAssignedToType == AssignedToType.employee)
      return BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return DropdownSearch<UserRegionDepartment>(
            mode: Mode.DIALOG,
            filterFn: (user, filter) => user!.nameUser!.contains(filter!),
            compareFn: (item, selectedItem) =>
                item?.idUser == selectedItem?.idUser,
            items: state.usersByDepartmentAndRegion.getDataWhenSuccess ?? [],
            itemAsString: (u) => u!.nameUser!,
            onChanged: (data) {
              _taskCubit.onChangeAssignTo(data);
            },
            selectedItem: taskState.selectedAssignTo,
            showSearchBox: true,
            validator: (value) {
              if (taskState.selectedAssignedToType != AssignedToType.employee) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
            dropdownSearchDecoration: InputDecoration(
              isCollapsed: true,
              hintText: 'الموظف',
              hintStyle:
                  context.textTheme.titleSmall?.copyWith(color: Colors.grey),
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
              suffixIcon: state.usersByDepartmentAndRegion.isLoading
                  ? CupertinoActivityIndicator()
                  : state.usersByDepartmentAndRegion.isError
                      ? IconButton(
                          onPressed: () =>
                              _usersCubit.getUsersByDepartmentAndRegion(
                                  regionId: regionId,
                                  departmentId: departmentId),
                          icon: Icon(Icons.refresh))
                      : null,
            ),
            // InputDecoration(border: InputBorder.none),
          );
        },
      );
    return SizedBox.shrink();
  }

  Widget assignToDepartmentWidget(TaskState taskState) {
    if (taskState.selectedAssignedToType == AssignedToType.department)
      return Consumer<manage_provider>(
        builder: (context, manageList, child) {
          final userDepartment =
              context.read<UserProvider>().currentUser.typeAdministration;
          final list = getIt<PrivilegeCubit>().checkPrivilege('169')
              ? manageList.listtext
              : getIt<PrivilegeCubit>().checkPrivilege('168') ||
                      getIt<PrivilegeCubit>().checkPrivilege('174')
                  ? manageList.listtext
                      .where((element) => element.idmange == userDepartment)
                      .toList()
                  : manageList.listtext;
          return AppDropdownButtonFormField<ManageModel, String>(
            items: list,
            onChange: (value) => manageList.changevalue(value ?? ''),
            hint: "القسم",
            itemAsValue: (ManageModel? item) => item!.idmange,
            itemAsString: (item) => item!.name_mange,
            value: manageList.selectedValuemanag,
            validator: (value) {
              if (taskState.selectedAssignedToType !=
                  AssignedToType.department) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          );
        },
      );
    return SizedBox.shrink();
  }

  Widget assignToRegionWidget(TaskState taskState) {
    if (taskState.selectedAssignedToType == AssignedToType.region)
      return Consumer<RegionProvider>(
        builder: (context, cart, child) {
          final user = context.read<UserProvider>().currentUser;
          final list = privilegeBloc.checkPrivilege('169')
              ? cart.listRegion
              : privilegeBloc.checkPrivilege('167')
                  ? cart.listRegion
                      .where((element) => element.regionId == user.fkRegoin)
                      .toList()
                  : cart.listRegion;
          return AppDropdownButtonFormField<RegionModel, String>(
            items: list,
            onChange: cart.changeVal,
            hint: "الفرع",
            itemAsValue: (RegionModel? item) => item!.regionId,
            itemAsString: (item) => item!.regionName,
            value: cart.selectedRegionId,
            validator: (value) {
              if (taskState.selectedAssignedToType != AssignedToType.region) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          );
        },
      );
    return SizedBox.shrink();
  }
}
