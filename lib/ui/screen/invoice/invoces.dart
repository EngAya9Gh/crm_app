import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class invoices extends StatefulWidget {
   invoices({required this.itemClient, required this.fkclient,
     required this.fkuser, Key? key}) : super(key: key);
   String fkclient,fkuser;
   ClientModel itemClient;
  @override
  _invoicesState createState() => _invoicesState();
}

class _invoicesState extends State<invoices> {
   bool _isLoading=true;
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   List<InvoiceModel> listinvoice=[];

   @override
   void initState() {
   // List<InvoiceModel> list= Provider.of<invoice_vm>(context,listen: false)
   //   .listinvoicebyregoin;
     //get info from list client_invoice فواتير العميل
     WidgetsBinding.instance!.addPostFrameCallback((_)async{
       // Provider.of<client_vm>(context,listen: false)
       //     .getclientByIdUser_vm([]);

       // Add Your Code here.
     // await  Provider.of<invoice_vm>(context,listen: false)
     //       .get_invoiceclientlocal(widget.fkclient,'');
     });
     print('init invoice  '+widget.fkclient);
     //.then((value) => _isLoading=false);
     super.initState();
   }

   @override
   Widget build(BuildContext context) {
     listinvoice=Provider.of<invoice_vm>(context,listen: true)
         .listinvoiceClient;

     print("in build invoices "+listinvoice.length.toString());
    setState(() {
      _isLoading =listinvoice.isEmpty?false:false;
    });
     print(listinvoice.length);
     return Scaffold(
       key: _scaffoldKey,
       body: Padding(
         padding: const EdgeInsets.only(left:2,right: 2,top: 10,bottom: 10),
         child: ListView(
           children: [
              CustomButton(
                text: 'إنشاء فاتورة جديدة',
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addinvoice(
                              //invoice: invoice,
                              itemClient: widget.itemClient)));
                },
              ),
             Container(
               height: MediaQuery.of(context).size.height * 0.8,
               child: ListView.separated(
                 itemCount: listinvoice.length,
                 separatorBuilder: (BuildContext context, int index)
                 => const Divider(),
                 itemBuilder: (BuildContext context, int index)=>
                     Builder(builder:
                         (context)=>
                         CardInvoiceClient(
                           itemProd: listinvoice[index],
                         )) ,
               ),
             ),

           ]
       ),
     ),
     );}
}
