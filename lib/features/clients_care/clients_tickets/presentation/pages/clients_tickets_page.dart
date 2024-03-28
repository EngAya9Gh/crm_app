import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../ui/screen/search/search_container.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/tickets_list.dart';
import 'add_ticket_page.dart';

class ClientsTicketsPage extends StatefulWidget {
  const ClientsTicketsPage({Key? key}) : super(key: key);

  @override
  _ClientsTicketsPageState createState() => _ClientsTicketsPageState();
}

class _ClientsTicketsPageState extends State<ClientsTicketsPage> {
  late String typePayController;
  late TicketsCubit ticketsCubit;

  @override
  void initState() {
    ticketsCubit = context.read<TicketsCubit>();
    ticketsCubit.searchController.clear();
    ticketsCubit.currentFilterIdx = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ticketsCubit.getTickets();
      Provider.of<ClientTypeProvider>(context, listen: false)
          .getreasons('ticket');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تذاكر العملاء',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ListView(
            children: [
              if (context.read<PrivilegeCubit>().checkPrivilege('26')) ...[
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kMainColor),
                      ),
                      onPressed: () async {
                        AppNavigator.push(AddTicketPage(fkClient: null));
                      },
                      child: Text(' فتح تذكرة دعم '),
                    )),
                SizedBox(height: 2),
              ],
              search_widget('ticket', "المؤسسة ,العميل , رقم الهاتف....", ''),
              GroupButton(
                  controller: GroupButtonController(
                    selectedIndex: ticketsCubit.currentFilterIdx,
                  ),
                  options: GroupButtonOptions(
                      selectedColor: kMainColor,
                      buttonWidth: 70,
                      borderRadius: BorderRadius.circular(10)),
                  buttons: ticketsCubit.filtersAr,
                  onSelected: (_, index, isSelected) {
                    ticketsCubit.currentFilterIdx = index;
                  }),
              SizedBox(height: 2),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                padding: EdgeInsets.all(8),
                child: TicketsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
