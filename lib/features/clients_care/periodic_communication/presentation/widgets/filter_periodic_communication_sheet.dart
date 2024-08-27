import 'package:crm_smart/core/common/enums/periodic_communication_type_enum.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/common/branches/presentation/pages/branch_searchable_drop_down.dart';
import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/periodic_communication_cubit.dart';

class FilterPeriodicCommunicationSheet extends StatefulWidget {
  const FilterPeriodicCommunicationSheet({super.key});

  @override
  State<FilterPeriodicCommunicationSheet> createState() =>
      _FilterPeriodicCommunicationSheetState();
}

class _FilterPeriodicCommunicationSheetState
    extends State<FilterPeriodicCommunicationSheet> {
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
                      _cubit.filterEntity.userIdNotifier.value =
                          AppConstants.currentUser.idUser;
                    } else {
                      _cubit.filterEntity.userIdNotifier.value = null;
                    }
                  },
                  title: AppText("عملائي"),
                );
              },
            ),
            if (_cubit.pageVariables.periodicCommunicationType.isEvaluated) ...[
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
                      dateTimeController:
                          _cubit.filterEntity.dateFromController,
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
              Align(
                alignment: Alignment.centerRight,
                child: AppRateWidget(
                  context: context,
                  title: 'التقييم',
                  rateValue: _cubit.filterEntity.rateNotifier.value ?? 0,
                  initialRating: _cubit.filterEntity.rateNotifier.value ?? 0,
                  onRatingUpdate: (value) {
                    _cubit.filterEntity.rateNotifier.value = value;
                  },
                ),
              ),
            ],
            10.height,
            BranchSearchableDropDown(
              selectedBranchId:
                  _cubit.filterEntity.regionNotifier.value?.branchId,
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
