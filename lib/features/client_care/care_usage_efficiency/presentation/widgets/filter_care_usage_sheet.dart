import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../features/app/presentation/widgets/app_text.dart';
import '../../../../../features/app/presentation/widgets/app_text_button.dart';
import '../../../../../features/common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../../features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../../../../model/ActivityModel.dart';
import '../../../../../view_model/activity_vm.dart';
import '../manager/care_usage_cubit/care_usage_cubit.dart';

class FilterCareUsageSheet extends StatefulWidget {
  const FilterCareUsageSheet({Key? key}) : super(key: key);

  @override
  State<FilterCareUsageSheet> createState() => _FilterCareUsageSheetState();
}

class _FilterCareUsageSheetState extends State<FilterCareUsageSheet> {
  late CareUsageCubit careUsageCubit;

  @override
  void initState() {
    super.initState();
    careUsageCubit = context.read<CareUsageCubit>();
   WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
       
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reset button
              Align(
                alignment: Alignment.centerLeft,
                child: ListenableBuilder(
                  listenable: Listenable.merge(
                      careUsageCubit.filterEntity.listenables()),
                  builder: (context, child) => AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed:
                        careUsageCubit.filterEntity.checkIfFilterIsNotEmpty()
                            ? () {
                                careUsageCubit.filterEntity.reset();
                                Navigator.pop(context);
                              }
                            : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  ),
                ),
              ),
              16.height,

              // Subscription End Date section
              AppText(
                'تاريخ التجديد',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              8.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder<String?>(
                      valueListenable:
                          careUsageCubit.filterEntity.endFromNotifier,
                      builder: (context, value, child) {
                        return CustomDateTimePicker(
                          hintText: 'من',
                          dateTimeController:
                              TextEditingController(text: value),
                          dateTimeType: DateTimeEnum.date,
                          onDateChange: (dateTime, formattedDate) {
                            careUsageCubit.filterEntity.endFromNotifier.value =
                                formattedDate;
                          },
                          style2: true,
                        );
                      },
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: ValueListenableBuilder<String?>(
                      valueListenable:
                          careUsageCubit.filterEntity.endToNotifier,
                      builder: (context, value, child) {
                        return CustomDateTimePicker(
                          hintText: 'إلى',
                          dateTimeController:
                              TextEditingController(text: value),
                          dateTimeType: DateTimeEnum.date,
                          onDateChange: (dateTime, formattedDate) {
                            careUsageCubit.filterEntity.endToNotifier.value =
                                formattedDate;
                          },
                          style2: true,
                        );
                      },
                    ),
                  ),
                ],
              ),

              8.verticalSpace,
              // Subscription Start Date section
              AppText(
                'تاريخ الاشتراك',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder<String?>(
                      valueListenable:
                          careUsageCubit.filterEntity.startFromNotifier,
                      builder: (context, value, child) {
                        return CustomDateTimePicker(
                          hintText: 'من',
                          dateTimeController:
                              TextEditingController(text: value),
                          dateTimeType: DateTimeEnum.date,
                          onDateChange: (dateTime, formattedDate) {
                            careUsageCubit.filterEntity.startFromNotifier
                                .value = formattedDate;
                          },
                          style2: true,
                        );
                      },
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: ValueListenableBuilder<String?>(
                      valueListenable:
                          careUsageCubit.filterEntity.startToNotifier,
                      builder: (context, value, child) {
                        return CustomDateTimePicker(
                          hintText: 'إلى',
                          dateTimeController:
                              TextEditingController(text: value),
                          dateTimeType: DateTimeEnum.date,
                          onDateChange: (dateTime, formattedDate) {
                            careUsageCubit.filterEntity.startToNotifier.value =
                                formattedDate;
                          },
                          style2: true,
                        );
                      },
                    ),
                  ),
                ],
              ),

              8.verticalSpace,
              // Last Activity section (now numeric instead of date)
              AppText(
                'آخر نشاط',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              4.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder<String?>(
                      valueListenable:
                          careUsageCubit.filterEntity.lastActivityFromNotifier,
                      builder: (context, value, child) {
                        return TextField(
                          decoration: InputDecoration(
                            hintText: 'من',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(text: value),
                          onChanged: (value) {
                            careUsageCubit.filterEntity.lastActivityFromNotifier
                                .value = value.isNotEmpty ? value : null;
                          },
                        );
                      },
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: ValueListenableBuilder<String?>(
                      valueListenable:
                          careUsageCubit.filterEntity.lastActivityToNotifier,
                      builder: (context, value, child) {
                        return TextField(
                          decoration: InputDecoration(
                            hintText: 'إلى',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(text: value),
                          onChanged: (value) {
                            careUsageCubit.filterEntity.lastActivityToNotifier
                                .value = value.isNotEmpty ? value : null;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              16.verticalSpace, 
              AppText(
                'حالة العميل',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.verticalSpace,
              ValueListenableBuilder<String?>(
                valueListenable: careUsageCubit.filterEntity.stateNotifier,
                builder: (context, value, child) {
                  return CustomDropDown<String>(
                    hint: 'حالة العميل',
                    items: ['online', 'rare', 'not'],
                    selectedItem: value,
                    compareFn: (item, selectedItem) => item == selectedItem,
                    itemAsString: (item) => item ?? '',
                    onChanged: (value) {
                      if (value == null) return;
                      careUsageCubit.filterEntity.stateNotifier.value = value;
                    },
                  );
                },
                ),

              16.verticalSpace,
              // Premium Section
              AppText(
                'عميل تميز',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.verticalSpace,
              ValueListenableBuilder<String?>(
                valueListenable: careUsageCubit.filterEntity.premiumNotifier,
                builder: (context, value, child) {
                  return CustomDropDown<String>(
                    hint: 'النوع المميز',
                    items: ['1', 'not'],
                    selectedItem: value,
                    compareFn: (item, selectedItem) => item == selectedItem,
                    itemAsString: (item) => item == '1' ? 'مميز' : 'غير مميز',
                    onChanged: (value) {
                      if (value == null) return;
                      careUsageCubit.filterEntity.premiumNotifier.value = value;
                    },
                  );
                },
              ),

              16.verticalSpace,
              // Package Section
              AppText(
                'الباقة',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.verticalSpace,
              ValueListenableBuilder <List<String?>>(
                valueListenable: careUsageCubit.filterEntity.packageNotifier ,
                builder: (context, value, child) {
                  return CustomMultiSelectionDropdown<String>(
                    hint: 'اختر الباقة',
                    items: ['الباقة الأساسية', 'باقة المتقدمة', 'الباقة الكاملة' ,'الباقة الأولى','الباقة المتقدمة -نظام المطاعم','الباقة الأساسية-نظام المطاعم','المتاجر الإلكترونية','ERP SLAS' ],
                    selectedItems:  careUsageCubit.filterEntity.packageNotifier.value,
                    compareFn: (item, selectedItem) => item == selectedItem,
                    itemAsString: (item) => item ?? '',
                    onSave: (value) {
                      if (value == null) return;
                      careUsageCubit.filterEntity.packageNotifier.value = value;
                    },
                  );
                },
              ),

              16.verticalSpace,
              // Region Section
              AppText(
                'المنطقة',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.verticalSpace,
              BranchSearchableDropDown(
                selectedBranchId: careUsageCubit
                    .filterEntity.fkRegoinNotifier.value
                    ?.toString(),
                onSelected: (branch) {
                  if (branch == null) return;
                  careUsageCubit.filterEntity.fkRegoinNotifier.value =
                      int.tryParse(branch.branchId ?? '0');
                },
              ),

              16.verticalSpace,
              // Activity Type Section - Updated to match FilterClientsSheet
              AppText(
                'نوع النشاط',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.verticalSpace,
              Consumer<ActivityProvider>(
                builder: (context, activityVm, child) {
                  return ValueListenableBuilder<int?>(
                    valueListenable:
                        careUsageCubit.filterEntity.activityTypeFkNotifier,
                    builder: (context, selectedActivity, _) {
                      return CustomSearchableDropDown<ActivityModel>(
                        hint: 'النشاط',
                        items: activityVm.activitiesList,
                        compareFn: (item, selectedItem) =>
                            item.id_activity_type ==
                            selectedItem.id_activity_type,
                        itemAsString: (u) => u!.userAsString(),
                        onChanged: (data) {
                          if (data == null) return;
                          careUsageCubit.filterEntity.activityTypeFkNotifier
                              .value = int.parse(data.id_activity_type!);
                        },
                        selectedItem: activityVm.activitiesList
                            .firstWhereOrNull((element) =>
                                int.parse(element.id_activity_type!) ==
                                selectedActivity),
                        filterFn: (user, filter) =>
                            user.getFilterActivityType(filter),
                      );
                    },
                  );
                },
              ),

              10.verticalSpace,
              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: AppElevatedButton(
                      text: 'إعادة تعيين',
                      onPressed: () {
                        careUsageCubit.filterEntity.reset();
                        Navigator.pop(context);
                      },
                      appButtonStyle: AppButtonStyle.secondary,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: AppElevatedButton(
                      text: 'تطبيق',
                      onPressed: () {
                        careUsageCubit.applyFilters();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
