
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_bloc.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_state.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/participate_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_scroll/text_scroll.dart';

class ParticipateProfilePage extends StatefulWidget {
  const ParticipateProfilePage({Key? key}) : super(key: key);

  @override
  State<ParticipateProfilePage> createState() => _ParticipateProfilePageState();
}

class _ParticipateProfilePageState extends State<ParticipateProfilePage> with TickerProviderStateMixin{
    late TabController _tabController;
    @override
  void initState() {
    
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
              Center(child: Text('العملاء')),
              Center(child: Text('الفواتير')),
              Center(child: Text('التعليقات')),
            ],
          );
        },
      ),
    );
  }
}