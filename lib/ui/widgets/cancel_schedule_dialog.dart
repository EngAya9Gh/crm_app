import 'dart:ui' as myui;

import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/calendar/event_model.dart';
import '../../view_model/event_provider.dart';

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
                            insetPadding: EdgeInsets.all(10),
                            contentPadding: EdgeInsets.all(10),
                            actionsPadding: EdgeInsets.all(10),
                            titlePadding: EdgeInsets.all(10),
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
                                          await _onTapOk(context);
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

  Future<void> _onTapOk(BuildContext context) async {
    await invoiceVm.cancelSchedule_vm(
      scheduleId: widget.idClientsDate!,
      onSuccess: (value) {
        AppNavigator.pop();
        AppConstants.showSnakeBar(
          context,
          'تم إلغاء الزيارة',
        );
        BlocProvider.of<SupportTabCubit>(context).getDateInstallation(
          GetDateInstallationParams(
            fkCountry: AppConstants.currentCountry(context)!,
          ),
          onSuccess: (eventsList) {
            _eventProvider.handleEventsMap(eventsList);
          },
        );
      },
    );
  }
}
