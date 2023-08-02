import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/care/care_client_view.dart';
import 'package:crm_smart/ui/screen/care/comment_view.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketprofile.dart';
import 'package:crm_smart/ui/screen/invoice/invoces.dart';
import 'package:crm_smart/ui/screen/support/support_view_invoices.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../constants.dart';
import 'clientView.dart';

class ProfileClient extends StatefulWidget {
  ProfileClient({
    this.clientTransfer,
    this.invoiceModel,
    this.tabIndex,
    required this.idClient,
    this.client,
    Key? key,
  }) : super(key: key);

  String? idClient;
  int? tabIndex = 0;
  InvoiceModel? invoiceModel;
  String? clientTransfer;
  ClientModel? client;

  @override
  _ProfileClientState createState() => _ProfileClientState();
}

class _ProfileClientState extends State<ProfileClient> with TickerProviderStateMixin {
  late UserModel current;
  late ClientModel _clientModel = ClientModel();
  late TabController _tabController;
  int indexTab = 0;

  @override
  void initState() {
    indexTab = (widget.tabIndex == null ? 0 : widget.tabIndex)!;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<comment_vm>(context, listen: false).getComment(widget.idClient.toString());

      Provider.of<invoice_vm>(context, listen: false)
        ..get_invoiceclientlocal(widget.idClient, '')
        ..get_invoiceclientlocal(widget.idClient, 'مشترك');

       // Provider.of<communication_vm>(context, listen: false).getCommunicationall('');

      await Provider.of<client_vm>(context, listen: false).get_byIdClient(widget.idClient.toString());

      Provider.of<communication_vm>(context, listen: false).getCommunicationclient(widget.idClient.toString());

      Provider.of<ticket_vm>(context, listen: false).getclient_ticket(widget.idClient.toString());
    });

    super.initState();
    _tabController = TabController(length: 6, vsync: this, initialIndex: indexTab);
  }

  final appBarSize = AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<client_vm>(context, listen: true).listClient;
    if (list.any((element) => element.idClients == widget.idClient))
      _clientModel = list.firstWhereOrNull((element) => element.idClients == widget.idClient) ?? _clientModel;
    // _clientModel = widget.client ??
    //     Provider.of<client_vm>(context, listen: true)
    //         .listClient.firstorNullWhere((element) //error
    //         =>
    //         element.idClients == widget.idClient);

    current = Provider.of<user_vm_provider>(context).currentUser;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: appBarSize.height,
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextScroll(
                    _clientModel.nameEnterprise.toString() + "   ",
                    mode: TextScrollMode.endless,
                    velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                    delayBefore: Duration(milliseconds: 2000),
                    pauseBetween: Duration(milliseconds: 1000),
                    style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  )
                  // Marquee(
                  //   key: _textKey,
                  //   text: _clientModel.nameEnterprise.toString(),
                  //   style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
                  //   scrollAxis: Axis.horizontal,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   blankSpace: 20.0,
                  //   velocity: 30.0,
                  //   pauseAfterRound: Duration(seconds: 2),
                  //   startPadding: 0.0,
                  //   accelerationDuration: Duration(seconds: 2),
                  //   accelerationCurve: Curves.linear,
                  //   decelerationDuration: Duration(milliseconds: 1000),
                  //   decelerationCurve: Curves.easeOut,
                  //   textDirection: TextDirection.rtl,
                  // ),
                  ),
            ),
          );
        }),
        centerTitle: true,
        bottom: TabBar(
          labelPadding: const EdgeInsets.only(left: 2, right: 2),
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          indicatorColor: kWhiteColor,
          indicatorWeight: 6,
          labelColor: Colors.white,
          unselectedLabelColor: kWhiteColor,
          tabs: <Widget>[
            Text('البيانات ', style: TextStyle(fontFamily: kfontfamily2)),
            Text('الفواتير ', style: TextStyle(fontFamily: kfontfamily2)),
            Text('التعليقات ', style: TextStyle(fontFamily: kfontfamily2)),
            Text(' الدعم ', style: TextStyle(fontFamily: kfontfamily2)),
            Text('العناية ', style: TextStyle(fontFamily: kfontfamily2)),
            Text('التذاكر ', style: TextStyle(fontFamily: kfontfamily2)),
          ],
        ),
        // toolbarHeight: 75,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.only(top: 25, left: 5, right: 5),
        height: MediaQuery.of(context).size.height * 0.85,
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ClientView(
              client: _clientModel,
              clienttransfer: widget.clientTransfer,
              idclient: _clientModel.idClients.toString(),
              invoice: null, //widget.invoiceModel,
            ),
            invoices(itemClient: _clientModel, fkclient: _clientModel.idClients.toString(), fkuser: ''),
            commentView(client: _clientModel),
            support_view_invoices(itemClient: _clientModel),
            care_client_view(fk_client: _clientModel.idClients.toString()),
            ticketprofile(itemClient: _clientModel),
            //InvoiceView(invoice: _invoiceModel,),
            //Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}
