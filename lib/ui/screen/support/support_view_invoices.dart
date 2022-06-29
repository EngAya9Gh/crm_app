import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class support_view_invoices extends StatefulWidget {
  support_view_invoices({required this.itemClient,
     Key? key}) : super(key: key);

  ClientModel itemClient;
  @override
  support_view_invoicesState createState() => support_view_invoicesState();
}

class support_view_invoicesState extends State<support_view_invoices> {
  bool _isLoading=true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<InvoiceModel> listinvoice=[];

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
    listinvoice=Provider.of<invoice_vm>(context,listen: true)
        .listinvoiceClientSupport;

    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(left:2,right: 2,top: 10,bottom: 10),
        child: listinvoice.isNotEmpty?
        Container(
          //height: MediaQuery.of(context).size.height * 1,
          child: ListView.builder(
            itemCount: listinvoice.length,

            itemBuilder: (BuildContext context, int index)=>
                Builder(builder:
                    (context)=>
                    support_add(
                      idinvoice: listinvoice[index].idInvoice,
                    )) ,
          ),): Padding(
          padding: EdgeInsets.only(top: 10,bottom: 50,right: 10,left: 10),

          child: Container(
            height: MediaQuery.of(context).size.height*0.06,
            child: ContainerShadows(
              margin: EdgeInsets.only(),
              child: Center(child: Text('العميل غير مشترك')),
            ),
          ),
        ),
      ),
    );}
}
