import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/clientmodel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/maincity_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/client_widget/invoice_filter_widget.dart';
import '../../widgets/client_widget/invoices_counter_widget.dart';
import '../../widgets/client_widget/invoices_list_view.dart';
import '../search/search_container.dart';

class ClientWaiting extends StatefulWidget {
  ClientWaiting({required this.type_card, Key? key}) : super(key: key);
  String type_card;

  @override
  _ClientWaitingState createState() => _ClientWaitingState();
}

class _ClientWaitingState extends State<ClientWaiting> {
  String? regoin;
  late ClientModel1 itemClient;
  late UserModel user;

  @override
  void initState() {
    _loadData();

    _initVariables();

    super.initState();
  }

  void _initVariables() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final invoiceVm = Provider.of<invoice_vm>(context, listen: false);
      invoiceVm.listInvoicesAccept = [];
      Provider.of<ClientTypeProvider>(context, listen: false)
          .changelisttype_install('الكل');
      invoiceVm.typeClientValue = 'الكل';
      // Provider.of<ClientProvider>(context, listen: false).getallclientAccept();
      invoiceVm.filterInvoices(
        listSelectedRegions: context.read<MainCityProvider>().selectedRegions,
      );
    });
  }

  void _loadData() {
    user = context.read<UserProvider>().currentUser;
    context
        .read<MainCityProvider>()
        .filterMainCityByCurrentUserMainCityList(user);
    context.read<MainCityProvider>().getCitiesFromRegions();
  }

  @override
  Widget build(BuildContext context) {
    final MainCityProvider mainCityProvider = context.watch<MainCityProvider>();
    return Theme(
      data: context.theme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: context.theme.elevatedButtonTheme.style!.copyWith(
          minimumSize: MaterialStatePropertyAll(Size(50, 35.h)),
        )),
        textButtonTheme: TextButtonThemeData(
            style: context.theme.textButtonTheme.style!.copyWith(
          minimumSize: MaterialStatePropertyAll(Size(50, 35.h)),
        )),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'فواتير العملاء',
            style: TextStyle(color: kWhiteColor),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView(
                children: [
                  // filter by region, cities and state
                  InvoiceFilterWidget(),
                  // search
                  search_widget('waitsupport', hintnamefilter, ''),
                  InvoicesCounterWidget(),
                  SizedBox(height: 5),
                  InvoicesListView(typeCard: widget.type_card),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
