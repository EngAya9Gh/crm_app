import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../../../../features/clients_care/clients_tickets/presentation/widgets/ticket_card.dart';
import '../../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../../model/clientmodel.dart';
import 'ticket_all.dart';

class TicketProfile extends StatelessWidget {
  const TicketProfile({
    Key? key,
    required this.itemClient,
  });

  final ClientModel1 itemClient;

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
                  if (state is ClientsTicketsLoading ||
                      state is GetTicketsLoading) {
                    return CustomLoadingIndicator();
                  } else if (state is ClientsTicketsError) {
                    return CustomErrorWidget(
                      message: state.message,
                    );
                  } else if (state is ClientsTicketsLoaded &&
                      ticketCubit.clientTicketsList.isEmpty) {
                    return CustomErrorWidget(
                      message: 'لا يوجد تذاكر',
                    );
                  }
                  // return SizedBox();
                  return Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppNavigator.push(TicketAll());
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kMainColor,
                            ),
                            child: Text(
                              'عدد التذاكر التي فتحت للعميل ${ticketCubit.clientTicketsList.length}',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontFamily: kfontfamily2,
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
                                    ticket:
                                        ticketCubit.clientTicketsList[index],
                                    details: ticketCubit
                                                .clientTicketsList[index]
                                                .dateClose ==
                                            null
                                        ? ticketCubit.clientTicketsList[index]
                                            .detailsProblem
                                        : ticketCubit.clientTicketsList[index]
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
