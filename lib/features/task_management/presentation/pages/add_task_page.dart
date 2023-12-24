import 'dart:io';

import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/core/utils/responsive_padding.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_scaffold.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

import '../../../../common/helpers/helper_functions.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/manage_provider.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../manage_users/presentation/manager/users_cubit.dart';
import '../../data/models/user_region_department.dart';
import '../widgets/grouped_button.dart';

enum RecurringType { daily, weekly, monthly, other }

enum AssignedToType { employee, department, region }

extension AssignedToTypeExt on AssignedToType {
  String get text {
    String txt;
    switch (this) {
      case AssignedToType.employee:
        txt = 'موظف';
        break;
      case AssignedToType.department:
        txt = 'قسم';
        break;
      case AssignedToType.region:
        txt = 'فرع';
        break;
    }
    return txt;
  }
}

extension RecurringTypeExt on RecurringType {
  String get text {
    String txt;
    switch (this) {
      case RecurringType.daily:
        txt = 'يومي';
        break;
      case RecurringType.weekly:
        txt = 'أسبوعي';
        break;
      case RecurringType.monthly:
        txt = 'شهري';
        break;
      case RecurringType.other:
        txt = 'آخرى';
        break;
    }
    return txt;
  }
}

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late UsersCubit _usersCubit;
  late TextEditingController _taskNameController;
  late TextEditingController _startDateController;
  late TextEditingController _deadLineDateController;
  late TextEditingController _numberOfRecurringController;
  late GlobalKey<FormState> _formKey;
  late TaskCubit _taskCubit;
  late GroupButtonController _groupButtonController;

  @override
  void initState() {
    _usersCubit = GetIt.I<UsersCubit>()
      ..storeCurrentUser(context.read<UserProvider>().currentUser)
      ..getAllUsers()
      ..getUsersByDepartmentAndRegion();
    _taskNameController = TextEditingController();
    _startDateController = TextEditingController();
    _deadLineDateController = TextEditingController();
    _numberOfRecurringController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _taskCubit = GetIt.I<TaskCubit>();
    _groupButtonController = GroupButtonController();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _usersCubit),
        BlocProvider.value(value: _taskCubit),
      ],
      child: AppScaffold(
        appBar: SmartCrmAppBar(
          appBarParams: AppBarParams(
            title: 'إضافة مهمة',
            action: [
              BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  return Builder(builder: (context) {
                    return AppTextButton(
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();
                        if (!isValid) return;
                        if (state.attachmentFile == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: AppText(
                              "من فضلك قم باختيار مرفق",
                              style: context.textTheme.bodyMedium!.sb!.copyWith(color: context.colorScheme.white),
                            ),
                            backgroundColor: context.colorScheme.error,
                          ));
                          return;
                        }

                        if (state.selectedAssignedToType == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: AppText(
                              "من فضلك قم باختيار اسناد إلى",
                              style: context.textTheme.bodyMedium!.sb!.copyWith(color: context.colorScheme.white),
                            ),
                            backgroundColor: context.colorScheme.error,
                          ));
                          return;
                        }

                        final selectedRegionId = context.read<RegionProvider>().selectedRegionId;
                        final selectedValueManage = context.read<manage_provider>().selectedValuemanag;
                        _taskCubit.addTaskAction(
                          taskName: _taskNameController.text,
                          numberOfRecurring: _numberOfRecurringController.text,
                          onSuccess: () => Navigator.pop(context, true),
                          regionId: selectedRegionId,
                          departmentId: selectedValueManage,
                        );
                      },
                      text: "حفظ",
                      appButtonStyle: AppButtonStyle.secondary,
                      isLoading: state.addTaskStatus.isLoading(),
                    );
                  });
                },
              ),
            ],
          ),
        ),
        body: Form(
          key: _formKey,
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, taskState) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  padding: HWEdgeInsets.symmetric(horizontal: 10),
                  children: [
                    20.verticalSpace,
                    AppTextField(
                      labelText: "المهمة*",
                      maxLines: 1,
                      validator: HelperFunctions.instance.requiredFiled,
                      controller: _taskNameController,
                    ),
                    20.verticalSpace,
                    BlocBuilder<UsersCubit, UsersState>(
                      builder: (context, state) {
                        return DropdownSearch<UserModel>.multiSelection(
                          mode: Mode.DIALOG,
                          filterFn: (user, filter) => user!.nameUser!.contains(filter!),
                          compareFn: (item, selectedItem) => item?.idUser == selectedItem?.idUser,
                          items: state.allUsersList.getDataWhenSuccess ?? [],
                          itemAsString: (u) => u!.userAsString(),
                          onChanged: _taskCubit.onChangeParticipants,
                          selectedItems: taskState.selectedParticipant ?? [],
                          showSearchBox: true,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'هذا الحقل مطلوب.';
                            }
                            return null;
                          },

                          dropdownSearchDecoration: InputDecoration(
                            isCollapsed: true,
                            hintText: 'المشاركين*',
                            hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
                            contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12, top: 10, bottom: 15),
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
                            suffixIcon: state.allUsersList.isLoading
                                ? CupertinoActivityIndicator()
                                : state.allUsersList.isError
                                    ? IconButton(onPressed: () => _usersCubit.getAllUsers(), icon: Icon(Icons.refresh))
                                    : null,
                          ),
                          // InputDecoration(border: InputBorder.none),
                        );
                      },
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final selectedTime = TimeOfDay.fromDateTime(taskState.startDate ?? DateTime.now());

                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: taskState.startDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(Duration(days: 365)),
                              );
                              if (date == null) return;

                              final time = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              );
                              if (time != null) {
                                date = date.copyWith(
                                  hour: time.hour,
                                  minute: time.minute,
                                );
                              }

                              _startDateController.text = Intl.DateFormat('dd MMM yyyy, HH:mm').format(date);
                              _taskCubit.onChangeStartDate(date);
                            },
                            child: IgnorePointer(
                              ignoring: true,
                              child: AppTextField(
                                labelText: "تاريخ البدء*",
                                maxLines: 1,
                                validator: HelperFunctions.instance.requiredFiled,
                                readOnly: true,
                                controller: _startDateController,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        15.horizontalSpace,
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final selectedTime = TimeOfDay.fromDateTime(taskState.deadLineDate ?? DateTime.now());

                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: taskState.deadLineDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(Duration(days: 365)),
                              );

                              if (date == null) return;

                              final time = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              );
                              if (time != null) {
                                date = date.copyWith(
                                  hour: time.hour,
                                  minute: time.minute,
                                );
                              }

                              _deadLineDateController.text = Intl.DateFormat('dd MMM yyyy, HH:mm').format(date);
                              _taskCubit.onChangeDeadLineDate(date);
                            },
                            child: IgnorePointer(
                              ignoring: true,
                              child: AppTextField(
                                labelText: "تاريخ التسليم*",
                                maxLines: 1,
                                validator: HelperFunctions.instance.requiredFiled,
                                readOnly: true,
                                controller: _deadLineDateController,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: false,
                      child: Column(
                        children: [
                          10.verticalSpace,
                          SwitchListTile(
                            value: taskState.isRecurring ?? false,
                            onChanged: _taskCubit.onChangeIsRecurring,
                            title: AppText("تكرار"),
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: AppDropdownButtonFormField<RecurringType, RecurringType>(
                                  items: RecurringType.values,
                                  onChange: _taskCubit.onChangeRecurringType,
                                  hint: "نوع التكرار",
                                  itemAsValue: (RecurringType? item) => item,
                                  itemAsString: (item) => item!.text,
                                  value: taskState.selectedRecurringType,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: AppTextField(
                                  labelText: "عدد التكرارات",
                                  maxLines: 1,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  textInputType: TextInputType.number,
                                  controller: _numberOfRecurringController,
                                ),
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: DropdownSearch<String>(
                                  mode: Mode.DIALOG,
                                  filterFn: (user, filter) => user!.contains(filter!),
                                  compareFn: (item, selectedItem) => item == selectedItem,
                                  items: [],
                                  itemAsString: (u) => u!,
                                  onChanged: (data) {},
                                  selectedItem: null,
                                  showSearchBox: true,
                                  dropdownSearchDecoration: InputDecoration(
                                    isCollapsed: true,
                                    hintText: 'الفاتورة',
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
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: DropdownSearch<String>(
                                  mode: Mode.DIALOG,
                                  filterFn: (user, filter) => user!.contains(filter!),
                                  compareFn: (item, selectedItem) => item == selectedItem,
                                  items: [],
                                  itemAsString: (u) => u!,
                                  onChanged: (data) {},
                                  selectedItem: null,
                                  showSearchBox: true,
                                  dropdownSearchDecoration: InputDecoration(
                                    isCollapsed: true,
                                    hintText: 'المجموعة',
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      height: 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15).r,
                        border: Border.all(color: context.colorScheme.primary),
                      ),
                      child: InkWell(
                        onTap: () async {
                          final file = await FilePicker.platform.pickFiles(allowMultiple: false);

                          if (file == null) return;

                          _taskCubit.onChangeAttachmentFile(File(file.files.first.path!));
                        },
                        child: fileWidget(taskState.attachmentFile),
                      ),
                    ),
                    20.verticalSpace,
                    GroupedButtons<AssignedToType>(
                      title: 'اسناد إلى',
                      buttons: AssignedToType.values,
                      buttonTextBuilder: (selected, value, context) => value.text,
                      onSelected: (value, index, isSelected) {
                        _taskCubit.onChangeSelectedAssignedToType(value);
                      },
                      selectedIndex: taskState.selectedAssignedToType?.index,
                    ),
                    20.verticalSpace,
                    assignToEmployeeWidget(taskState),
                    assignToRegionWidget(taskState),
                    assignToDepartmentWidget(taskState),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget assignToEmployeeWidget(TaskState taskState) {
    if (taskState.selectedAssignedToType == AssignedToType.employee)
      return BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return DropdownSearch<UserRegionDepartment>(
            mode: Mode.DIALOG,
            filterFn: (user, filter) => user!.nameUser!.contains(filter!),
            compareFn: (item, selectedItem) => item?.idUser == selectedItem?.idUser,
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
              hintText: 'الموظف*',
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
              suffixIcon: state.usersByDepartmentAndRegion.isLoading
                  ? CupertinoActivityIndicator()
                  : state.usersByDepartmentAndRegion.isError
                      ? IconButton(
                          onPressed: () => _usersCubit.getUsersByDepartmentAndRegion(), icon: Icon(Icons.refresh))
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
          final userDepartment = context.read<UserProvider>().currentUser.typeAdministration;
          final list = GetIt.I<PrivilegeCubit>().checkPrivilege('169')
              ? manageList.listtext
              : GetIt.I<PrivilegeCubit>().checkPrivilege('168') || GetIt.I<PrivilegeCubit>().checkPrivilege('174')
                  ? manageList.listtext.where((element) => element.idmange == userDepartment).toList()
                  : manageList.listtext;
          return AppDropdownButtonFormField<ManageModel, String>(
            items: list,
            onChange: (value) => manageList.changevalue(value ?? ''),
            hint: "القسم *",
            itemAsValue: (ManageModel? item) => item!.idmange,
            itemAsString: (item) => item!.name_mange,
            value: manageList.selectedValuemanag,
            validator: (value) {
              if (taskState.selectedAssignedToType != AssignedToType.department) {
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
          final list = GetIt.I<PrivilegeCubit>().checkPrivilege('169')
              ? cart.listRegion
              : GetIt.I<PrivilegeCubit>().checkPrivilege('167')
                  ? cart.listRegion.where((element) => element.regionId == user.fkRegoin).toList()
                  : cart.listRegion;
          return AppDropdownButtonFormField<RegionModel, String>(
            items: list,
            onChange: cart.changeVal,
            hint: "الفرع *",
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

  Widget fileWidget(File? file) {
    if (file == null) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_file_rounded, color: context.colorScheme.grey500),
            10.horizontalSpace,
            AppText("إضافة مرفق"),
          ],
        ),
      );
    } else {
      return Container(
        margin: HWEdgeInsets.all(5),
        padding: HWEdgeInsets.all(10),
        decoration: BoxDecoration(
          color: context.colorScheme.grey50,
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Row(
          children: [
            Icon(Icons.file_copy_rounded, color: context.colorScheme.grey500),
            10.horizontalSpace,
            Expanded(child: AppText(file.path.name)),
          ],
        ),
      );
    }
  }
}
