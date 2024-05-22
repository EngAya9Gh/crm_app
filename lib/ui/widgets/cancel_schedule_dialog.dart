import 'dart:ui' as myui;

import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/calendar/event_model.dart';
import '../../view_model/event_provider.dart';

class CancelScheduleDialog extends StatefulWidget {
  String? idClientsDate;
  final EventModel event;

  CancelScheduleDialog({
    Key? key,
    required this.idClientsDate,
    required this.event,
  }) : super(key: key);

  @override
  State<CancelScheduleDialog> createState() => _CancelScheduleDialogState();
}

class _CancelScheduleDialogState extends State<CancelScheduleDialog> {
  late EventProvider _eventProvider;
  late final InvoiceVm invoiceVm;

  void initState() {
    invoiceVm = context.read<InvoiceVm>();
    _eventProvider = context.read<EventProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      // elevation: 0,
      // titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
      // insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      // contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      // title: Center(child: Text('title', style: TextStyle(fontFamily: kfontfamily2))),
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Form(
                child: Column(
                  children: [
                    Consumer<InvoiceVm>(
                      builder: (context, value, child) {
                        if (value.isloading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Directionality(
                          textDirection: myui.TextDirection.rtl,
                          child: AlertDialog(
                            title: Text('التأكيد'),
                            content: Text('هل تريد إلغاء الزيارة'),
                            actions: <Widget>[
                              Consumer<InvoiceVm>(builder: (context, val, _) {
                                return Row(
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
                                        isLoading:
                                            val.isloadingRescheduleOrCancel,
                                        onPressed: () async {
                                          await invoiceVm.cancelSchedule_vm(
                                            scheduleId: widget.idClientsDate!,
                                            onSuccess: (value) {
                                              AppNavigator.pop();
                                              AppConstants.showSnakeBar(
                                                context,
                                                'تم إلغاء الزيارة',
                                              );
                                              _eventProvider.getAppointments();
                                              // todo: check this
                                              // _eventProvider.editEvent(
                                              //     widget.event
                                              //         .copyWith(isDone: "2"),
                                              //     widget.event);
                                              // setState(() {});
                                            },
                                          );
                                        },
                                        child: Text('نعم'),
                                      ),
                                    ),
                                  ],
                                );
                              }),
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
}
