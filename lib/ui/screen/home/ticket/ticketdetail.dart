import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../function_global.dart';

class ticketdetail extends StatelessWidget {

    ticketdetail({this.type, required this.ticketModel, Key? key}) : super(key: key);
  String? type=null;
  TicketModel ticketModel;
    TextEditingController _textnotes= TextEditingController();

    Widget _tranferall(String nameto,String namefrom,String date,String resoan ) {
      return    Column(
        children: [

           cardRow(title: 'قام بتحويل التذكرة ',
              value: getnameshort( namefrom)),
           cardRow(title: 'الشخص المحول له ',
              value: getnameshort( nameto)),

           cardRow(title: 'تاريخ تحويل التذكرة ',
              value:  date.toString()) ,
           cardRow(title: ' سبب التحويل ',
              value:  resoan) ,
           Divider(thickness: 1,color: Colors.grey,),
          // Row(
          //
          //   children: [
          //     //Expanded flex 1
          //     Text(name,
          //       style: TextStyle(fontFamily: kfontfamily2),),
          //     Spacer(),
          //     Text( price,style: TextStyle(fontFamily: kfontfamily2),),
          //   ],
          // ),
          // Divider(thickness: 1,color: Colors.grey,),

        ],
      );
    }
  @override
  Widget build(BuildContext context) {
    final _globalKey = GlobalKey<FormState>();

    Widget dialog =
    SimpleDialog(
        titlePadding:const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0) ,
        insetPadding:  EdgeInsets.only(left: 10,right: 10,bottom: 10),
        contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        title: Center(child: Text('',style:TextStyle(fontFamily: kfontfamily2))),
        children:[
          ModalProgressHUD(
            inAsyncCall:   Provider.of<ticket_vm>(context,listen: true)
                .isloading,
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) setState) {
                return
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child:   Form(
                      key: _globalKey,
                      child:Column(
                        children: [
                          SizedBox(height: 5,),
                          EditTextFormField(
                            maxline: 4,
                            paddcustom: EdgeInsets.all(10),
                            hintText:
                            'ملاحظات الإغلاق  ',
                            obscureText: false,
                            controller: _textnotes,
                            vaild: (value) {
                              if (value.toString().trim().isEmpty) {
                                return 'الحقل فارغ';
                              }
                            },
                          ),
                          SizedBox(height: 10,),
                          CustomButton(
                            text: "تثبيت",
                            onTap:() async {
                              if (_globalKey.currentState!
                                  .validate()) {
                                _globalKey.currentState!.save();
                                Provider.of<ticket_vm>(context,listen: false)
                                    .updateTicketvm({
                                  'notes_ticket':_textnotes.text,
                                  'fk_user_close':Provider.of<user_vm_provider>
                                    (context,listen: false).currentUser.idUser.toString(),
                                  'date_close':DateTime.now().toString(),
                                  'type_ticket':'مغلقة'
                                },   ticketModel.idTicket);
                                Navigator.of(context, rootNavigator: true)
                                    .pop(false);
                                Navigator.pop(context);
                              }
                            },
                          ),

                        ],
                      ),
                    ),
                  );
              },),
          ),

        ]);
    return Scaffold(
      appBar: AppBar(
        title:Text(
          ticketModel.typeTicket.toString()+  ' ' +
              '#'+ticketModel.idTicket ,
        style: TextStyle(color: kWhiteColor),
        ),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                 type==null?
                Padding(
                  padding: const EdgeInsets.only(bottom:  16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ticketModel.dateRecive==null?
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
                              },ticketModel.idTicket);
                              Navigator.pop(context);
                            },
                            child: Text('استلام التذكرة')),
                      ):Container():Container(),
                      ticketModel.dateClose==null?
                      Provider.of<privilge_vm>(context,listen: false)
                          .checkprivlge('72') == true ? //regoin
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    kMainColor)),
                            onPressed: () async{
                              await showDialog<void>(
                                  context: context,
                                  builder: (context) => dialog
                              );
                            },
                            child: Text('اغلاق التذكرة')),
                      ):Container():Container(),
                         // SizedBox(width: 2,),
                          ticketModel.dateRecive!=null &&
                          ticketModel.dateClose==null?
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
                                  name_enterprise:  ticketModel.nameEnterprise.toString(),
                                  idclient:  ticketModel.fkClient.toString(),
                                  idticket: ticketModel.idTicket,
                                  type: "ticket",),fullscreenDialog: true

                            ));
                          },
                          child: Text('تحويل التذكرة'),
                        ),
                      ):Container():Container(),
                      SizedBox(width: 10,),

                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                kMainColor)),
                        onPressed: () {

                          Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>ProfileClient(
                                idclient: ticketModel.fkClient.toString(),
                              )

                          ));
                        },
                        child: Text('ملف العميل'),
                      ),

                    ],
                  ),
                ):Container(),

                ticketModel.dateClose!=null?
                cardRow(title: 'قام بإغلاق التذكرة ',value: getnameshort( ticketModel.nameuserclose.toString())):Container(),

                ticketModel.dateClose!=null?
                cardRow(title: 'تاريخ إغلاق التذكرة ',value: ticketModel.dateClose.toString()):Container(),

                ticketModel.dateClose!=null?
                cardRow(title: '  ملاحظات إغلاق التذكرة ',value: ticketModel.notesTicket.toString()):Container(),

                for(int i=0;i<ticketModel.transferticket!.length;i++)
               _tranferall(ticketModel.transferticket![i]!.nameuserto.toString(),
                   ticketModel.transferticket![i]!.nameuserfrom.toString(),
                   ticketModel.transferticket![i]!.date_assigntr.toString(),
                   ticketModel.transferticket![i]!.resoantransfer_ticket.toString()
               ),
               ticketModel.dateRecive!=null?
                cardRow(title: 'قام باستلام التذكرة ',value: getnameshort( ticketModel.nameuserrecive.toString())):Container(),
                ticketModel.dateRecive!=null?
                cardRow(title: 'تاريخ استلام التذكرة ',value:  ticketModel.dateRecive.toString()):Container(),

                cardRow(title: 'قام بفتح التذكرة ',value: getnameshort( ticketModel.nameuseropen.toString())),
                cardRow(title: 'تاريخ فتح التذكرة ',value: ticketModel.dateOpen.toString()),
                cardRow(title: 'نوع التذكرة',value:  ticketModel.typeProblem.toString()),
                //cardRow(title: 'وصف المشكلة',value: widget.ticketModel.detailsProblem.toString(),isExpanded: true,),
                cardRow(title: 'تفاصيل التذكرة',value: ticketModel.detailsProblem.toString(),isExpanded: true,),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
