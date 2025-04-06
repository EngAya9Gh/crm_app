import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/common/client_profile/client_dates_tab/presentation/pages/clients_dates_page.dart';
import 'package:crm_smart/features/sales/clients/clients_list/presentation/widgets/special_client_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/models/client_model.dart';
import '../../../core/common/models/event_model.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../features/ai_chat/presentation/pages/client_ai_chat_page.dart';
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import '../../../features/common/client_profile/client_activities_tab/presentation/pages/client_activities_page.dart';
import '../../../features/common/client_profile/invoices_tab/presentation/pages/invoces_tab_page.dart';
import '../../../features/common/client_profile/logs_tab/presentation/pages/client_logs_tab_page.dart';
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import '../../../features/common/client_profile/support_tab/presentation/pages/support_view_invoices.dart';
import '../../../features/common/client_profile/tasks_tab/presentation/pages/client_tasks_tab_page.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../features/sales/clients/clients_list/presentation/widgets/client_info_section.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/client_vm.dart';
import '../../../view_model/comment.dart';
import '../../../view_model/communication_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/page_state.dart';
import '../care/care_client_view.dart';
import '../care/comment_view.dart';
import '../home/ticket/ticketprofile.dart';

class ClientProfile extends StatefulWidget {
  const ClientProfile({
    super.key,
    this.clientTransfer,
    this.invoiceModel,
    this.tabIndex,
    this.commentId,
    this.tabCareIndex = 0,
    required this.idClient,
    this.client,
    this.event,
    this.idCommunication = '0',
  });

  final String? idClient;
  final int? tabIndex;
  final String? commentId;
  final int tabCareIndex;
  final InvoiceModel? invoiceModel;
  final String? clientTransfer;
  final ClientModel? client;
  final String idCommunication;
  final EventModel? event;

  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> with TickerProviderStateMixin {
  late final TicketsCubit ticketsCubit;
  late final SupportTabCubit supportTabCubit;
  late final InvoiceVm invoiceVm;
  late UserModel current;
  late TabController _tabController;
  late ValueNotifier<int> _currentTabIndex;
  int indexTab = 0;

  @override
  void initState() {
    super.initState();
    ticketsCubit = context.read<TicketsCubit>();
    supportTabCubit = context.read<SupportTabCubit>();
    invoiceVm = context.read<InvoiceVm>();
    indexTab = widget.tabIndex ?? 0;
    _currentTabIndex = ValueNotifier(0);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeData();
    });

    _tabController = TabController(length: _tabs().length, vsync: this, initialIndex: indexTab);
    _tabController.addListener(onChangeTab);
  }

  Future<void> _initializeData() async {
    Provider.of<comment_vm>(context, listen: false).getComments(widget.idClient.toString());
    await Provider.of<ClientProvider>(context, listen: false).getClientById(widget.idClient.toString());

    supportTabCubit.getClientInvoice(
      getInvoiceByClientParams: GetInvoiceByClientParams(
        idClient: widget.idClient.toString(),
        subscribed: true,
      ),
    );

    invoiceVm.getInvoiceByClient(widget.idClient);
    if (!mounted) return;
    Provider.of<CommunicationVm>(context, listen: false).getCommunicationclient(widget.idClient.toString(), widget.idCommunication);

    await ticketsCubit.getClientTicket(widget.idClient!);
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(onChangeTab)
      ..dispose();
    super.dispose();
  }

  void onChangeTab() {
    if (!_tabController.indexIsChanging) {
      _currentTabIndex.value = _tabController.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (context, state, _) {
        if (state.currentClientModel.isLoading || state.currentClientModel.isInit) {
          return _buildLoading();
        } else if (state.currentClientModel.isFailure) {
          return _buildFailure();
        }

        final client = state.currentClientModel.data;
        return _buildClientProfile(client);
      },
    );
  }

  Scaffold _buildLoading() {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  AppScaffold _buildFailure() {
    return AppScaffold(
      body: Center(
        child: IconButton(
          onPressed: () => context.read<ClientProvider>().getClientById(widget.idClient.toString()),
          icon: AppIcon(Icons.refresh),
        ),
      ),
    );
  }

  Widget _buildClientProfile(ClientModel? client) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: client!.nameEnterprise,
        showBackButton: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () async {
                        if (kIsWeb) {
                          HelperFunctions.copyToClipboard(client.mobile.toString());
                          return;
                        }
                        await HelperFunctions.urlLauncherPhone(client.mobile.toString());

                        // await FlutterPhoneDirectCaller.callNumber(
                        //     clientModel.mobile.toString());
                      },
                      child: AppText(
                        client.mobile.toString(),
                        fontFamily: AppFonts.fontFamily1,
                        color: AppColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 1),
                    Container(
                      height: 31.scaleIconsSize,
                      width: 31.scaleIconsSize,
                      //color: AppColors.kMainColor,
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(9))),
                      child: IconButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            HelperFunctions.copyToClipboard(client.mobile.toString());
                            return;
                          }
                          await HelperFunctions.urlLauncherPhone(client.mobile.toString());

                          // await FlutterPhoneDirectCaller.callNumber(
                          //     clientModel.mobile.toString());
                        },
                        icon: AppIcon(
                          kIsWeb ? Icons.copy : Icons.call,
                          size: 15,
                          color: AppColors.primaryMain,
                        ),
                        // color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              _buildTabBar(),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: _currentTabIndex,
            builder: (context, currentIndex, _) {
              return Column(
                children: [
                  if ((client.tag ?? false) && currentIndex != 0) ...{
                    SizedBox(height: 20),
                    if (context.read<PrivilegesCubit>().checkPrivilege('133'))
                      AppIcon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: AppColors.secondaryMain,
                      ),
                  },
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: _buildTabViews(client!),
                    ),
                  ),
                ],
              );
            },
          ),
          // Add AI Chat for client profile
          ClientAIChatPage(clientId: widget.idClient ?? ''),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TabBar(
        controller: _tabController,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8),
        labelPadding: const EdgeInsets.only(left: 8, right: 8),
        labelColor: Colors.white,
        labelStyle: TextStyle(
          fontFamily: AppFonts.fontFamily2,
          fontSize: 15.scaleFontSize,
          fontWeight: FontWeight.bold,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: AppColors.white,
        indicatorWeight: 6,
        isScrollable: true,
        unselectedLabelStyle: TextStyle(fontFamily: AppFonts.fontFamily2, fontSize: 14.scaleFontSize, fontWeight: FontWeight.w600),
        unselectedLabelColor: AppColors.white,
        onTap: (value) => _currentTabIndex.value = value,
        tabAlignment: TabAlignment.center,
        tabs: _tabs(),
      ),
    );
  }

  List<Widget> _tabs() {
    return <Widget>[
      AppText('البيانات ', style: TextStyle(fontFamily: AppFonts.fontFamily2)),
      AppText('الفواتير ', style: TextStyle(fontFamily: AppFonts.fontFamily2)),
      AppText('التعليقات ', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
      AppText(' الدعم ', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
      AppText('العناية ', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
      // AppText('التذاكر ', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
      // AppText('الانشطة', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
      AppText('الأنشطة', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
      if (context.read<PrivilegesCubit>().checkPrivilege('282')) AppText('السجل', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
      // AppText('المهام', style: TextStyle(fontFamily: AppFonts.fontFamily1)),
    ];
  }

  List<Widget> _buildTabViews(ClientModel client) {
    return <Widget>[
      ClientInfoSection(
        client: client,
        clientTransfer: widget.clientTransfer,
        idClient: client.idClients.toString(),
        invoice: null,
      ),
      InvoicesTabPage(client: client),
      CommentView(
        client: client,
        commentId: widget.commentId != null ? int.tryParse(widget.commentId!) : null,
      ),
      SupportViewInvoices(itemClient: client),
      CareClientView(
        fk_client: client.idClients.toString(),
        tabCareIndex: widget.tabCareIndex,
        idCommunication: widget.idCommunication,
      ),
      // TicketProfile(itemClient: client),
      // ClientActivitiesPage(client: client),
      ClientsDatesPage(client: client),
      ClientLogsTabPage(client: client),
      // ClientTasksTabPage(client: client),
    ];
  }
}
