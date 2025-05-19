import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/sys_support_rating_bloc.dart';

class FilterElevationSysSupportSheet extends StatefulWidget {
  const FilterElevationSysSupportSheet({super.key});

  @override
  State<FilterElevationSysSupportSheet> createState() =>
      _FilterElevationSysSupportSheet();
}

class _FilterElevationSysSupportSheet
    extends State<FilterElevationSysSupportSheet> {
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
            Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 2),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText('التقييم'),
              ),
            ),
            10.height,
            ValueListenableBuilder<List<double>>(
              valueListenable: _bloc.filterEntity.rateNotifier,
              builder: (context, rates, child) {
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        List<double> tempRates = List.from(rates);
                        return StatefulBuilder(builder: (context, setState) {
                          return AlertDialog(
                            title: AppText('اختر التقييم'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (index) {
                                final rate = (index + 1).toDouble();
                                final isSelected = tempRates.contains(rate);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        tempRates.remove(rate);
                                      } else {
                                        tempRates.add(rate);
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppRateWidget(
                                          rateValue: rate,
                                          initialRating: rate,
                                          isReadOnly: true,
                                          iconSize: 24,
                                        ),
                                        if (isSelected)
                                          Icon(
                                            Icons.check,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 20,
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: AppText('إلغاء'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _bloc.filterEntity.rateNotifier.value =
                                      tempRates;
                                  Navigator.of(context).pop();
                                },
                                child: AppText('تم'),
                              ),
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          rates.isEmpty
                              ? 'اختر التقييم'
                              : '${rates.length} تقييم محدد',
                          style: TextStyle(
                            color: rates.isEmpty ? Colors.grey : Colors.black,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                );
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
    _bloc.add(GetListSysOrSupportRatingEvent());
    // _cubit.getPeriodicCommunication();
    AppNavigator.pop(result: true);
  }
}
