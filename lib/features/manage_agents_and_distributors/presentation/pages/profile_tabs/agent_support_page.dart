import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../ui/screen/support/support_table.dart';
import '../../../../../ui/widgets/custom_widget/RowWidget.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../domain/use_cases/done_training_usecase.dart';
import '../../../domain/use_cases/get_agent_dates_list_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../../widgets/agent_support_page/add_date_button.dart';

class AgentSupportPage extends StatefulWidget {
    AgentSupportPage({Key? key,required this.agent, required this.agentId}) : super(key: key);
  AgentDistributorModel agent;
  final String agentId;

  @override
  State<AgentSupportPage> createState() => _AgentSupportPageState();
}

class _AgentSupportPageState extends State<AgentSupportPage> {
  @override
  void initState() {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.add(GetAgentDatesListEvent(
        getAgentDatesListParams:
            GetAgentDatesListParams(agentId: widget.agentId)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    return Scaffold(
      // floatingActionButton: AddDateButton(agentId: widget.agentId),
      body: BlocBuilder<AgentsDistributorsProfileBloc,
          AgentsDistributorsProfileState>(
        buildWhen: (previous, current) {
          return previous.dateVisitStatus != current.dateVisitStatus;
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 10),
                AddDateButton(agentId: widget.agentId),
                SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        CupertinoPageRoute(
                            builder: (context) => support_table()));

                  },
                  child: cardRow(
                    title: 'عدد الزيارات التي تمت',
                    value: bloc.finishedVisits.length.toString(),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        CupertinoPageRoute(
                            builder: (context) => support_table()));

                  },
                  child: cardRow(
                    title: 'عدد الزيارات المتبقية',
                    value: bloc.unfinishedVisits.length.toString(),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        CupertinoPageRoute(
                            builder: (context) => support_table()));

                  },                  child: cardRow(
                    title: 'عدد الزيارات الملغية',
                    value: bloc.canceledVisits.length.toString(),
                  ),
                ),
                // cardRow(
                //   title: 'نوع التدريب',
                //   value:  widget.agent.ty.toString(),
                // ),
                widget.agent.nameusertraining!=null?cardRow(title: "موظف التدريب", value: widget.agent.nameusertraining.toString()):Container(),

                cardRow(title: "هل تم التدريب",
                    value: widget.agent.is_training!=null?'نعم':'لا'),
                widget.agent.date_training!=null?cardRow(title: "تاريخ التدريب", value: widget.agent.date_training.toString()):Container(),

                SizedBox(height: 20,),

                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(
                            kMainColor)),
                    onPressed: () async {

                        await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('التأكيد'),
                                content: Text(
                                    'هل تريد تأكيد العملية '),
                                actions: <Widget>[
                                  Column(
                                    children: [


                                              Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child:
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                        MaterialStateProperty.all(
                                                            kMainColor)),
                                                    onPressed: () {
                                                      Navigator.of(
                                                          context,
                                                          rootNavigator:
                                                          true)
                                                          .pop(
                                                          false); // dismisses only the dialog and returns false
                                                    },
                                                    child:
                                                    Text('لا'),
                                                  ),
                                                ),
                                                10.horizontalSpace,
                                                Expanded(
                                                  child:
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                        MaterialStateProperty.all(
                                                            kMainColor)),
                                                    onPressed:
                                                        () async {
                                                      try {

                                                        bloc.add(
                                                          DoneAgentEvent(
                                                            DoneTrainingParams(
                                                              agentId: widget.agentId,
                                                              fkuser_training: Provider.of<UserProvider>(context, listen: false)
                                                                  .currentUser
                                                                  .idUser
                                                                  .toString(),
                                                            ),
                                                            onSuccess: (val) => _handleOnSuccess(val),
                                                          ),
                                                        );
                                                      } catch (e) {

                                                      }
                                                    },
                                                    child:
                                                    Text('نعم'),
                                                  ),
                                                ),
                                              ],
                                            )

                                    ],
                                  ),
                                ],
                              );
                            });

                      //Navigator.push(context, CupertinoPageRoute(builder: (context)=> second()));
                    },
                    child: Text('تم التدريب'))

              ],
            ),
          );
        },
      ),
    );
  }
  void _handleOnSuccess(AgentDistributorModel value) {

     setState(() {
       widget.agent=value;
     });

    // bloc.add(
    //   DoneAgentEvent(
    //     getAgentCommentListParams: GetAgentCommentListParams(
    //       agentId: widget.agentId,
    //     ),
    //   ),
    // );
  }
}
