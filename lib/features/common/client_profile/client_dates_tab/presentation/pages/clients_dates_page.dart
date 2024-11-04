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

class ClientsDatesPage extends StatefulWidget {
  const ClientsDatesPage({Key? key,required this.client}) : super(key: key);
  final ClientModel client;

  @override
  State<ClientsDatesPage> createState() => _ClientsDatesPageState();
  }

  class _ClientsDatesPageState extends State<ClientsDatesPage> {


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
        body:Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: CustomScrollView(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              overscroll: false,
            ),
            slivers: [
              SliverToBoxAdapter(child: 5.height),
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
              SliverToBoxAdapter(
                  child: Divider(
                      thickness: 1, color: AppColors.primaryMain, height: 1)),
              ValueListenableBuilder<List<ClientDateModel>>(
                valueListenable: _cubit.pageVariables.selectedDayEvents,
                builder: (context, events, child) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return ClientDateCard(event:events[index]);
                      },
                      childCount: events.length,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}