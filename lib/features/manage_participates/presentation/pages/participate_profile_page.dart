
import 'package:crm_smart/features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_bloc.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_state.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/participate_client_list_page.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/participate_comment_list_page.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/participate_info.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/participate_invoice_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../domain/use_cases/get_participate_Invoice_list_usecase.dart';
import '../../domain/use_cases/get_participate_client_list_usecase.dart';

class ParticipateProfilePage extends StatefulWidget {
  const ParticipateProfilePage({Key? key,required this.participateId}) : super(key: key);
 final String participateId;

  @override
  State<ParticipateProfilePage> createState() => _ParticipateProfilePageState();
}

class _ParticipateProfilePageState extends State<ParticipateProfilePage> with TickerProviderStateMixin{
  late ParticipateListBloc _participateListBloc;
    late TabController _tabController;
    @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc = context.read<ParticipateListBloc>() ..add(GetParticipateClientListEvent(
         query: '', getParticipateClientListParams: GetParticipateClientListParams(
          idParticipate:widget.participateId
         ))
         );
      _participateListBloc.add(GetParticipateInvoiceListEvent(
         query: '', getParticipateInvoiceListParams: GetParticipateInvoiceListParams(
          idParticipate:widget.participateId
         ))); 
      _participateListBloc.add(GetParticipateCommentListEvent(
         getParticipateCommentListParams: GetParticipateCommentListParams(
          idParticipate:widget.participateId
         )));

    });
    super.initState();
    _tabController = TabController(length: TabEvent.values.length, vsync: this, initialIndex: 0);
    // _tabController.addListener(onChangeTab);
  }
  @override
  Widget build(BuildContext context) {
    // final ParticipateListBloc tabBloc = BlocProvider.of<ParticipateListBloc>(context);
    final ParticipateListBloc tabBloc = BlocProvider.of<ParticipateListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        // title:  BlocBuilder<ParticipateListBloc, ParticipateListState>(
        //   builder: (context, state) {
        //     return Text(state.currentPaticipate!=null?state.currentPaticipate!.name_participate:'',style:TextStyle(color: Colors.white));
        //   }
        // ),
        title: BlocBuilder<ParticipateListBloc, ParticipateListState>(
          builder: (context, state) {
            return LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    // height: appBarSize.height,
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: TextScroll(
                           state.currentPaticipate!=null?state.currentPaticipate!.name_participate:'',
                            mode: TextScrollMode.endless,
                            velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                            delayBefore: Duration(milliseconds: 2000),
                            pauseBetween: Duration(milliseconds: 1000),
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          )
                        
                          ),
                    ),
                  );
                });
          }
        ),
            
        centerTitle: true,
        

        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          labelPadding: const EdgeInsets.symmetric(horizontal: 6), 
          indicatorWeight: 4,
          indicatorColor:Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          physics: AlwaysScrollableScrollPhysics(),
          onTap: (index) {
          context.read<ParticipateListBloc>().add(SwitchProfileTabs(TabEvent.values[index]));
          },
          tabs: const [
            Tab(text: 'البيانات'),
            Tab(text: 'العملاء'),
            Tab(text: 'الفواتير'),
            Tab(text: 'التعليقات'),
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
              ParticipateClientListPage(participateId: state.currentPaticipate!=null?state.currentPaticipate!.id_participate!:''),
              ParticipateInvoiceListPage(participateId: state.currentPaticipate!=null?state.currentPaticipate!.id_participate!:''),
              ParticipateCommentListPage(participateId: state.currentPaticipate!=null?state.currentPaticipate!.id_participate!:''),
            ],
          );
        },
      ),
    );
  }
}