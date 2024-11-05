import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../data/models/client_date_model.dart';
import '../manager/clients_dates_cubit.dart';
import '../widgets/client_date_card.dart';
import '../widgets/client_dates_calendar.dart';

class ClientsDatesPageWeb extends StatefulWidget {
  const ClientsDatesPageWeb({Key? key,required this.client}) : super(key: key);
  final ClientModel client;

  @override
  State<ClientsDatesPageWeb> createState() => _ClientsDatesPageWebState();
}

class _ClientsDatesPageWebState extends State<ClientsDatesPageWeb> {


  late final ClientsDatesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ClientsDatesCubit>();
    _cubit.init();
    _cubit.getAllClientsDates(clientId: widget.client.idClients!);
    _cubit.pageVariables.searchController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        body: Row(
          children: [
            Flexible(flex: 3, child: _bodySide()),
            Flexible(flex: 2, child: _calendarSide()),
            // AppWebSideBar(),
          ],
        ),
      ),
    );
  }

  Widget _bodySide() {
    return ValueListenableBuilder<List<ClientDateModel>>(
      valueListenable: _cubit.pageVariables.selectedDayEvents,
      builder: (context, events, child) {
        return CustomScrollView( // Ensure this is wrapped in a CustomScrollView
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return ClientDateCard(event: events[index]);
                },
                childCount: events.length,
              ),
            ),
          ],
        );
      },
    );
  }
  Widget _calendarSide() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          BlocBuilder<ClientsDatesCubit, ClientsDatesState>(
            buildWhen: (previous, current) {
              return previous.getAllClientsDatesStatus !=
                  current.getAllClientsDatesStatus ;
            },
            builder: (context, state) {
              if (state.getAllClientsDatesStatus.isLoading()) {
                SliverFillRemaining(child: AppLoader());
              } else if (state.getAllClientsDatesStatus.isFailed()) {
                return  SliverToBoxAdapter(
                    child: AppErrorWidget(
                      message: state.getAllClientsDatesStatus.error,
                      onPressed: () =>_cubit.getAllClientsDates(clientId: widget.client.idClients!),
                    ));
              }
              return SliverToBoxAdapter(child: ClientDatesCalendar());
            },
          ),
        ],
      ),
    );
  }

}