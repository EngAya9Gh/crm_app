import 'package:crm_smart/core/common/enums/ticket_types_enum.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../data/models/ticket_model.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';

class ReopenTicketButton extends StatefulWidget {
  const ReopenTicketButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  State<ReopenTicketButton> createState() => _ReopenTicketButtonState();
}

class _ReopenTicketButtonState extends State<ReopenTicketButton> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return BlocBuilder<EditTicketCubit, EditTicketState>(
                  builder: (context, state) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlertDialog(
                        title: Text('إعادة فتح التذكرة'),
                        // notes field
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              EditTextFormField(
                                paddcustom: EdgeInsets.all(10),
                                maxline: 5,
                                hintText: 'ملاحظات الإعادة',
                                obscureText: false,
                                controller: notesController,
                                vaildator: (value) {
                                  if (value?.trim().isEmpty ?? true) {
                                    return AppStrings.messageEmpty;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        actions: [
                          state is EditTicketLoading
                              ? CircularProgressIndicator()
                              : TextButton(
                                  onPressed: () async {
                                    _formKey.currentState?.save();
                                    if (!_formKey.currentState!.validate())
                                      return;
                                    await context
                                        .read<EditTicketCubit>()
                                        .editTicketType(EditTicketTypeParams(
                                          idTicket: widget.ticketModel.idTicket,
                                          typeTicket:
                                              TicketTypesEnum.reopen.nameEn,
                                          notes: notesController.text,
                                        ));
                                    AppNavigator.pop();
                                  },
                                  child: Text('نعم'),
                                ),
                          TextButton(
                            onPressed: () => AppNavigator.pop(),
                            child: Text('إلغاء'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              });
        },
        child: Text(
          'إعادة فتح\nالتذكرة',
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
