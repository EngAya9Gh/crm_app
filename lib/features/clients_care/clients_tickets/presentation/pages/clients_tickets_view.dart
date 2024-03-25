import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/data/models/TicketModel.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketdetail.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ticketsCubit.getTickets();
      Provider.of<ticket_vm>(context, listen: false).changeticket(0);
      Provider.of<ticket_vm>(context, listen: false).gettypeticket_filter('0');
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
              context.read<PrivilegeCubit>().checkPrivilege('26')
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kMainColor)),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ticketAdd(
                                          fk_client: null,
                                        )));
                          },
                          child: Text(' فتح تذكرة دعم ')),
                    )
                  : Container(),
              SizedBox(
                height: 2,
              ),
              search_widget('ticket', "المؤسسة ,العميل , رقم الهاتف....", ''),
              Consumer<ticket_vm>(builder: (context, selectedProvider, child) {
                return GroupButton(
                    controller: GroupButtonController(
                      selectedIndex: selectedProvider.selectedtypeticket,
                    ),
                    options: GroupButtonOptions(
                        selectedColor: kMainColor,
                        buttonWidth: 70,
                        borderRadius: BorderRadius.circular(10)),
                    buttons: ticketsCubit.filters,
                    onSelected: (_, index, isselected) {
                      //setState(() {
                      ticketsCubit.currentFilterIdx = index;
                      typePayController = index.toString();
                      selectedProvider.changeticket(index);
                      getfilter();
                    });
              }),
              SizedBox(
                height: 2,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8.0, bottom: 80),
                  child: TicketsList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ticketCard(BuildContext context, ticket_vm value, int index) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
                      color: Colors.black87.withOpacity(0.2),
                    ),
                  ],
                  color: Colors.white30,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => TicketDetails(
                                    ticketModel: value.tickesearchlist[index],
                                  ) // support_view(type: 'only',)
                              ));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: kWhiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '#' + value.tickesearchlist[index].idTicket,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: kfontfamily2),
                                ),
                                Text(
                                  'تاريخ فتح التذكرة  ' +
                                      value.tickesearchlist[index].dateOpen
                                          .toString(),
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: kfontfamily2),
                                ),
                              ],
                            ),
                            Text(
                              value.tickesearchlist[index].nameEnterprise
                                  .toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  fontWeight: FontWeight.bold),
                            ),
                            value.tickesearchlist[index].rate != null &&
                                    value.tickesearchlist[index].rate
                                            .toString() !=
                                        ''
                                ? Row(
                                    children: [
                                      //Text('تقييم بعد الإغلاق'),
                                      RatingBar.builder(
                                        initialRating: value
                                                    .tickesearchlist[index].rate
                                                    .toString() ==
                                                null
                                            ? 0.0
                                            : double.parse(value
                                                .tickesearchlist[index].rate
                                                .toString()),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        // glow: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }

  void getfilter() {
    Provider.of<ticket_vm>(context, listen: false)
        .gettypeticket_filter(typePayController);
  }
}

class TicketsList extends StatelessWidget {
  const TicketsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ticketsCubit = context.read<TicketsCubit>();
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (previous, current) {
        return current is GetTicketsLoaded ||
            current is GetTicketsError ||
            current is GetTicketsLoading ||
            current is TicketsFiltered;
      },
      builder: (context, state) {
        if (state is GetTicketsLoading) {
          return CustomLoadingIndicator();
        } else if (state is GetTicketsError) {
          return CustomErrorWidget(onPressed: () {
            ticketsCubit.getTickets();
          });
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: ticketsCubit.filteredTickets.length,
          itemBuilder: (context, index) {
            return TicketCard(ticket: ticketsCubit.filteredTickets[index]);
          },
        );
      },
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
                      color: Colors.black87.withOpacity(0.2),
                    ),
                  ],
                  color: Colors.white30,
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     CupertinoPageRoute(
                      //         builder: (context) => TicketDetails(
                      //               ticketModel: ticket,
                      //             ) // support_view(type: 'only',)
                      //         ));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: kWhiteColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '#' + ticket.idTicket,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: kfontfamily2),
                                ),
                                Text(
                                  "تاريخ فتح التذكرة ${ticket.dateOpen}",
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: kfontfamily2),
                                ),
                              ],
                            ),
                            Text(
                              ticket.nameEnterprise ?? '',
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  fontWeight: FontWeight.bold),
                            ),
                            ticket.rate != null && ticket.rate != ''
                                ? Row(
                                    children: [
                                      //Text('تقييم بعد الإغلاق'),
                                      RatingBar.builder(
                                        initialRating: ticket.rate == null
                                            ? 0.0
                                            : double.parse(ticket.rate),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        // glow: true,
                                        ignoreGestures: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (double value) {},
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }
}
