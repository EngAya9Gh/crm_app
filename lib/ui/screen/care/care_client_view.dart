


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
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
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
    listticket_client= Provider.of<ticket_vm>(context, listen: true)
        .listticket_client;
    return Scaffold(

      body: Directionality(

        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: Text('عدد التذاكر التي فتحت للعميل '+listticket_client.length.toString()),
              // ),
              SizedBox(height: 8,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //   // listticket_client.isNotEmpty||
              //   //     listticket_client.firstWhere(
              //   //             (element) =>
              //   //         element.typeTicket=='قيد التنفيذ' ||   element.typeTicket=='جديدة',
              //   //         orElse: ()=>TicketModel(
              //   //             idTicket: '',
              //   //             fkClient: '',
              //   //             typeProblem: '',
              //   //             detailsProblem: '',
              //   //             notesTicket: '',
              //   //             typeTicket: '',
              //   //             fkUserOpen: '',
              //   //             fkUserClose: '',
              //   //             fkUserRecive: '',
              //   //             dateOpen: '',
              //   //             dateClose: '',
              //   //             dateRecive: '',
              //   //             clientType: '',
              //   //             nameClient: '',
              //   //             nameEnterprise: '',
              //   //             nameRegoin: '',
              //   //             nameuseropen: '',
              //   //             nameuserrecive: '', nameuserclose: '',
              //   //             fk_country: '')).idTicket!=''?
              //   //       Text('توجد تذكرة دعم فني مفتوحة حالياً')
              //   //     : ElevatedButton(
              //   //     style: ButtonStyle(
              //   //         backgroundColor: MaterialStateProperty.all(
              //   //             kMainColor)),
              //   //     onPressed: () async{
              //   //       Navigator.push(context,
              //   //           MaterialPageRoute(builder: (context)=>
              //   //               ticketAdd(fk_client: widget.fk_client.toString(),)));
              //   //     },
              //   //     child: Text(' فتح تذكرة دعم ')) ,
              //      //SizedBox(width: 5,),
              //     listticket_client.isNotEmpty?
              //     buildSelectCategory(
              //       colorbag: kMainColor,
              //       colorarrow: kWhiteColor,
              //       colortitle: kWhiteColor,
              //       onTap: () async{
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context)=>
              //                 ticketall()));
              //       },
              //       title:
              //       'عدد التذاكر التي فتحت للعميل   '+listticket_client.length.toString(),
              //     ):Container(),
              // ],),
          //     listCommunication.isNotEmpty?
          // Text(''):ContainerShadows(
          // margin: EdgeInsets.only(),
          // child: Center(child: Text('العميل ليس لديه أي تواصلات '))),

              SizedBox(height: 10,),
              listticket_client.isNotEmpty?
              buildcardExpansion('تفاصيل آخر تذكرة','',
                  TicketView(ticketModel: listticket_client.last ,type:'1' )):Container(),

              for(int i=0;i<listCommunication.length;i++)
                if(listCommunication[i].typeCommuncation!='دوري')
                  commview(listCommunication[i]) ,

             // else commview(listCommunication[i])
              listCommunication.isNotEmpty?
              commview( listCommunication
                  .firstWhere((element) => element.typeCommuncation=='دوري',
                  orElse: ()=> CommunicationModel(
                    idCommunication: '',nameUser: '',nameEnterprise: '',
                    clientRepeat: '',result: '',number_wrong: '',rate: '',
                    typeCommuncation: '',mobile: '',notes: '',
                    fkClient: '',fkUser: '',date_create: '',dateNext: '',
                    dateCommunication: '',id_invoice: '',dateinstall_done: ''
                  ) ) ) :Container(),
            ],
          ),
        ),
      ),
    );
  }
  void gets() {

  }

}
