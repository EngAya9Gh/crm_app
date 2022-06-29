import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticket_all.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../widgethomeitem.dart';
import 'card_ticket.dart';


class ticketprofile extends StatefulWidget {
  ticketprofile({required this.itemClient,
    Key? key}) : super(key: key);

  ClientModel itemClient;
  @override
  ticketprofileState createState() => ticketprofileState();
}

class ticketprofileState extends State<ticketprofile> {
  bool _isLoading=true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<TicketModel> list_ticket=[];

  @override
  void initState() {
    // List<InvoiceModel> list= Provider.of<invoice_vm>(context,listen: false)
    //   .listinvoicebyregoin;
    //get info from list client_invoice فواتير العميل
    WidgetsBinding.instance!.addPostFrameCallback((_){
      // Add Your Code here.
      // Provider.of<invoice_vm>(context,listen: false)
      //     .get_invoiceclientlocal(widget.itemClient.idClients,'مشترك');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list_ticket=Provider.of<ticket_vm>(context,listen: true)
        .listticket_client;

    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(left:2,right: 2,top: 10,bottom: 10),
        child:
        Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  list_ticket.isNotEmpty?
                  buildSelectCategory(
                    isicon: false,
                    colorbag: kMainColor,
                    colorarrow: kWhiteColor,
                    colortitle: kWhiteColor,
                    onTap: () async{
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context)=>
                      //         ticketall()));
                    },
                    title:
                    'عدد التذاكر التي فتحت للعميل   '+list_ticket.length.toString(),
                  ):Container(),
                ],),
              Container(
                //height: MediaQuery.of(context).size.height * 1,
                child:
                Expanded(
                  child: ListView.builder(
                    itemCount: list_ticket.length,

                    itemBuilder: (BuildContext context, int index)=>
                        Builder
                          (builder:
                            (context)=>
                                cardticket(
                              ticketModel: list_ticket[index],
                            )) ,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );}
}
