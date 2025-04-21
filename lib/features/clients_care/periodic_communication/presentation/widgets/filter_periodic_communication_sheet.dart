import 'package:crm_smart/core/common/enums/periodic_communication_type_enum.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/common/branches/presentation/pages/branch_searchable_drop_down.dart';
import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/periodic_communication_client_type_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/periodic_communication_cubit.dart';

class FilterPeriodicCommunicationSheet extends StatefulWidget {
  const FilterPeriodicCommunicationSheet({super.key});

  @override
  State<FilterPeriodicCommunicationSheet> createState() => _FilterPeriodicCommunicationSheetState();
}

class _FilterPeriodicCommunicationSheetState extends State<FilterPeriodicCommunicationSheet> {
  late final PeriodicCommunicationCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PeriodicCommunicationCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            StatefulBuilder(
              builder: (context, refresh) {
                return SwitchListTile(
                  value: _cubit.filterEntity.isMyClientsNotifier.value,
                  onChanged: (value) {
                    _cubit.filterEntity.isMyClientsNotifier.value = value;
                    refresh(() {});
                    if (value) {
                      _cubit.filterEntity.userIdNotifier.value = AppConstants.currentUser.idUser;
                    } else {
                      _cubit.filterEntity.userIdNotifier.value = null;
                    }
                  },
                  title: AppText("عملائي"),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _cubit.filterEntity.isClientWhoNotRate,
              builder: (context, value, child) => SwitchListTile(
                value: value,
                onChanged: (value) {
                  _cubit.filterEntity.isClientWhoNotRate.value = value;
                },
                title: AppText("استثناء العملاء الذين قيموا عبر النظام"),
              ),
            ),
            if (_cubit.pageVariables.periodicCommunicationType.isEvaluated) ...[
              10.height,
              ValueListenableBuilder(
                valueListenable: _cubit.filterEntity.clientIsUseOffline,
                builder: (context, value, child) => SwitchListTile(
                  value: value,
                  onChanged: (value) {
                    _cubit.filterEntity.clientIsUseOffline.value = value;
                  },
                  title: AppText("يستخدم offline "),
                ),
              ),
              10.height,
              Padding(
                padding: const EdgeInsets.only(right: 5, bottom: 2),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AppText('تاريخ التقييم'),
                ),
              ),
              10.height,
              Row(
                children: [
                  Flexible(
                    child: CustomDateTimePicker(
                      hintText: 'من تاريخ',
                      dateTimeType: DateTimeEnum.date,
                      dateTimeController: _cubit.filterEntity.dateFromController,
                      style2: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: CustomDateTimePicker(
                      hintText: 'الي تاريخ',
                      dateTimeType: DateTimeEnum.date,
                      dateTimeController: _cubit.filterEntity.dateToController,
                      style2: true,
                    ),
                  ),
                ],
              ),
              10.height,
              ValueListenableBuilder(
                valueListenable: _cubit.filterEntity.showAllRates,
                builder: (context, showAll, child) => CheckboxListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: showAll,
                  title: AppText('اظهار كل التقييمات '),
                  onChanged: (value) {
                    _cubit.filterEntity.showAllRates.value = value ?? false;
                    _cubit.filterEntity.rateNotifier.value = null;
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _cubit.filterEntity.rateNotifier,
                builder: (context, rateNoti, child) => ValueListenableBuilder(
                  valueListenable: _cubit.filterEntity.showAllRates,
                  builder: (context, showAll, child) => Align(
                    alignment: Alignment.centerRight,
                    child: AppRateWidget(
                      title: 'التقييم',
                      rateValue: rateNoti ?? 0,
                      initialRating: rateNoti ?? 0,
                      isReadOnly: showAll,
                      onRatingUpdate: (value) {
                        _cubit.filterEntity.rateNotifier.value = value;
                      },
                    ),
                  ),
                ),
              ),
            ],
            if (_cubit.pageVariables.periodicCommunicationType.isWaiting) ...[
              CustomDropDown<PeriodicCommunicationClientTypeEnum>(
                hint: "نوع العميل",
                items: PeriodicCommunicationClientTypeEnum.values,
                compareFn: (item, selectedItem) => item.index == selectedItem.index,
                itemAsString: (item) => item!.value,
                selectedItem: _cubit.filterEntity.type.value,
                onChanged: (value) => _cubit.filterEntity.type.value = value,
              )
            ],
            10.height,
            BranchSearchableDropDown(
              selectedBranchId: _cubit.filterEntity.regionNotifier.value?.branchId,
              onSelected: (value) {
                _cubit.filterEntity.regionNotifier.value = value;
              },
            ),
            20.height,
            AppElevatedButton(
              text: "فلترة",
              onPressed: () => _filterAndCloseDialog(),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _cubit.getPeriodicCommunication();
    AppNavigator.pop(result: true);
  }
}
