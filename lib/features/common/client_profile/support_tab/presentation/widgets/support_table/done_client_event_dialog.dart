import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoneClientEventDialog extends StatefulWidget {
  const DoneClientEventDialog({
    super.key,
    required this.event,
  });

  final EventModel event;

  @override
  State<DoneClientEventDialog> createState() => _DoneClientEventDialogState();
}

class _DoneClientEventDialogState extends State<DoneClientEventDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                                    event: widget.event.copyWith(
                                      comment: _commentController.text,
                                    ),
                                    onLoading: () {},
                                    onSuccess: () {},
                                    onFailure: () {},
                                  );
                              context
                                  .read<InvoiceVm>()
                                  .updateListInvoiceAfterMarkEventIsDone(
                                      widget.event);
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
  }
}
