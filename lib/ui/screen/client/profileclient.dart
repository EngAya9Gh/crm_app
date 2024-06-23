import 'package:crm_smart/features/common/client_profile/invoices_tab/presentation/pages/invoces_tab_page.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/care/care_client_view.dart';
import 'package:crm_smart/ui/screen/care/comment_view.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketprofile.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../constants.dart';
import '../../../core/common/enums/participate_enum.dart';
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../../features/common/client_profile/support_tab/presentation/pages/support_view_invoices.dart';
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../features/sales/clients_list/presentation/widgets/client_section.dart';
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
  late final TicketsCubit ticketsCubit;
  late final SupportTabCubit supportTabCubit;
  late final InvoiceVm invoiceVm;
  late UserModel current;

  // late ClientModel _clientModel = ClientModel();
  late TabController _tabController;
  late ValueNotifier<int> _currentTabIndex;
  int indexTab = 0;

  @override
  void initState() {
    ticketsCubit = context.read<TicketsCubit>();
    supportTabCubit = context.read<SupportTabCubit>();
    invoiceVm = context.read<InvoiceVm>();
    indexTab = (widget.tabIndex == null ? 0 : widget.tabIndex)!;
    _currentTabIndex = ValueNotifier(0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<comment_vm>(context, listen: false)
          .getComments(widget.idClient.toString());

      /* same API needs to be changed from provider to bloc */
      supportTabCubit
        ..getClientInvoice(
          getInvoiceByClientParams: GetInvoiceByClientParams(
            idClient: widget.idClient.toString(),
            subscribed: true,
          ),
          type: ParticipateEnum.participate,
        );

      invoiceVm.getInvoiceByClient(widget.idClient, '');
      /* same API */

      await Provider.of<ClientProvider>(context, listen: false)
          .get_byIdClient(widget.idClient.toString());

      Provider.of<communication_vm>(context, listen: false)
          .getCommunicationclient(
              widget.idClient.toString(), widget.idCommunication);

      await ticketsCubit.getClientTicket(widget.idClient!);
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
                      child: TextScroll(
                        client!.nameEnterprise.toString() + "   ",
                        mode: TextScrollMode.endless,
                        velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                        delayBefore: Duration(milliseconds: 2000),
                        pauseBetween: Duration(milliseconds: 1000),
                        style: TextStyle(
                            color: kWhiteColor, fontFamily: kfontfamily2),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                ),
              );
            }),
            centerTitle: true,
            bottom: TabBar(
              controller: _tabController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8),
              labelPadding: const EdgeInsets.only(left: 8, right: 8),
              labelColor: Colors.white,
              labelStyle: TextStyle(
                fontFamily: kfontfamily2,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: kWhiteColor,
              indicatorWeight: 6,
              isScrollable: true,
              unselectedLabelStyle: TextStyle(
                  fontFamily: kfontfamily2,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              unselectedLabelColor: kWhiteColor,
              onTap: (value) => _currentTabIndex.value = value,
              tabAlignment: TabAlignment.center,
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
                            InvoicesTabPage(
                                itemClient: client,
                                fkClient: client.idClients.toString(),
                                fkUser: ''),
                            CommentView(
                              client: client,
                            ), //event: widget.event),

                            // SupportViewInvoices(itemClient: client),
                            SupportViewInvoices(itemClient: client),
                            CareClientView(
                              fk_client: client.idClients.toString(),
                              tabCareIndex: widget.tabCareIndex,
                              idCommunication: widget.idCommunication,
                            ),
                            TicketProfile(itemClient: client),
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
