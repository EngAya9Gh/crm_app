


import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/care/widgetcare.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticket_all.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
import 'communcation_view_widget.dart';
class care_client_view extends StatefulWidget {
   care_client_view({required this.fk_client,Key? key}) : super(key: key);
  String fk_client;
  @override
  _care_client_viewState createState() => _care_client_viewState();
}

class _care_client_viewState extends State<care_client_view> {
  List<CommunicationModel> listCommunication=[];
  List<TicketModel> listticket_client=[];
  TicketModel? ttc;
  @override
  Widget build(BuildContext context) {
    listCommunication=Provider.of<communication_vm>(context, listen: true)
        .listCommunicationClient;
    // listticket_client= Provider.of<ticket_vm>(context, listen: true)
    //     .listticket_client;
    return Scaffold(

      body: Directionality(

        textDirection: TextDirection.rtl,
        child: Padding(

            padding: const EdgeInsets.all(16.0),
            child:GroupedListView<CommunicationModel, String>(
              elements:  listCommunication,
              groupBy: (element) {
                switch(element.typeCommuncation)
                {
                  case 'ترحيب':
                    return 'ترحيب';

                  case 'تركيب':
                    return 'تركيب';

                  case 'دوري':
                    return 'دوري';

                }
                return '';
              },
              groupComparator: (value1, value2) =>
                  value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1.idCommunication!.compareTo(item2.idCommunication),
              order: GroupedListOrder.ASC,
              useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              itemBuilder: (c, element) {
                return Container(
                    //children: _privilgelist.map(( key) {
                    child:
                    Column(
                      children: [
                       // for(int i=0;i<listCommunication.length;i++)
                          // if(listCommunication[i].typeCommuncation!='دوري')
                        communcation_view_widget(element: element),

                       // else commview(listCommunication[i])
                       //  listCommunication.isNotEmpty?
                       //  commview( listCommunication
                       //      .firstWhere((element) => element.typeCommuncation=='دوري',
                       //  orElse: ()=> CommunicationModel(
                       //  idCommunication: '',nameUser: '',nameEnterprise: '',
                       //  clientRepeat: '',result: '',number_wrong: '',rate: '',
                       //  typeCommuncation: '',mobile: '',notes: '',
                       //  fkClient: '',fkUser: '',date_create: '',dateNext: '',
                       //  dateCommunication: '',id_invoice: '',dateinstall_done: ''
                       //  ) ) ) :Container(),
                      ],
                    )

                );

                // );
              },
            )),
      ),
    );
  }
  void gets() {

  }

}
