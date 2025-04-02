import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/event_model.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/common/client_profile/client_activities_tab/presentation/manager/client_activities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../data/models/client_date_model.dart';
import '../manager/clients_dates_cubit.dart';
import '../widgets/client_dates_calendar.dart';
import '../../../../../../core/common/widgets/add_action_button.dart';
import '../../../../../clients_care/crud_activites/presentation/pages/add_activity_page.dart';
import '../../../../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../../../../../../features/clients_care/clients_tickets/presentation/pages/add_ticket_page.dart';
import '../../../../../../features/common/client_profile/tasks_tab/presentation/manager/client_task_bloc.dart';
import '../../../../../../features/common/client_profile/tasks_tab/domain/use_cases/get_client_tasks_usecase.dart';
import '../widgets/activity_card.dart';
import '../widgets/task_card_new.dart';
import '../widgets/ticket_card.dart';
import '../widgets/date_card.dart';

class ClientsDatesPageMob extends StatefulWidget {
  const ClientsDatesPageMob({Key? key, required this.client}) : super(key: key);
  final ClientModel client;

  @override
  State<ClientsDatesPageMob> createState() => _ClientsDatesPageMobState();
}

class _ClientsDatesPageMobState extends State<ClientsDatesPageMob> {
  late final ClientsDatesCubit _cubit;
  late final ClientActivitiesBloc _bloc;
  late final TicketsCubit _ticketsCubit;
  late final ClientTaskBloc _taskBloc;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ClientsDatesCubit>();
    _cubit.init();
    _cubit.getAllClientsDates(clientId: widget.client.idClients!);
    _cubit.pageVariables.searchController = TextEditingController();

    _bloc = context.read<ClientActivitiesBloc>();
    _bloc.pageVariables.clear();
    _bloc.pageVariables.clientId = widget.client.idClients!;
    _bloc.add(GetAllClientActivitiesEvent(
        page: 1, clientId: widget.client.idClients!));

    _ticketsCubit = context.read<TicketsCubit>();
    _ticketsCubit.getClientTicket(widget.client.idClients!);

    _taskBloc = context.read<ClientTaskBloc>();
    _taskBloc.add(GetClientTasksEvent(
        params: GetClientTasksParams(idClient: widget.client.idClients!)));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomScrollView(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              overscroll: false,
            ),
            slivers: [
              SliverToBoxAdapter(child: 5.height),
              BlocBuilder<ClientsDatesCubit, ClientsDatesState>(
                buildWhen: (previous, current) {
                  return previous.getAllClientsDatesStatus !=
                      current.getAllClientsDatesStatus;
                },
                builder: (context, state) {
                  if (state.getAllClientsDatesStatus.isLoading()) {
                    return SliverFillRemaining(child: AppLoader());
                  } else if (state.getAllClientsDatesStatus.isFailed()) {
                    return SliverToBoxAdapter(
                      child: AppErrorWidget(
                        message: state.getAllClientsDatesStatus.error,
                        onPressed: () => _cubit.getAllClientsDates(
                          clientId: widget.client.idClients!,
                        ),
                      ),
                    );
                  }
                  return
                      // SliverToBoxAdapter(child:
                      ClientDatesCalendar();
                  //  );
                },
              ),
              SliverToBoxAdapter(child: 20.height),
              // Meetings Section
              SliverToBoxAdapter(
                child: _buildSection(
                  title: 'Meetings',
                  onAddPressed: () {
                    // TODO: Implement add meeting
                  },
                  child: ValueListenableBuilder<List<ClientDateModel>>(
                    valueListenable: _cubit.pageVariables.selectedDayEvents,
                    builder: (context, events, child) {
                      if (events.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: AppText(
                            'No Meetings for this day',
                            color: Colors.grey,
                          ),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: events
                            .map((event) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: DateCard.fromClientDate(event),
                                ))
                            .toList(),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(child: 16.height),
              // Tasks Section
              SliverToBoxAdapter(
                child: _buildSection(
                  title: 'Tasks',
                  onAddPressed: () {
                    // TODO: Navigate to add task page
                  },
                  child: BlocBuilder<ClientTaskBloc, ClientTaskState>(
                    builder: (context, state) {
                      return state.listClientTasks.when(
                        success: (data) {
                          if (data == null || data.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: AppText(
                                'No tasks for this day',
                                color: Colors.grey,
                              ),
                            );
                          }

                          return Column(
                            children: data
                                .map((task) => TaskCardNew(task: task))
                                .toList(),
                          );
                        },
                        failure: (error, data) => AppErrorWidget(
                          message: error,
                          onPressed: () {
                            _taskBloc.add(GetClientTasksEvent(
                                params: GetClientTasksParams(
                                    idClient: widget.client.idClients!)));
                          },
                        ),
                        loading: () => AppLoader(),
                        initial: () => AppLoader(),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(child: 16.height),
              // Calls Section with Activities
              SliverToBoxAdapter(
                child: _buildSection(
                  title: 'Calls',
                  onAddPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddActivityPage(),
                      ),
                    );
                  },
                  child:
                      BlocBuilder<ClientActivitiesBloc, ClientActivitiesState>(
                    builder: (context, state) {
                      if (state.getClientActivitiesStatus.isLoading()) {
                        return AppLoader();
                      }

                      if (state.getClientActivitiesStatus.isFailed()) {
                        return AppErrorWidget(
                          message: state.getClientActivitiesStatus.error,
                          onPressed: () => _bloc.add(
                            GetAllClientActivitiesEvent(
                              page: 1,
                              clientId: widget.client.idClients!,
                            ),
                          ),
                        );
                      }

                      final activities = state.clientActivities;

                      if (activities.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: AppText(
                            'No activities for this day',
                            color: Colors.grey,
                          ),
                        );
                      }

                      return Column(
                        children: activities
                            .map((activity) => ActivityCard(activity: activity))
                            .toList(),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(child: 20.height),
              // Tickets Section
              SliverToBoxAdapter(
                child: _buildSection(
                  title: 'Tickets',
                  onAddPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTicketPage(
                          fkClient: widget.client.idClients,
                        ),
                      ),
                    );
                  },
                  child: BlocBuilder<TicketsCubit, TicketsState>(
                    builder: (context, state) {
                      return state.getClientsTicketsStatus.when(
                        success: (data) {
                          final tickets = _ticketsCubit.clientTicketsList;

                          if (tickets.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: AppText(
                                'No tickets for this day',
                                color: Colors.grey,
                              ),
                            );
                          }

                          return Column(
                            children: tickets
                                .map((ticket) => TicketCardNew(ticket: ticket))
                                .toList(),
                          );
                        },
                        failure: (error, data) => AppErrorWidget(
                          message: error,
                          onPressed: () {
                            _ticketsCubit
                                .getClientTicket(widget.client.idClients!);
                          },
                        ),
                        loading: () => AppLoader(),
                        initial: () => AppLoader(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required VoidCallback onAddPressed,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              title,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            AddActionButton(
              onTap: onAddPressed,
              text: '+ ${title.substring(0, title.length - 1)}',
              backgroundColor: Colors.transparent,
              textColor: AppColors.primaryMain,
              iconColor: AppColors.primaryMain,
            ),
          ],
        ),
        8.height,
        child,
      ],
    );
  }
}
