import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/utils/app_dimensions.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/add_task_usecase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/manage_provider.dart';
import '../../../../ui/screen/invoice/invoice_images_file.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../clients_care/violations_clienta_care/data/models/management_model.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../mangement/manage_users/presentation/manager/users_cubit.dart';
import '../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../data/models/user_region_department.dart';
import '../manager/task_cubit.dart';

enum RecurringType { daily, weekly, monthly, other }

enum AssignedToType { employee, department, region }

enum AssignedTypeNew {
  users(text: 'موظف'),
  managements(text: 'قسم'),
  region(text: 'فرع');

  final String text;

  const AssignedTypeNew({required this.text});
}

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
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  late UsersCubit _usersCubit;
  late TextEditingController _taskNameController;
  late TextEditingController _taskDescriptionController;
  late TextEditingController _startDateController;
  late TextEditingController _deadLineDateController;
  late TextEditingController _numberOfRecurringController;
  late GlobalKey<FormState> _formKey;
  late TaskCubit _taskCubit;
  late PrivilegesCubit privilegeBloc;
  String? regionId;
  String? departmentId;
  late UserModel currentUser;

  @override
  void initState() {
    privilegeBloc = getIt<PrivilegesCubit>();
    currentUser = context.read<UserProvider>().currentUser;
    // departmentId = privilegeBloc.checkPrivilege('174')
    //     ? '2'
    //     : privilegeBloc.checkPrivilege('169')
    //         ? null
    //         : privilegeBloc.checkPrivilege('168') || privilegeBloc.checkPrivilege('166')
    //             ? currentUser.typeAdministration
    //             : null;
    // regionId = privilegeBloc.checkPrivilege('167') ? currentUser.fkRegoin : null;
    //
    _usersCubit = context.read<UsersCubit>()
      ..storeCurrentUser(currentUser)
      ..getUsersAll()
      ..onGetUserSelected();

    _taskNameController = TextEditingController();
    _startDateController = TextEditingController();
    _deadLineDateController = TextEditingController();
    _numberOfRecurringController = TextEditingController();
    _taskDescriptionController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _taskCubit = getIt<TaskCubit>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RegionProvider>()
        ..changeValuser(null, true)
        ..getRegionsTasks();
      context.read<manage_provider>()
        ..changevalue(null)
        ..getManagesTask();
    });
    super.initState();
  }

  List<AssignedTypeNew> get assignedToList {
    final list = List.of(AssignedTypeNew.values);
    if (!privilegeBloc.checkPrivilege('167') && !privilegeBloc.checkPrivilege('174')) {
      list.remove(AssignedTypeNew.region);
    }
    if (!privilegeBloc.checkPrivilege('168') && !privilegeBloc.checkPrivilege('169')) {
      list.remove(AssignedTypeNew.managements);
    }
    if (!privilegeBloc.checkPrivilege('166')) {
      list.remove(AssignedTypeNew.users);
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _usersCubit,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'إضافة مهمة',
          actions: [
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return Builder(builder: (context) {
                  return AppTextButton(
                    text: "حفظ",
                    isLoading: state.addTaskStatus.isLoading(),
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) return;
                      if (state.selectedAssignedToType == null) {
                        AppSnackbar.showSnakeBar(
                          "من فضلك قم باختيار اسناد إلى",
                          color: ToastColorsEnum.warning,
                        );

                        return;
                      }

                      final selectedRegionId = context.read<RegionProvider>().selectedRegionId;
                      final selectedValueManage = context.read<manage_provider>().selectedValuemanag;
                      _taskCubit.addTaskAction(
                          onSuccess: () => AppNavigator.pop(result: true),
                          addTaskParams: AddTaskParams(
                              title: _taskNameController.text,
                              description: _taskDescriptionController.text,
                              assignFrom: AssignedTypeNew.users.name.toString(),
                              assignFromId: currentUser.idUser!,
                              assignTo: state.selectedAssignedToType?.name,
                              assignToId: state.selectedAssignTo!.idUser.toString(),
                              userId: currentUser.idUser!,
                              startDate: state.startDate,
                              file: state.attachmentFile,
                              deadLineDate: state.deadLineDate,
                              publicType: PublicType.addTask.name.toString(),
                              participants: state.selectedParticipant ?? [])
/*
                        taskName: _taskNameController.text,
                        numberOfRecurring: _numberOfRecurringController.text,
                        onSuccess: () => AppNavigator.pop(result: true),
                        regionId: selectedRegionId,
                        departmentId: selectedValueManage,
                        userId: currentUser.idUser!,
                        description: _taskDescriptionController.text,
*/
                          );
                    },
                    appButtonStyle: AppButtonStyle.secondary,
                    textStyle: AppStyles.textStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  );
                });
              },
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, taskState) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    10.height,
                    AppTextField(
                      labelText: "المهمة*",
                      maxLines: 1,
                      validator: InputValidator.requiredFiled,
                      controller: _taskNameController,
                    ),
                    10.height,
                    AppTextField(
                      labelText: "وصف المهمة*",
                      validator: InputValidator.requiredFiled,
                      controller: _taskDescriptionController,
                      minLines: 5,
                      contentPadding: HWEdgeInsets.all(15),
                    ),
                    10.height,
                    BlocBuilder<UsersCubit, UsersState>(
                      builder: (context, state) {
                        return CustomMultiSelectionDropdown<UserModel>(
                          hint: 'المشاركين*',
                          items: _usersCubit.pageVariables.usersAllList,
                          selectedItems: taskState.selectedParticipant ?? [],
                          onSave: _taskCubit.onChangeParticipants,
                          itemAsString: (u) => u!.userAsString(),
                          filterFn: (user, filter) => user.nameUser!.contains(filter),
                          compareFn: (item, selectedItem) => item.idUser == selectedItem.idUser,
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'هذا الحقل مطلوب.';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    10.height,
                    Theme(
                      data: context.theme.copyWith(
                          timePickerTheme: TimePickerThemeData(
                        cancelButtonStyle: ButtonStyle().copyWith(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 12))),
                        confirmButtonStyle: ButtonStyle().copyWith(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 12))),
                        dayPeriodTextStyle: TextStyle(fontSize: 12),
                        dialTextStyle: TextStyle(fontSize: 12),
                        helpTextStyle: TextStyle(fontSize: 12),
                        hourMinuteTextStyle: TextStyle(fontSize: 12),
                      )),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomDateTimePicker(
                              dateTimeType: DateTimeEnum.both,
                              hintText: 'تاريخ البداية',
                              isStartFromNow: true,
                              formatDate: Intl.DateFormat('dd MM yyyy HH:mm:ss'),
                              isRequired: true,
                              dateTimeController: _startDateController,
                              style2: true,
                              onDateChange: (p0, p1) {
                                _taskCubit.onChangeStartDate(p0);
                              },
                            ),
                          ),
                          if (privilegeBloc.checkPrivilege('171')) ...{
                            15.width,
                            Expanded(
                              child: CustomDateTimePicker(
                                dateTimeType: DateTimeEnum.both,
                                hintText: 'تاريخ النهاية',
                                isStartFromNow: true,
                                isRequired: true,
                                formatDate: Intl.DateFormat('dd MM yyyy HH:mm:ss'),
                                dateTimeController: _deadLineDateController,
                                style2: true,
                                onDateChange: (p0, p1) {
                                  // _deadLineDateController.text = Intl.DateFormat('dd MMM yyyy HH:mm:ss').format(p0);
                                  _taskCubit.onChangeDeadLineDate(p0);
                                },
                              ) /*InkWell(
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

                                  _deadLineDateController.text = Intl.DateFormat('dd MMM yyyy HH:mm:ss').format(date);
                                  _taskCubit.onChangeDeadLineDate(date);
                                },
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: AppTextField(
                                    labelText: "تاريخ التسليم*",
                                    maxLines: 1,
                                    validator: InputValidator.requiredFiled,
                                    readOnly: true,
                                    controller: _deadLineDateController,
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )*/
                              ,
                            ),
                          },
                        ],
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: Column(
                        children: [
                          10.height,
                          SwitchListTile(
                            value: taskState.isRecurring ?? false,
                            onChanged: _taskCubit.onChangeIsRecurring,
                            title: AppText("تكرار"),
                          ),
                          10.height,
                          Row(
                            children: [
                              Expanded(
                                child: CustomDropDown<RecurringType>(
                                  hint: 'نوع التكرار',
                                  items: RecurringType.values,
                                  itemAsString: (item) => item!.text,
                                  selectedItem: taskState.selectedRecurringType,
                                  onChanged: _taskCubit.onChangeRecurringType,
                                  validator: InputValidator.requiredFiled,
                                  height: 135.scaleHeight,
                                ),
                              ),
                              10.width,
                              Expanded(
                                child: AppTextField(
                                  labelText: "عدد التكرارات",
                                  maxLines: 1,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  inputType: TextInputType.number,
                                  controller: _numberOfRecurringController,
                                ),
                              ),
                            ],
                          ),
                          10.height,
                          Row(
                            children: [
                              Expanded(
                                child: CustomSearchableDropDown<String>(
                                  hint: 'الفاتورة',
                                  items: [],
                                  itemAsString: (u) => u!,
                                  onChanged: (data) {},
                                  selectedItem: null,
                                  filterFn: (user, filter) => user.contains(filter),
                                ),
                              ),
                              10.width,
                              Expanded(
                                child: CustomSearchableDropDown<String>(
                                  hint: 'المجموعة',
                                  items: [],
                                  itemAsString: (u) => u!,
                                  onChanged: (data) {},
                                  selectedItem: null,
                                  filterFn: (user, filter) => user.contains(filter),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    10.height,
                    AppElevatedButton(
                      text: 'إضافة مرفق',
                      onPressed: () async {
                        final file = await FilePicker.platform.pickFiles(allowMultiple: false);

                        if (file == null) return;

                        _taskCubit.onChangeAttachmentFile(File(file.files.first.path!));
                      },
                      icon: Icons.attach_file_rounded,
                    ),
                    10.height,
                    AppText('اسناد إلى'),
                    5.height,
                    AppCardContainer(
                      child: AppGroupButton(
                        width: AppDimensions.currentWidth() / (assignedToList.length + 1),
                        groupButtonController: GroupButtonController(
                          selectedIndex: taskState.selectedAssignedToType?.index,
                        ),
                        buttons: assignedToList.map((e) => e.text).toList(),
                        onSelected: (_, index, isSelected) {
                          _taskCubit.onChangeSelectedAssignedToType(assignedToList[index]);
                        },
                      ),
                    ),
                    10.height,
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
    if (taskState.selectedAssignedToType == AssignedTypeNew.users)
      return BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return CustomSearchableDropDown<UserModel>(
            hint: 'الموظف',
            items: state.getUserSelected.data ?? [],
            itemAsString: (u) => u!.nameUser!,
            onChanged: _taskCubit.onChangeAssignTo,
            selectedItem: taskState.selectedAssignTo,
            filterFn: (user, filter) => user.nameUser!.contains(filter),
            validator: (value) {
              if (taskState.selectedAssignedToType != AssignedToType.employee) {
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

  Widget assignToDepartmentWidget(TaskState taskState) {
    if (taskState.selectedAssignedToType == AssignedTypeNew.managements)
      return Consumer<manage_provider>(
        builder: (context, manageList, child) {
          final userDepartment = context.read<UserProvider>().currentUser.typeAdministration;
          final list = getIt<PrivilegesCubit>().checkPrivilege('169')
              ? manageList.listMangTask
              : getIt<PrivilegesCubit>().checkPrivilege('168') || getIt<PrivilegesCubit>().checkPrivilege('174')
                  ? manageList.listMangTask.where((element) => element.idMange == userDepartment).toList()
                  : manageList.listMangTask;

          return CustomDropDown<ManageModel>(
            hint: 'القسم',
            items: list,
            itemAsString: (item) => item!.name_mange,
            selectedItem: list.firstWhereOrNull(
              (element) => element.idMange == departmentId,
            ),
            onChanged: (data) {
              manageList.changevalue(data!.idMange);
            },
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
          final list = privilegeBloc.checkPrivilege('169')
              ? cart.listRegionTaskFilter
              : privilegeBloc.checkPrivilege('167')
                  ? cart.listRegionTaskFilter.where((element) => element.branchId == user.fkRegoin).toList()
                  : cart.listRegionTaskFilter;
          return CustomDropDown<BranchModel>(
            hint: 'الفرع',
            items: list,
            itemAsString: (branch) => branch!.branchName,
            selectedItem: list.firstWhereOrNull(
              (element) => element.branchId == regionId,
            ),
            onChanged: (data) {
              cart.changeVal(data!.branchId);
            },
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
            10.width,
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
            10.width,
            Expanded(child: AppText(file.path.name)),
          ],
        ),
      );
    }
  }
}
