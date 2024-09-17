import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../domain/use_cases/get_participate_Invoice_list_usecase.dart';
import '../../domain/use_cases/get_participate_client_list_usecase.dart';
import '../../domain/use_cases/get_participate_comment_list_usecase.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';
import 'participate_client_list_page.dart';
import 'participate_comment_list_page.dart';
import 'participate_info.dart';
import 'participate_invoice_list_page.dart';

class ParticipateProfilePage extends StatefulWidget {
  const ParticipateProfilePage({
    super.key,
    required this.participateId,
  });

  final String participateId;

  @override
  State<ParticipateProfilePage> createState() => _ParticipateProfilePageState();
}

class _ParticipateProfilePageState extends State<ParticipateProfilePage>
    with TickerProviderStateMixin {
  late ParticipateListBloc _participateListBloc;
  late TabController _tabController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc = context.read<ParticipateListBloc>()
        ..add(GetParticipateClientListEvent(
            query: '',
            getParticipateClientListParams: GetParticipateClientListParams(
                idParticipate: widget.participateId)));
      _participateListBloc.add(GetParticipateInvoiceListEvent(
          query: '',
          getParticipateInvoiceListParams: GetParticipateInvoiceListParams(
              idParticipate: widget.participateId)));
      _participateListBloc.add(GetParticipateCommentListEvent(
          getParticipateCommentListParams:
              GetParticipateCommentListParams(agentId: widget.participateId)));
    });
    super.initState();
    _tabController = TabController(
        length: TabEvent.values.length, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // final ParticipateListBloc tabBloc = BlocProvider.of<ParticipateListBloc>(context);
    final ParticipateListBloc tabBloc =
        BlocProvider.of<ParticipateListBloc>(context);

    return BlocBuilder<ParticipateListBloc, ParticipateListState>(
      builder: (context, state) {
        if (state.currentPaticipate == null) {
          return AppLoader();
        }
        return AppScaffold(
          appBar: CustomAppBar(
            title: state.currentPaticipate!.name_participate,
            bottom: CustomTabBar(
              tabController: _tabController,
              tabBarTabsText: [
                'البيانات',
                'العملاء',
                'الفواتير',
                'التعليقات',
              ],
            ),
          ),
          body: BlocBuilder<ParticipateListBloc, ParticipateListState>(
            builder: (context, state) {
              return TabBarView(
                controller: _tabController,
                children: [
                  // Replace with your tab content widgets
                  ParticipateInfo(),
                  ParticipateClientListPage(
                      participateId: state.currentPaticipate != null
                          ? state.currentPaticipate!.id_participate
                          : ''),
                  ParticipateInvoiceListPage(
                      participateId: state.currentPaticipate != null
                          ? state.currentPaticipate!.id_participate
                          : ''),
                  ParticipateCommentListPage(
                      participateId: state.currentPaticipate != null
                          ? state.currentPaticipate!.id_participate
                          : ''),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
