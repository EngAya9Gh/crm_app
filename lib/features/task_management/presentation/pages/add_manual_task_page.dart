import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/add_task_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/models/page_state/page_state.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/manage_provider.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../clients_care/violations_clienta_care/data/models/management_model.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../mangement/manage_users/presentation/manager/users_cubit.dart';
import '../../data/models/user_region_department.dart';
import '../manager/task_cubit.dart';
import '../pages/add_task_page.dart';

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
  late PrivilegesCubit privilegeBloc;
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
    privilegeBloc = getIt<PrivilegesCubit>();
    _taskCubit = getIt<TaskCubit>();

    currentUser = context.read<UserProvider>().currentUser;
    // departmentId = privilegeBloc.checkPrivilege('174')
    //     ? '2'
    //     : privilegeBloc.checkPrivilege('169')
    //         ? null
    //         : privilegeBloc.checkPrivilege('168') || privilegeBloc.checkPrivilege('166')
    //             ? currentUser.typeAdministration
    //             : null;
    // regionId = privilegeBloc.checkPrivilege('167') ? currentUser.fkRegoin : null;

    _usersCubit = context.read<UsersCubit>()
      ..storeCurrentUser(currentUser)
      ..getUsers()
      ..onGetUserSelected();

    _taskNameController = TextEditingController();
    _deadLineDateController = TextEditingController();
    _taskDescriptionController = TextEditingController();

    _formKey = GlobalKey<FormState>();

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
                insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        20.height,
                        Row(
                          children: [
                            SizedBox(width: 10),
                            InkWell(onTap: Navigator.of(context).pop, child: AppIcon(Icons.close)),
                            Spacer(),
                            AppText('إضافة مهمة'),
                            SizedBox(width: 30),
                            Spacer(),
                          ],
                        ),
                        25.height,
                        CustomDropDown<PublicType>(
                          hint: "نوع المهمة*",
                          items: widget.list,
                          itemAsString: (item) => item!.text,
                          selectedItem: selectedPublicType,
                          onChanged: (value) {
                            selectedPublicType = value;
                            setState(() {});
                          },
                          validator: InputValidator.requiredFiled,
                        ),
                        10.height,
                        if (selectedPublicType == PublicType.other) ...[
                          AppTextField(
                            labelText: "عنوان المهمة*",
                            maxLines: 1,
                            validator: (value) {
                              if (selectedPublicType != PublicType.other) return null;

                              if (value?.trim().isEmpty ?? true) {
                                return "هذا الحقل مطلوب.";
                              }
                              return null;
                            },
                            controller: _taskNameController,
                          ),
                          10.height,
                        ],
                        AppTextField(
                          labelText: "وصف المهمة*",
                          validator: InputValidator.requiredFiled,
                          minLines: 3,
                          contentPadding: HWEdgeInsets.all(15),
                          controller: _taskDescriptionController,
                        ),
                        10.height,
                        if (privilegeBloc.checkPrivilege('171'))
                          InkWell(
                            onTap: () async {
                              final selectedTime = TimeOfDay.fromDateTime(state.deadLineDate ?? DateTime.now());

                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: state.deadLineDate ?? DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(Duration(days: 365)),
                              );

                              if (date == null) return;

                              final time = await showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                              );
                              if (time != null) {
                                date = date.copyWith(hour: time.hour, minute: time.minute);
                              }

                              _deadLineDateController.text = Intl.DateFormat('dd MMM yyyy, HH:mm').format(date);
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
                          ),
                        10.height,
                        AppCardContainer(
                          child: AppGroupButton(
                            groupButtonController: GroupButtonController(selectedIndex: state.selectedAssignedToType?.index),
                            buttons: assignedToList.map((e) => e.text).toList(growable: false),
                            onSelected: (value, index, isselected) {
                              _taskCubit.onChangeSelectedAssignedToType(assignedToList[index]);
                            },
                          ),
                        ),
                        10.height,
                        assignToEmployeeWidget(state),
                        assignToRegionWidget(state),
                        assignToDepartmentWidget(state),
                        20.height,
                        BlocBuilder<TaskCubit, TaskState>(
                          builder: (context, state) {
                            return Builder(builder: (context) {
                              return SizedBox(
                                width: double.infinity,
                                child: AppElevatedButton(
                                  text: "حفظ",
                                  isLoading: state.addTaskStatus.isLoading(),
                                  onPressed: () {
                                    final isValid = _formKey.currentState!.validate();
                                    if (!isValid) return;

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
                                 var assignToId=   state.selectedAssignedToType == AssignedTypeNew.users
                                        ? state.selectedAssignTo?.idUser.toString()
                                        : state.selectedAssignedToType == AssignedTypeNew.managements
                                        ? selectedValueManage
                                        : selectedRegionId;
                                    _taskCubit.addTaskAction(
                                        onSuccess: () => Navigator.pop(context, selectedPublicType == PublicType.linkComment),
                                        addTaskParams: AddTaskParams(
                                            title: selectedPublicType == PublicType.other ? _taskNameController.text : selectedPublicType?.text,
                                            description: _taskDescriptionController.text,
                                            assignFrom: AssignedTypeNew.users.name.toString(),
                                            assignFromId: currentUser.idUser!,
                                            assignTo: state.selectedAssignedToType?.name,
                                            assignToId: assignToId,
                                            userId: currentUser.idUser!,
                                             clientId: widget.clientId,
                                             invoiceId: widget.invoiceId,
                                            startDate: state.startDate,
                                            file: state.attachmentFile,
                                            deadLineDate: state.deadLineDate,
                                            publicType: PublicType.addTask.name.toString(),
                                            participants: state.selectedParticipant ?? [])
/*
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
*/
                                        );
                                  },
                                  appButtonStyle: AppButtonStyle.secondary,
                                ),
                              );
                            });
                          },
                        ),
                        20.height,
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

  List<AssignedTypeNew> get assignedToList {
    final list = List.of(AssignedTypeNew.values);
    if (!privilegeBloc.checkPrivilege('167') && !privilegeBloc.checkPrivilege('174')) {
      list.remove(AssignedTypeNew.regoin);
    }
    if (!privilegeBloc.checkPrivilege('168') && !privilegeBloc.checkPrivilege('169')) {
      list.remove(AssignedTypeNew.managements);
    }
    if (!privilegeBloc.checkPrivilege('166')) {
      list.remove(AssignedTypeNew.regoin);
    }

    return list;
  }

  Widget assignToEmployeeWidget(TaskState taskState) {
    if (taskState.selectedAssignedToType == AssignedTypeNew.users)
      return BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return CustomSearchableDropDown<UserModel>(
            hint: "الموظف",
            items: state.getUserSelected.data ?? [],
            itemAsString: (u) => u!.nameUser.toString(),
            onChanged: (data) {
              _taskCubit.onChangeAssignTo(data);
            },
            selectedItem: taskState.selectedAssignTo,
            filterFn: (user, filter) => user.nameUser!.contains(filter),
            validator: (value) {
              if (taskState.selectedAssignedToType != AssignedTypeNew.users) {
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
          return AppDropdownButtonFormField<ManageModel, String>(
            items: list,
            onChange: (value) => manageList.changevalue(value ?? ''),
            hint: "القسم",
            itemAsValue: (ManageModel? item) => item!.idMange,
            itemAsString: (item) => item!.name_mange,
            value: manageList.selectedValuemanag,
            validator: (value) {
              if (taskState.selectedAssignedToType != AssignedTypeNew.managements) {
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
    if (taskState.selectedAssignedToType == AssignedTypeNew.regoin)
      return Consumer<RegionProvider>(
        builder: (context, cart, child) {
          final user = context.read<UserProvider>().currentUser;
          final list = privilegeBloc.checkPrivilege('169')
              ? cart.listRegionTaskFilter
              : privilegeBloc.checkPrivilege('167')
                  ? cart.listRegionTaskFilter.where((element) => element.branchId == user.fkRegoin).toList()
                  : cart.listRegionTaskFilter;
          return AppDropdownButtonFormField<BranchModel, String>(
            items: list,
            onChange: cart.changeVal,
            hint: "الفرع",
            itemAsValue: (BranchModel? item) => item!.branchId,
            itemAsString: (item) => item!.branchName,
            value: cart.selectedRegionId,
            validator: (value) {
              if (taskState.selectedAssignedToType != AssignedTypeNew.regoin) {
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
