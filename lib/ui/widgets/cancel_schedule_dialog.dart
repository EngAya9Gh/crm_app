
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;
import '../../constants.dart';
import '../../model/calendar/event.dart';
import '../../view_model/event_provider.dart';


class CancelScheduleDialog extends StatefulWidget {
  String? idClientsDate;
   final Event event ;
  CancelScheduleDialog({Key? key,required this.idClientsDate,required this.event}) : super(key: key);

  @override
  State<CancelScheduleDialog> createState() => _CancelScheduleDialogState();
}

class _CancelScheduleDialogState extends State<CancelScheduleDialog> {
  late EventProvider _eventProvider;

  void initState() {
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
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Form(
                child: Column(
                  children: [
                   
                    Consumer<invoice_vm>(
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
                                    Consumer<invoice_vm>(builder: (context, val, _) {
                                      return Column(
                                        children: [
                                          SizedBox(height: 10),
                                          if (val.isloadingRescheduleOrCancel)
                                            Center(child: CircularProgressIndicator())
                                          else
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                    onPressed: () {
                                                      Navigator.of(context, rootNavigator: true).pop(false); // dismisses only the dialog and returns false
                                                    },
                                                    child: Text('لا'),
                                                  ),
                                                ),
                                                20.horizontalSpace,
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all(kMainColor)),
                                                    onPressed: () async {
                                                         Provider.of<invoice_vm>(context, listen: false)
                                                            .cancelSchedule_vm(
                                                            scheduleId: widget.idClientsDate!,
                                                            onSuccess: (value) {
                                                               _eventProvider.editEvent(widget.event.copyWith(isDone: "2"),widget.event);
                                                            },
                                                          ).then((value) {
                                                            // Navigator.of(context, rootNavigator: true).pop(false);
                                                            Navigator.pop(context, true);
                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar( content: Text("تم إلغاء الزيارة ",
                                                                       textDirection: TextDirection.rtl )) );
                                                            // clear();

                                                            // datesInstallation.add(DateInstallationClient(
                                                            //   date_client_visit: datetask,
                                                            //   fk_user: idUser,
                                                            //   fk_client: widget.idClient,
                                                            //   is_done: '0',
                                                            //   fk_invoice: widget.invoice!.idInvoice,
                                                            // ));

                                                            setState(() {});
                                                          });

                                                    },
                                                    child: Text('نعم'),
                                                  ),
                                                ),
                                              ],
                                            )
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