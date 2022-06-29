import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/cupertino.dart';

class ticketall extends StatefulWidget {
  ticketall({
    Key? key}) : super(key: key);

  @override
  ticketallState createState() => ticketallState();
}

class ticketallState extends State<ticketall> {
  bool _isLoading=true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<TicketModel> listticket_client=[];
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listticket_client= Provider.of<ticket_vm>(context, listen: true)
        .listticket_client;
    return Scaffold(
      key: _scaffoldKey,
appBar: AppBar(

),
      body: 
      Padding(
        padding: const EdgeInsets.only(left:2,right: 2,top: 10,bottom: 10),
        child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.separated(
                  itemCount: listticket_client.length,
                  separatorBuilder: (BuildContext context, int index)
                  => const Divider(),
                  itemBuilder: (BuildContext context, int index)=>
                      Builder(builder:
                          (context)=>
                         buildcardExpansion('تاريخ فتح التذكرة  '+
                             listticket_client[index].dateOpen.toString(),
                             listticket_client[index].nameEnterprise ,
                             TicketView(
                               type:'1',
                               ticketModel: listticket_client[index],
                           //idinvoice: listinvoice[index].idInvoice,

                         ))
                       ) ,
                ),
              ),

            ]
        ),
      ),
    );
  }
}
