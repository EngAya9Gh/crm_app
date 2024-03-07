import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/ticketmodel.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../widgethomeitem.dart';
import 'card_ticket.dart';

class ticketprofile extends StatefulWidget {
  ticketprofile({required this.itemClient, Key? key}) : super(key: key);

  ClientModel1 itemClient;
  @override
  ticketprofileState createState() => ticketprofileState();
}

class ticketprofileState extends State<ticketprofile> {
  bool _isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<TicketModel> list_ticket = [];

  @override
  void initState() {
    // List<InvoiceModel> list= Provider.of<invoice_vm>(context,listen: false)
    //   .listinvoicebyregoin;
    //get info from list client_invoice فواتير العميل
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      // Provider.of<invoice_vm>(context,listen: false)
      //     .get_invoiceclientlocal(widget.itemClient.idClients,'مشترك');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list_ticket =
        Provider.of<ticket_vm>(context, listen: true).listticket_client;

    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2, top: 10, bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              AddManualTaskButton(
                list: ticketPublicTypeList,
                clientId: widget.itemClient.idClients,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  list_ticket.isNotEmpty
                      ? SelectCategory(
                          isicon: false,
                          colorbag: kMainColor,
                          colorarrow: kWhiteColor,
                          colortitle: kWhiteColor,
                          onTap: () async {
                            // Navigator.push(context,
                            //     CupertinoPageRoute(builder: (context)=>
                            //         ticketall()));
                          },
                          title: 'عدد التذاكر التي فتحت للعميل   ' +
                              list_ticket.length.toString(),
                        )
                      : Container(),
                ],
              ),
              Container(
                //height: MediaQuery.of(context).size.height * 1,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: list_ticket.length,
                    itemBuilder: (BuildContext context, int index) => Builder(
                        builder: (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: cardticket(
                                ticketModel: list_ticket[index],
                              ),
                            )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
