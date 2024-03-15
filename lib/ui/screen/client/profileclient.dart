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
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../constants.dart';
import '../../../features/clients_list/presentation/widgets/client_section.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../model/calendar/event_model.dart';

class ProfileClient extends StatefulWidget {
  ProfileClient({
    this.clientTransfer,
    this.invoiceModel,
    this.tabIndex,
    this.tabCareIndex = 0,
    required this.idClient,
    this.client,
    Key? key,
    this.event,
    this.idCommunication = '0',
  }) : super(key: key);

  String? idClient;
  int? tabIndex = 0;
  int tabCareIndex;
  InvoiceModel? invoiceModel;
  String? clientTransfer;
  ClientModel1? client;
  String idCommunication;
  final EventModel? event;

  @override
  _ProfileClientState createState() => _ProfileClientState();
}

class _ProfileClientState extends State<ProfileClient>
    with TickerProviderStateMixin {
  late UserModel current;

  // late ClientModel _clientModel = ClientModel();
  late TabController _tabController;
  late ValueNotifier<int> _currentTabIndex;
  int indexTab = 0;

  @override
  void initState() {
    indexTab = (widget.tabIndex == null ? 0 : widget.tabIndex)!;
    _currentTabIndex = ValueNotifier(0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<comment_vm>(context, listen: false)
          .getComment(widget.idClient.toString());

      Provider.of<invoice_vm>(context, listen: false)
        ..get_invoiceclientlocal(widget.idClient, '')
        ..get_invoiceclientlocal(widget.idClient, 'مشترك');

      // Provider.of<communication_vm>(context, listen: false).getCommunicationall('');

      await Provider.of<ClientProvider>(context, listen: false)
          .get_byIdClient(widget.idClient.toString());

      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationclient(
              widget.idClient.toString(), widget.idCommunication);

      Provider.of<ticket_vm>(context, listen: false)
          .getclient_ticket(widget.idClient.toString());
    });

    super.initState();
    _tabController =
        TabController(length: 6, vsync: this, initialIndex: indexTab);
    _tabController.addListener(onChangeTab);
  }

  final appBarSize = AppBar().preferredSize;

  onChangeTab() {
    if (!_tabController.indexIsChanging) {
      _currentTabIndex.value = _tabController.index;
    }
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(onChangeTab)
      ..dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final list = Provider.of<client_vm>(context, listen: true).listClient;
    // if (list.any((element) => element.idClients == widget.idClient))
    //   _clientModel = list.firstWhereOrNull((element) => element.idClients == widget.idClient) ?? _clientModel;

    // _clientModel = widget.client ??
    //     Provider.of<client_vm>(context, listen: true)
    //         .listClient.firstorNullWhere((element) //error
    //         =>
    //         element.idClients == widget.idClient);

    // current = Provider.of<user_vm_provider>(context).currentUser;

    return Consumer<ClientProvider>(
      builder: (context, state, _) {
        if (state.currentClientModel.isLoading ||
            state.currentClientModel.isInit) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state.currentClientModel.isFailure) {
          return Scaffold(
            body: Center(
              child: IconButton(
                onPressed: () => context
                    .read<ClientProvider>()
                    .get_byIdClient(widget.idClient.toString()),
                icon: Icon(Icons.refresh),
              ),
            ),
          );
        }

        final client = state.currentClientModel.data;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,

            title: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: appBarSize.height,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child:
                      TextScroll(
                        client!.nameEnterprise.toString() + "   ",
                        mode: TextScrollMode.endless,
                        velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                        delayBefore: Duration(milliseconds: 2000),
                        pauseBetween: Duration(milliseconds: 1000),
                        style: TextStyle(
                            color: kWhiteColor, fontFamily: kfontfamily2),
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
              labelPadding: const EdgeInsets.only(left: 8, right: 8),
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              indicatorColor: kWhiteColor,
              indicatorWeight: 6,
              physics: AlwaysScrollableScrollPhysics(),
              labelColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 8),
              isScrollable: true,
              labelStyle: TextStyle(
                fontFamily: kfontfamily2,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                  fontFamily: kfontfamily2,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              unselectedLabelColor: kWhiteColor,
              onTap: (value) => _currentTabIndex.value = value,
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
          body: ValueListenableBuilder<int>(
              valueListenable: _currentTabIndex,
              builder: (context, currentIndex, _) {
                return Column(
                  children: [
                    if ((client!.tag ?? false) && currentIndex != 0) ...{
                      SizedBox(height: 20),
                      (context.read<PrivilegeCubit>().checkPrivilege('133'))
                          ? Icon(
                              CupertinoIcons.checkmark_seal_fill,
                              color: Colors.amber,
                            )
                          : Container(),
                    },
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1),
                        padding:
                            const EdgeInsets.only(top: 0, left: 5, right: 5),
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            ClientSection(
                              client: client,
                              clienttransfer: widget.clientTransfer,
                              idclient: client.idClients.toString(),
                              invoice: null, //widget.invoiceModel,
                            ),
                            invoices(
                                itemClient: client,
                                fkclient: client.idClients.toString(),
                                fkuser: ''),
                            commentView(client: client, ),//event: widget.event),

                            support_view_invoices(itemClient: client),
                            care_client_view(
                              fk_client: client.idClients.toString(),
                              tabCareIndex: widget.tabCareIndex,
                              idCommunication: widget.idCommunication,
                            ),
                            ticketprofile(itemClient: client),
                            //InvoiceView(invoice: _invoiceModel,),
                            //Icon(Icons.add),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
