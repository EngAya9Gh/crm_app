import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/helpers/compare_date_time.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/clients_care/client_communications/data/models/client_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../../../support/dates_table/data/models/subscribed_client_model.dart';
import '../../data/models/activity_type_model.dart';
import '../manager/crud_activities_bloc.dart';
import 'package:crm_smart/core/common/widgets/section_header.dart';
import 'package:crm_smart/core/common/widgets/info_item.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({this.activity, super.key});

  final ClientActivityModel? activity;

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  late final CrudActivitiesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<CrudActivitiesBloc>();
    _bloc.addActivityEntity.clear();
    if (_bloc.addActivityEntity.wholeDay.value) {
      _bloc.add(ChangeWholeDayValueEvent());
    }
    if (widget.activity != null) {
      _bloc.addActivityEntity.selectedActivity.value = widget.activity!;
      _bloc.addActivityEntity.setUpdateValues(widget.activity!);
    }
    if (_bloc.addActivityEntity.addActivityTypesList.value.isEmpty) {
      _bloc.add(GetActivityTypesEvent(type: "menu"));
    }
    if (_bloc.addActivityEntity.subscribedClientsList.value.isEmpty) {
      _bloc.add(GetSubscribedClientsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
          title: widget.activity == null ? "إضافة نشاط" : 'تعديل نشاط',
          showBackButton: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: _bloc.addActivityEntity.globalKey,
          child: BlocBuilder<CrudActivitiesBloc, CrudActivitiesState>(
            buildWhen: (previous, current) =>
                previous.addClientActivityStatus !=
                    current.addClientActivityStatus ||
                previous.updateClientActivityStatus !=
                    current.updateClientActivityStatus,
            builder: (context, state) {
              return RepaintBoundary(
                child: ModalProgressHUD(
                  inAsyncCall: state.addClientActivityStatus.isLoading() ||
                      state.updateClientActivityStatus.isLoading(),
                  progressIndicator: AppLoader(),
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      SectionHeader(title: 'معلومات النشاط'),
                      BlocSelector<CrudActivitiesBloc, CrudActivitiesState,
                          BlocStatus>(
                        selector: (state) => state.getActivityTypesStatus,
                        builder: (context, getActivityTypesStatus) {
                          return getActivityTypesStatus.isLoading()
                              ? AppLoader()
                              : InfoItem(
                                  title: "نوع النشاط",
                                  isRequired: true,
                                  customWidget:
                                      CustomDropDown<ActivityTypeModel>(
                                    hint: "نوع النشاط",
                                    isDisabled: widget.activity == null
                                        ? false
                                        : widget.activity!.state == "completed",
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    items: _bloc.addActivityEntity
                                        .addActivityTypesList.value,
                                    itemAsString: (item) => item!.name,
                                    compareFn: (item, selectedItem) =>
                                        item.id == selectedItem.id,
                                    selectedItem: _bloc.addActivityEntity
                                                .selectedActivityType.value ==
                                            null
                                        ? null
                                        : _bloc.addActivityEntity
                                            .selectedActivityType.value,
                                    onChanged: (value) {
                                      if (value == null) return;
                                      _bloc.addActivityEntity
                                          .selectedActivityType.value = value;
                                    },
                                    validator: InputValidator.requiredFiled,
                                  ),
                                );
                        },
                      ),
                      10.height,
                      InfoItem(
                        title: "العنوان",
                        isRequired: true,
                        customWidget: AppTextField(
                          controller: _bloc.addActivityEntity.nameController,
                          enabled: !(widget.activity == null
                              ? false
                              : widget.activity!.state == "completed"),
                        ),
                      ),
                      10.height,
                      InfoItem(
                        title: "الوصف",
                        isRequired: true,
                        customWidget: AppTextField(
                          controller:
                              _bloc.addActivityEntity.descriptionController,
                          enabled: !(widget.activity == null
                              ? false
                              : widget.activity!.state == "completed"),
                          maxLines: 3,
                        ),
                      ),
                      10.height,
                      SectionHeader(title: 'التوقيت'),
                      InfoItem(
                        title: "تاريخ البداية",
                        isRequired: true,
                        customWidget: CustomDateTimePicker(
                          dateTimeType: DateTimeEnum.both,
                          enabled: !(widget.activity == null
                              ? false
                              : widget.activity!.state == "completed"),
                          dateTimeController:
                              _bloc.addActivityEntity.startDateController,
                          style2: true,
                        ),
                      ),
                      10.height,
                      BlocSelector<CrudActivitiesBloc, CrudActivitiesState,
                          bool>(
                        selector: (state) => state.wholeDay,
                        builder: (context, wholeDay) {
                          return InfoItem(
                            title: "تاريخ النهاية",
                            isRequired: !wholeDay,
                            customWidget: CustomDateTimePicker(
                              dateTimeType: DateTimeEnum.both,
                              enabled: !(widget.activity == null
                                  ? false
                                  : widget.activity!.state == "completed"),
                              dateTimeController:
                                  _bloc.addActivityEntity.endDateController,
                              style2: true,
                            ),
                          );
                        },
                      ),
                      10.height,
                      SectionHeader(title: 'حالة النشاط'),
                      Row(
                        children: [
                          Expanded(
                            child: InfoItem(
                              title: "الحالة",
                              isRequired: true,
                              customWidget: Directionality(
                                textDirection: TextDirection.rtl,
                                child: CustomDropDown<ActivityStateEnum>(
                                  hint: "الحالة",
                                  isDisabled: widget.activity == null
                                      ? false
                                      : widget.activity!.state == "completed",
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  items: ActivityStateEnum.values,
                                  compareFn: (item, selectedItem) =>
                                      item.index == selectedItem.index,
                                  itemAsString: (item) => item!.name,
                                  selectedItem: _bloc.addActivityEntity
                                              .activityState.value ==
                                          null
                                      ? null
                                      : ActivityStateExtension.fromValue(_bloc
                                              .addActivityEntity
                                              .activityState
                                              .value ??
                                          ""),
                                  itemAsIcon: (value) {
                                    return Icon(
                                      value!.icon,
                                      color: value.color,
                                      size: 25.scaleIconsSize,
                                    );
                                  },
                                  onChanged: (value) {
                                    if (value == null) return;
                                    _bloc.addActivityEntity.activityState
                                        .value = value.enName;
                                  },
                                  validator: InputValidator.requiredFiled,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          AppIcon(
                            _bloc.addActivityEntity.activityState.value == null
                                ? Icons.schedule
                                : ActivityStateExtension.fromValue(_bloc
                                            .addActivityEntity
                                            .activityState
                                            .value ??
                                        "")
                                    .icon,
                            color:
                                _bloc.addActivityEntity.activityState.value ==
                                        null
                                    ? ActivityStateEnum.schedule.color
                                    : ActivityStateExtension.fromValue(_bloc
                                                .addActivityEntity
                                                .activityState
                                                .value ??
                                            "")
                                        .color,
                          ),
                        ],
                      ),
                      10.height,
                      Row(
                        children: [
                          Expanded(
                            child: InfoItem(
                              title: "الأولوية",
                              isRequired: true,
                              customWidget:
                                  CustomDropDown<ActivityPriorityEnum>(
                                hint: "الأولوية",
                                items: ActivityPriorityEnum.values,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                isDisabled: widget.activity == null
                                    ? false
                                    : widget.activity!.state == "completed",
                                itemAsString: (item) => item!.name,
                                compareFn: (item, selectedItem) =>
                                    item.index == selectedItem.index,
                                selectedItem: _bloc
                                            .addActivityEntity.priority.value ==
                                        null
                                    ? null
                                    : ActivityPriorityExtension.fromValue(_bloc
                                            .addActivityEntity.priority.value ??
                                        ""),
                                onChanged: (value) {
                                  if (value == null) return;
                                  _bloc.addActivityEntity.priority.value =
                                      value.enName;
                                },
                                itemAsIcon: (value) {
                                  return Icon(
                                    Icons.flag,
                                    color: value!.color,
                                    size: 25.scaleIconsSize,
                                  );
                                },
                                validator: InputValidator.requiredFiled,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          AppIcon(
                            Icons.flag,
                            color:
                                _bloc.addActivityEntity.priority.value == null
                                    ? ActivityPriorityEnum.normal.color
                                    : ActivityPriorityExtension.fromValue(_bloc
                                                .addActivityEntity
                                                .priority
                                                .value ??
                                            "")
                                        .color,
                          ),
                        ],
                      ),
                      10.height,
                      SectionHeader(title: 'معلومات العميل'),
                      BlocSelector<CrudActivitiesBloc, CrudActivitiesState,
                          BlocStatus>(
                        selector: (state) => state.getSubscribedClientsStatus,
                        builder: (context, getSubscribedClientsStatus) {
                          return getSubscribedClientsStatus.isLoading()
                              ? AppLoader()
                              : InfoItem(
                                  title: "العميل",
                                  isRequired: true,
                                  customWidget: CustomSearchableDropDown<
                                      SubscribedClientModel>(
                                    hint: 'العميل',
                                    enabled: !(widget.activity == null
                                        ? false
                                        : widget.activity!.state ==
                                            "completed"),
                                    items: _bloc.addActivityEntity
                                        .subscribedClientsList.value,
                                    itemAsString: (item) => item!.name,
                                    selectedItem: _bloc
                                        .addActivityEntity.selectedClient.value,
                                    onChanged: (widget.activity != null &&
                                            widget.activity!.state ==
                                                "completed")
                                        ? null
                                        : (value) async {
                                            _bloc.addActivityEntity
                                                .selectedClient.value = value;
                                          },
                                    validator: (value) {
                                      return InputValidator.requiredFiled(
                                          value);
                                    },
                                    filterFn: (item, filter) {
                                      return item.name
                                          .toLowerCase()
                                          .contains(filter.toLowerCase());
                                    },
                                    compareFn: (item, selectedItem) =>
                                        item.id == selectedItem.id,
                                  ),
                                );
                        },
                      ),
                      AppElevatedButton(
                        onPressed: (widget.activity != null &&
                                widget.activity!.state == "completed")
                            ? null
                            : () {
                                if (_bloc
                                    .addActivityEntity.globalKey.currentState!
                                    .validate()) {
                                  if (_bloc.addActivityEntity.endDateController
                                          .text !=
                                      '') {
                                    bool isAfter = IsStartAfterEnd(
                                        _bloc.addActivityEntity
                                            .startDateController.text,
                                        _bloc.addActivityEntity
                                            .endDateController.text,
                                        isDate: true);
                                    if (isAfter) {
                                      AppSnackbar.showSnakeBar(
                                          'لا يمكن أن يكون وقت النهاية قبل وقت البداية');
                                      return;
                                    }
                                  }
                                  if (widget.activity == null) {
                                    _bloc.add(
                                      AddActivityEvent(
                                        onSuccess: () {
                                          AppSnackbar.showSnakeBar(
                                              "تمت اضافة النشاط بنجاح");
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  } else {
                                    _bloc.add(
                                      UpdateCrudActivityEvent(
                                        activityId:
                                            widget.activity!.id.toString(),
                                        onSuccess: () {
                                          AppSnackbar.showSnakeBar(
                                              "تمت تعديل النشاط بنجاح");
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  }
                                }
                              },
                        child:
                            Text(widget.activity == null ? "إضافة" : "تعديل"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
