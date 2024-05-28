import 'dart:ui' as myui;

import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/common/enums/type_process_date.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart';
import 'package:crm_smart/features/support/dates_table/presentation/manager/dates_table_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/calendar/event_model.dart';

class CancelScheduleDialog extends StatefulWidget {
  final String? idClientsDate;
  final EventModel event;

  const CancelScheduleDialog({
    super.key,
    required this.idClientsDate,
    required this.event,
  });

  @override
  State<CancelScheduleDialog> createState() => _CancelScheduleDialogState();
}

class _CancelScheduleDialogState extends State<CancelScheduleDialog> {
  late final DatesTableCubit datesTableCubit;

  void initState() {
    datesTableCubit = context.read<DatesTableCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Form(
                child: Column(
                  children: [
                    BlocBuilder<DatesTableCubit, DatesTableState>(
                      builder: (context, state) {
                        return Directionality(
                          textDirection: myui.TextDirection.rtl,
                          child: AlertDialog(
                            insetPadding: EdgeInsets.all(10),
                            contentPadding: EdgeInsets.all(10),
                            actionsPadding: EdgeInsets.all(10),
                            titlePadding: EdgeInsets.all(10),
                            title: Text('التأكيد'),
                            content: Text('هل تريد إلغاء الزيارة'),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: AppElevatedButton(
                                      onPressed: () => AppNavigator.pop(),
                                      child: Text('لا'),
                                    ),
                                  ),
                                  20.horizontalSpace,
                                  Expanded(
                                    child: AppElevatedButton(
                                      isLoading: state.cancelScheduleStatus
                                          .isLoading(),
                                      onPressed: () async {
                                        await _onTapOk(context);
                                      },
                                      child: Text('نعم'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Future<void> _onTapOk(BuildContext context) async {
    await datesTableCubit.cancelSchedule(
      CancelScheduleParams(
        scheduleId: widget.idClientsDate!,
        typeProcess: TypeProcessDate.cancel.value,
      ),
      onSuccess: (value) {
        AppNavigator.pop(
          result: widget.event.copyWith(isDone: IsDoneDateEnum.canceled.value),
        );
        AppConstants.showSnakeBar(
          context,
          'تم إلغاء الزيارة',
        );
      },
      onFail: (value) {
        AppConstants.showSnakeBar(
          context,
          'حدث خطأ ما',
        );
      },
    );
  }
}
