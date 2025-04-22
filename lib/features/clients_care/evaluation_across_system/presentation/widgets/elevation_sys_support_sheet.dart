import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/sys_support_rating_bloc.dart';

class FilterElevationSysSupportSheet extends StatefulWidget {
  const FilterElevationSysSupportSheet({super.key});

  @override
  State<FilterElevationSysSupportSheet> createState() => _FilterElevationSysSupportSheet();
}

class _FilterElevationSysSupportSheet extends State<FilterElevationSysSupportSheet> {
  late final SysSupportRatingBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<SysSupportRatingBloc>();

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
                listenable: _bloc.filterEntity,
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _bloc.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _bloc.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
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
                    dateTimeController: _bloc.filterEntity.dateFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _bloc.filterEntity.dateToController,
                    style2: true,
                  ),
                ),
              ],
            ),
            10.height,
            ValueListenableBuilder(
              valueListenable: _bloc.filterEntity.rateNotifier,
              builder: (context, rateNoti, child) => Align(
                alignment: Alignment.centerRight,
                child: AppRateWidget(
                  title: 'التقييم',
                  rateValue: rateNoti ?? 0,
                  initialRating: rateNoti ?? 0,
                  isReadOnly: false,
                  onRatingUpdate: (value) {
                    _bloc.filterEntity.rateNotifier.value = value;
                  },
                ),
              ),
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
    _bloc.add(GetListSysOrSupportRatingEvent());
    // _cubit.getPeriodicCommunication();
    AppNavigator.pop(result: true);
  }
}
