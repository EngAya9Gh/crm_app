import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/ticket_model.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';

class ReceiveTicketButton extends StatelessWidget {
  const ReceiveTicketButton({
    super.key,
    required this.ticketModel,
  });

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    final EditTicketCubit editTicketCubit = context.read<EditTicketCubit>();
    return AppElevatedButton(
      text: 'استلام التذكرة',
      onPressed: () async {
        AppConstants.showAppDialog(
          child: BlocBuilder<EditTicketCubit, EditTicketState>(
            builder: (context, state) {
              return AppDialog(
                title: 'تأكيد استلام التذكرة',
                children: [
                  AppText('هل أنت متأكد من استلام التذكرة؟'),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppElevatedButton(
                        text: 'إلغاء',
                        onPressed: () => AppNavigator.pop(),
                      ),
                      (state is EditTicketLoading)
                          ? AppLoader()
                          : AppElevatedButton(
                              text: 'استلام التذكرة',
                              onPressed: () async {
                                await _onReceiveTicket(editTicketCubit);
                              },
                            ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
        return;
        showDialog(
            context: context,
            builder: (context) {
              return BlocBuilder<EditTicketCubit, EditTicketState>(
                builder: (context, state) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      title: AppText('تأكيد استلام التذكرة'),
                      content: AppText('هل أنت متأكد من استلام التذكرة؟'),
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      actions: [
                        (state is EditTicketLoading)
                            ? AppLoader()
                            : TextButton(
                                onPressed: () async {
                                  await _onReceiveTicket(editTicketCubit);
                                },
                                child: AppText('استلام التذكرة'),
                              ),
                        TextButton(
                            onPressed: () => AppNavigator.pop(),
                            child: AppText('إلغاء')),
                      ],
                    ),
                  );
                },
              );
            });
      },
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
