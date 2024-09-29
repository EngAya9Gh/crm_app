import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/models/client_model.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../../../../features/clients_care/clients_tickets/presentation/widgets/ticket_card.dart';
import '../../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import 'ticket_all.dart';

class TicketProfile extends StatelessWidget {
  const TicketProfile({
    super.key,
    required this.itemClient,
  });

  final ClientModel itemClient;

  @override
  Widget build(BuildContext context) {
    final TicketsCubit ticketCubit = context.read<TicketsCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              AddManualTaskButton(
                list: ticketPublicTypeList,
                clientId: itemClient.idClients,
              ),
              BlocBuilder<TicketsCubit, TicketsState>(
                builder: (context, state) {
                  return state.getClientsTicketsStatus.when(
                    success: (data) {
                      return Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                AppNavigator.go(
                                  TicketAll(),
                                  isNew: false,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primaryMain,
                                ),
                                child: Text(
                                  'عدد التذاكر التى فتحت للعميل ${ticketCubit.clientTicketsList.length}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontFamily: AppFonts.fontFamily1,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: ListView.builder(
                                itemCount: ticketCubit.clientTicketsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TicketCard(
                                        ticket: ticketCubit
                                            .clientTicketsList[index],
                                        details: ticketCubit
                                                    .clientTicketsList[index]
                                                    .dateClose ==
                                                null
                                            ? ticketCubit
                                                .clientTicketsList[index]
                                                .detailsProblem
                                            : ticketCubit
                                                .clientTicketsList[index]
                                                .notesTicket,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    failure: (error, data) => AppErrorWidget(
                      message: error,
                      onPressed: () {
                        ticketCubit.getClientTicket(itemClient.idClients!);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
