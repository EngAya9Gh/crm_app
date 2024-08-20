import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/invoiceModel.dart';
import '../../../ui/screen/care/comment_view.dart';
import '../../../ui/screen/invoice/invoiceView.dart';
import '../../../view_model/client_vm.dart';
import '../../../view_model/comment.dart';
import '../../app/presentation/widgets/app_text.dart';
import 'clients_list/presentation/widgets/client_info_section.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({
    super.key,
    required this.invoiceModel,
    required this.typeInvoice,
  });

  final InvoiceModel invoiceModel;
  final String typeInvoice;

  @override
  State<StatefulWidget> createState() => _client_dashboard();
}

class _client_dashboard extends State<ClientDashboard>
    with TickerProviderStateMixin {
  late final ClientProvider _clientProvider;
  late final TabController _tabsController;

  @override
  void initState() {
    _clientProvider = context.read<ClientProvider>();
    _tabsController = TabController(length: _tabs().length, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _clientProvider
          .get_byIdClient(widget.invoiceModel.fkIdClient.toString());

      Provider.of<comment_vm>(context, listen: false)
          .getComments(widget.invoiceModel.fkIdClient.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs().length,
      child: ModalProgressHUD(
        inAsyncCall: _clientProvider.isloading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,
            title: Text(
              'ملف العميل',
              style: TextStyle(color: kWhiteColor),
            ),
            centerTitle: true,
            bottom: TabBar(
              labelPadding: const EdgeInsets.only(left: 10, right: 10, top: 2),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabsController,
              indicatorColor: kWhiteColor,
              indicatorWeight: 5,
              indicator: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(2),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: _tabs(),
            ),
          ),
          body: Consumer<ClientProvider>(
            builder: (context, state, child) {
              final client = state.currentClientModel.data;
              if (_clientProvider.isloading) {
                return AppLoader();
              } else {
                return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: TabBarView(
                    controller: _tabsController,
                    children: <Widget>[
                      ClientInfoSection(
                        client: client,
                        idClient: widget.invoiceModel.fkIdClient.toString(),
                        invoice: widget.invoiceModel,
                        typeInvoice: widget.typeInvoice,
                      ),
                      InvoiceView(
                        type: 'approved',
                        invoice: widget.invoiceModel,
                      ),
                      CommentView(
                        client: client,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _tabs() {
    return <Widget>[
      AppText('البيانات'),
      AppText('الفاتورة '),
      AppText('التعليقات'),
    ];
  }

  @override
  void dispose() {
    _tabsController.dispose();
    super.dispose();
  }
}
