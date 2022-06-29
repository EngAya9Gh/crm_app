

import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/care/careView.dart';
import 'package:crm_smart/ui/screen/care/care_client_view.dart';
import 'package:crm_smart/ui/screen/care/comment_view.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketprofile.dart';
import 'package:crm_smart/ui/screen/invoice/invoces.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/ui/screen/support/support_view_invoices.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'clientView.dart';
class ProfileClient extends StatefulWidget {
  ProfileClient({ this.clienttransfer, this.invoiceModel, this.tabindex, required this.idclient, Key? key}) : super(key: key);
   String? idclient;
  int? tabindex=0;
  InvoiceModel? invoiceModel=null;
  String? clienttransfer;

  @override
  _ProfileClientState createState() => _ProfileClientState();
}

class _ProfileClientState extends State<ProfileClient> with TickerProviderStateMixin{

  late UserModel current ;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late ClientModel _clientModel;
  late CommunicationModel? _CommunicationModel;
  late TabController _tabcontroller;
  int indextab=0;
@override void initState() {
    indextab= (widget.tabindex==null?0: widget.tabindex)!;
  WidgetsBinding.instance!.addPostFrameCallback((_)async {
    await Provider.of<invoice_vm>(context,listen: false)
        .get_invoiceclientlocal(widget.idclient,'مشترك');

    await  Provider.of<communication_vm>(context, listen: false)
        .getCommunicationall('');

     await Provider.of<client_vm>(context,listen: false)
     .get_byIdClient(widget.idclient.toString());

   await  Provider.of<invoice_vm>(context, listen: false)
        .get_invoiceclientlocal(widget.idclient,'');

      Provider.of<communication_vm>(context, listen: false)
        .getCommunicationclient(widget.idclient.toString());

    Provider.of<comment_vm>(context, listen: false)
        .getComment(widget.idclient.toString());

    Provider.of<ticket_vm>(context, listen: false)
        .getclient_ticket( widget.idclient.toString());
  });

  super.initState();
    _tabcontroller= TabController(
        length: 6, vsync: this,
        initialIndex:indextab);
}
@override void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    _clientModel=Provider.of<client_vm>
      (context,listen: true).listClient
        .firstWhere((element)//error
    => element.idClients==widget.idclient);

   //  final index=Provider.of<invoice_vm>(context,listen: true)
   //      .listinvoices.indexWhere(
   //          (element) => element.fkIdClient==widget.idclient);
   //
   // if(index !=-1)
   //   _invoiceModel=Provider.of<invoice_vm>(context,listen: true).listinvoices
   //      .lastWhere(
   //           (element) => element.fkIdClient==widget.idclient
   //               &&element.isApprove==null,
   //       orElse: ()=>Provider.of<invoice_vm>(context,listen: true).listinvoices
   //           .firstWhere(
   //               (element) => element.fkIdClient==widget.idclient
   //               &&element.isApprove==null , orElse: null)
   //
   //   );

    current = Provider.of<user_vm_provider>(context).currentUser;
    int _tabBarIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title:Text(getnamelong(_clientModel.nameEnterprise.toString()),
        style: TextStyle(color: kWhiteColor,fontFamily: kfontfamily2),) ,
        centerTitle: true,
        bottom: TabBar(
          // indicatorPadding: EdgeInsets.only(top: 20),
          labelPadding: const EdgeInsets.only(left: 2,right: 2,),
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabcontroller,
          indicatorColor: kWhiteColor,
          indicatorWeight: 6,

          // indicator: BoxDecoration(
          //   color: kWhiteColor,
          //   borderRadius: BorderRadius.circular(2),
          // ),
          labelColor: Colors.white,
          unselectedLabelColor: kWhiteColor,
          //isScrollable: true,

          tabs: <Widget>[
            Text(
              'البيانات ',
               style: TextStyle(
                  fontFamily: kfontfamily2,
                  //fontWeight: FontWeight.bold,
                  //color: _tabBarIndex == 0 ?kWhiteColor : kUnActiveColor,
                  //fontSize: _tabBarIndex == 0 ? 30 : 2,
                  //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              'الفواتير ',
              style: TextStyle(
              fontFamily: kfontfamily2,
                  //fontWeight: FontWeight.bold,
                  //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                  //fontSize: _tabBarIndex == 1 ? 30 : null,
                  //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              'التعليقات ',
              style: TextStyle(
                fontFamily: kfontfamily2,
                //fontWeight: FontWeight.bold,
                //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
               // fontSize: _tabBarIndex == 2 ? 20 : null,
                //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              ' الدعم ',
              style: TextStyle(
                fontFamily: kfontfamily2,
                //fontWeight: FontWeight.bold,
                //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                //fontSize: _tabBarIndex == 3 ? 20 : null,
                //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              'العناية ',
              style: TextStyle(
                fontFamily: kfontfamily2,
                //fontWeight: FontWeight.bold,
                //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                //fontSize: _tabBarIndex == 3 ? 20 : null,
                //decorationStyle: TextDecorationStyle.double
              ),
            ),
            Text(
              'التذاكر ',
              style: TextStyle(
                fontFamily: kfontfamily2,
                //fontWeight: FontWeight.bold,
                //color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                //fontSize: _tabBarIndex == 3 ? 20 : null,
                //decorationStyle: TextDecorationStyle.double
              ),
            ),
          ],
        ),
      ),
      body:

          Container(
            margin: EdgeInsets.only(bottom: 1),
            padding: const EdgeInsets.only(top:25,left: 5,right: 5),
            height: MediaQuery.of(context).size.height*0.85,
            child: TabBarView(
              controller: _tabcontroller,
              children: <Widget>[
                ClientView(

                  clienttransfer:widget.clienttransfer,
                  idclient: _clientModel.idClients.toString(),
                  invoice:null,//widget.invoiceModel,
                ),
                invoices(
                  itemClient: _clientModel,
                  fkclient: _clientModel.idClients.toString(),
                  fkuser: '',
                ),
                // InvoiceView(
                // idinvoice:
                // _invoiceModel==null?'':
                // _invoiceModel!.idInvoice.toString(),
                // clientmodel: _clientModel,
                // ),
                commentView(
                    client:_clientModel ,),
                support_view_invoices(
                  itemClient: _clientModel,
                ),
                // support_add(
                //
                //   idinvoice:_invoiceModel==null?'': _invoiceModel!.idInvoice,
                //
                // ),
                care_client_view(
                  fk_client:_clientModel.idClients.toString(),),

                ticketprofile(itemClient: _clientModel,),
                //InvoiceView(invoice: _invoiceModel,),
                //Icon(Icons.add),
              ],
            ),
          ),

    );
  }
}
