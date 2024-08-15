import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/filter_tickets_sheet.dart';
import '../widgets/tickets_list.dart';
import 'add_ticket_page.dart';

class ClientsTicketsPage extends StatefulWidget {
  const ClientsTicketsPage({Key? key}) : super(key: key);

  @override
  _ClientsTicketsPageState createState() => _ClientsTicketsPageState();
}

class _ClientsTicketsPageState extends State<ClientsTicketsPage> {
  late String typePayController;
  late TicketsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<TicketsCubit>()..init();
    _cubit.pageVariables.searchController.clear();
    _cubit.currentFilterIdx = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getTickets();
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
              5.height,
              Row(
                children: [
                  Expanded(
                    child: CustomSearchWidget(
                      searchController: _cubit.pageVariables.searchController,
                      onChanged: (value) => _cubit.filterTicketsLocally(),
                    ),
                  ),
                  CustomFilterIcon(
                    onTap: () async {
                      final value = await AppBottomSheet.show(
                        context: context,
                        child: FilterTicketsSheet(),
                      );
                      if (value != true) {
                        _cubit.returnToPreviousState();
                      }
                    },
                  ),
                  8.width,
                ],
              ),
              5.height,
              GroupButton(
                  controller: GroupButtonController(
                    selectedIndex: _cubit.currentFilterIdx,
                  ),
                  options: GroupButtonOptions(
                      selectedColor: kMainColor,
                      buttonWidth: 65,
                      borderRadius: BorderRadius.circular(5)),
                  buttons: _cubit.pageVariables.arTitles,
                  onSelected: (_, index, isSelected) {
                    _cubit.currentFilterIdx = index;
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
