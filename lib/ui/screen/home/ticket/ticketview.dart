import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../../../../function_global.dart';

class TicketView extends StatefulWidget {
   TicketView({this.type, required this.ticketModel, Key? key}) : super(key: key);
   String? type=null;
   TicketModel ticketModel;
  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 14),
        // child:
        // ContainerShadows (
        //   margin: EdgeInsets.all(2),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
              children: [
                cardRow(title: 'حالة التذكرة',value: widget.ticketModel.typeTicket.toString()),

                // cardRow(title: 'اسم المؤسسة',value:widget.ticketModel.nameEnterprise.toString()),
                 cardRow(title: 'المدينة',value: widget.ticketModel.nameRegoin.toString()),

                // widget.ticketModel.dateAssign!=null?
                // cardRow(title: 'تم تحويل التذكرة إلى ',value: getnameshort( widget.ticketModel.nameusertransfer.toString())):Container(),
                //
                // widget.ticketModel.dateAssign!=null?
                // cardRow(title: 'تاريخ تحويل التذكرة ',value:  widget.ticketModel.dateAssign.toString()):Container(),

                //////////////////////////////////////////////////
                widget.ticketModel.dateClose!=null?
                cardRow(title: 'قام بإغلاق التذكرة ',value: getnameshort( widget.ticketModel.nameuserclose.toString())):Container(),

                widget.ticketModel.dateClose!=null?
                cardRow(title: 'تاريخ إغلاق التذكرة ',value:  widget.ticketModel.dateClose.toString()):Container(),

                widget.ticketModel.dateRecive!=null?
                cardRow(title: 'قام باستلام التذكرة ',value: getnameshort( widget.ticketModel.nameuserrecive.toString())):Container(),
                widget.ticketModel.dateRecive!=null?
                cardRow(title: 'تاريخ استلام التذكرة ',value:  widget.ticketModel.dateRecive.toString()):Container(),

                cardRow(title: 'قام بفتح التذكرة ',value: getnameshort( widget.ticketModel.nameuseropen.toString())),
                cardRow(title: 'تاريخ فتح التذكرة ',value:  widget.ticketModel.dateOpen.toString()),
                cardRow(title: 'نوع التذكرة',value: widget.ticketModel.typeProblem.toString()),
                //cardRow(title: 'وصف المشكلة',value: widget.ticketModel.detailsProblem.toString(),isExpanded: true,),
                cardRow(title: 'تفاصيل التذكرة',value: widget.ticketModel.detailsProblem.toString(),isExpanded: true,),
                SizedBox(height: 10,),
                widget.type==null?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  widget.ticketModel.dateRecive==null?
                  Provider.of<privilge_vm>(context,listen: false)
                      .checkprivlge('71') == true ?
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                kMainColor)),
                        onPressed: () async{
                          Provider.of<ticket_vm>(context,listen: false)
                              .updateTicketvm({
                            'fk_user_recive':Provider.of<user_vm_provider>
                              (context,listen: false).currentUser.idUser.toString(),
                            'date_recive':DateTime.now().toString(),
                            'type_ticket':'قيد التنفيذ'

                          },  widget.ticketModel.idTicket);
                        },
                        child: Text('استلام التذكرة')),
                  )
                      :  widget.ticketModel.dateClose==null?
              Provider.of<privilge_vm>(context,listen: false)
                  .checkprivlge('72') == true ? //regoin
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                kMainColor)),
                        onPressed: () async{
                          Provider.of<ticket_vm>(context,listen: false)
                              .updateTicketvm({
                            'fk_user_close':Provider.of<user_vm_provider>
                              (context,listen: false).currentUser.idUser.toString(),
                            'date_close':DateTime.now().toString(),
                            'type_ticket':'مغلقة'
                          },  widget.ticketModel.idTicket);
                        },
                        child: Text('اغلاق التذكرة')),
                  ):Container():Container():Container(),
                  widget.ticketModel.dateRecive!=null &&
                      widget.ticketModel.dateClose==null?
                  Provider.of<privilge_vm>(context,listen: true)
                      .checkprivlge('75')==true?
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              kMainColor)),
                      onPressed: () {

                        Navigator.push(context,MaterialPageRoute(
                            builder: (context)=>transferClient(
                              name_enterprise:   widget.ticketModel.nameEnterprise.toString(),
                              idclient:    widget.ticketModel.fkClient.toString(),
                              idticket:widget.ticketModel.idTicket,
                              type: "ticket",),fullscreenDialog: true

                        ));
                      },
                      child: Text('تحويل التذكرة'),
                    ),
                  ):Container():Container(),

                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            kMainColor)),
                    onPressed: () {

                      Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>ProfileClient(
                         idclient:    widget.ticketModel.fkClient.toString(),
                          )

                      ));
                    },
                    child: Text('ملف العميل'),
                  ),

                ],
              ):Container(),
                SizedBox(height: 5,)
              ],
              ),
              ),
          ),
         // ),
        );
  }
}
