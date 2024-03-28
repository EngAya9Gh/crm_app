import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../data/models/ticket_model.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';

class ReceiveTicketButton extends StatelessWidget {
  const ReceiveTicketButton({
    Key? key,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    final EditTicketCubit editTicketCubit = context.read<EditTicketCubit>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kMainColor)),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return BlocBuilder<EditTicketCubit, EditTicketState>(
                      builder: (context, state) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            title: Text('تأكيد استلام التذكرة'),
                            content: Text('هل أنت متأكد من استلام التذكرة؟'),
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            actions: [
                              (state is EditTicketLoading)
                                  ? CustomLoadingIndicator(isCentered: false)
                                  : TextButton(
                                      onPressed: () async {
                                        await _onReceiveTicket(editTicketCubit);
                                      },
                                      child: Text('استلام التذكرة'),
                                    ),
                              TextButton(
                                  onPressed: () => AppNavigator.pop(),
                                  child: Text('إلغاء')),
                            ],
                          ),
                        );
                      },
                    );
                  });
            },
            child: Text('استلام\nالتذكرة')),
      ),
    );
  }

  Future<void> _onReceiveTicket(EditTicketCubit editTicketCubit) async {
    await editTicketCubit.editTicketType(EditTicketTypeParams(
      idTicket: ticketModel.idTicket,
      typeTicket: TicketTypesEnum.receive.nameEn,
      notes: '',
    ));

    AppNavigator.pop();
  }
}
