import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../data/models/ticket_model.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';
import 'custom_ticket_details_action_button.dart';

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
    return CustomTicketDetailsActionButton(
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
                        child: EditTextFormField(
                          paddcustom: EdgeInsets.all(10),
                          maxline: 4,
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
                      ),
                      contentPadding: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 0),
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
      text: 'إعادة فتح التذكرة',
    );
  }
}
