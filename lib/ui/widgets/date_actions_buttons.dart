import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../core/common/widgets/custom_loading_indicator.dart';
import '../../core/utils/app_navigator.dart';
import '../../features/app/presentation/widgets/app_elvated_button.dart';
import '../../features/manage_agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import '../../model/calendar/event_model.dart';
import '../../view_model/event_provider.dart';
import '../../view_model/invoice_vm.dart';
import '../screen/client/profileclient.dart';
import 'cancel_schedule_dialog.dart';
import 'reschedule_dialog.dart';

class DateActionsButtons extends StatefulWidget {
  const DateActionsButtons({
    Key? key,
    required this.eventModel,
    required this.selectedEvents,
    this.selectedDay,
  }) : super(key: key);

  final EventModel eventModel;
  final ValueNotifier<List<EventModel>> selectedEvents;
  final DateTime? selectedDay;

  @override
  State<DateActionsButtons> createState() => _DateActionsButtonsState();
}

class _DateActionsButtonsState extends State<DateActionsButtons> {
  late final EventProvider eventProvider;
  late final EventModel eventModel;

  @override
  void initState() {
    eventProvider = context.read<EventProvider>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: Column(
          children: [
            Consumer<EventProvider>(
              builder: (context, eventProvider, _) {
                if (eventProvider.isloadingDoneEvent) {
                  return SizedBox(
                    height: 20,
                    width: 20,
                    child: CustomLoadingIndicator(),
                  );
                }
                return InkWell(
                  child: Text("تمت الزيارة",
                      style: context.textTheme.labelLarge?.copyWith(
                          color: context.theme.primaryColor,
                          fontFamily: kfontfamily2,
                          fontWeight: FontWeight.w600)),
                  onTap: () async {
                    await _onEventSelected(widget.eventModel);
                  },
                );
              },
            ),
            const SizedBox(height: 4),
            InkWell(
              child: Text("إعادة جدولة",
                  style: context.textTheme.labelLarge?.copyWith(
                      color: context.theme.primaryColor,
                      fontFamily: kfontfamily2,
                      fontWeight: FontWeight.w600)),
              onTap: () async {
                EventModel tempEvent = widget.eventModel;
                final EventModel? editedEvent = await showDialog<dynamic>(
                    context: context,
                    builder: (context) => ReScheduleDialog(
                          event: tempEvent,
                          idClientsDate: widget.eventModel.idClientsDate!,
                          idClient: widget.eventModel.fkIdClient!,
                          idinvoice: widget.eventModel.idinvoice!,
                          time_from: widget.eventModel.from,
                          time_to: widget.eventModel.to,
                          datecurrent: widget.eventModel.from,
                          typedate: widget.eventModel.typedate,
                        ));
                if (editedEvent != null) {}
              },
            ),
            const SizedBox(height: 4),
            InkWell(
              child: Text("إلغاء",
                  style: context.textTheme.labelLarge?.copyWith(
                      color: context.theme.primaryColor,
                      fontFamily: kfontfamily2,
                      fontWeight: FontWeight.w600)),
              onTap: () async {
                var status = await showDialog<dynamic>(
                    context: context,
                    builder: (context) => CancelScheduleDialog(
                          idClientsDate: widget.eventModel.idClientsDate,
                          event: widget.eventModel,
                        ));
                if (status == true) {
                  setState(() {});
                }
              },
            ),
          ],
        ));
  }

  @Deprecated('Use _onEventSelected instead')
  _navigateToProfileOnEventTap(EventModel event) {
    if (event.agentName != null) {
      AppNavigator.push(AgentProfilePage(
        agent: event.agent!,
        tabIndex: 3,
      ));
    } else {
      AppNavigator.push(
        ProfileClient(
          idClient: event.fkIdClient,
          event: event,
          tabIndex: 2,
        ),
      );
    }
  }

  _onEventSelected(EventModel event) async {
    // if (event.agentName != null) {
    //   await context.read<EventProvider>().changeEventToDone(
    //         event: event,
    //         onLoading: () {},
    //         onSuccess: () => context
    //             .read<invoice_vm>()
    //             .updateListInvoiceAfterMarkEventIsDone(
    //               event,
    //             ),
    //         onFailure: () {},
    //       );
    // } else {
    //   return await _onClientEventSelected(event);
    // }
    return await _onClientEventSelected(event);
  }

  Future<bool?> _onClientEventSelected(EventModel event) async {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _commentController = TextEditingController();
    bool isLoading = false;
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(true),
          child: SimpleDialog(
            title: Text(
              "إغلاق الجدولة",
              textAlign: TextAlign.center,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: "أكتب تعليقك هنا",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          maxLines: 3,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "التعليق مطلوب";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        StatefulBuilder(
                          builder: (context, refreshState) {
                            return AppElevatedButton(
                              isLoading: isLoading,
                              text: "حفظ",
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  refreshState(() => isLoading = true);
                                  await context
                                      .read<EventProvider>()
                                      .changeEventToDone(
                                        event: event.copyWith(
                                          comment: _commentController.text,
                                        ),
                                        onLoading: () {},
                                        onSuccess: () {},
                                        onFailure: () {},
                                      );
                                  context
                                      .read<invoice_vm>()
                                      .updateListInvoiceAfterMarkEventIsDone(
                                          event);
                                  refreshState(() => isLoading = false);
                                  AppNavigator.pop(result: true);
                                  isLoading = false;
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
