import '../../../features/clients_care/clients_tickets/presentation/pages/add_ticket_page.dart';
import '../../../function_global.dart';
import '../../../model/communication_modle.dart';
import '../home/ticket/ticket_all.dart';
import '../home/ticket/ticketview.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/card_expansion.dart';
import '../../widgets/custom_widget/card_row.dart';
import '../../../view_model/communication_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../features/clients_care/clients_tickets/data/models/ticket_model.dart';
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';

class careView extends StatefulWidget {
  careView({required this.fk_client, Key? key}) : super(key: key);
  String fk_client;

  @override
  _careViewState createState() => _careViewState();
}

class _careViewState extends State<careView> {
  List<CommunicationModel> listCommunication = [];
  List<TicketModel> listticket_client = [];
  TicketModel? ttc;

  @override
  void initState() {
    // Provider.of<communication_vm>(context, listen: false)
    //     .getCommunication(widget.fk_client);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listCommunication =
        Provider.of<communication_vm>(context, listen: true).listCommunication;

    listticket_client = context.watch<TicketsCubit>().clientTicketsList;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              listCommunication.isNotEmpty
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: GroupedListView<CommunicationModel, String>(
                        elements: listCommunication,
                        groupBy: (element) {
                          switch (element.typeCommuncation) {
                            case 'ترحيب':
                              return 'ترحيب';

                            case 'تركيب':
                              return 'تركيب';

                            case 'دوري':
                              return 'الربع الأول';

                            // case 'support':
                            //   return 'الدعم الفني';
                          }
                          return '';
                        },
                        groupComparator: (value1, value2) =>
                            value2.compareTo(value1),
                        itemComparator: (item1, item2) => item1
                            .typeCommuncation!
                            .compareTo(item2.typeCommuncation.toString()),
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        groupSeparatorBuilder: (String value) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        itemBuilder: (c, element) {
                          return Container(
                              child: buildcardExpansion(
                                  get_title_care(
                                          element.typeCommuncation.toString()) +
                                      '(فاتورة ${element.date_create})',
                                  '',
                                  Column(
                                    children: [
                                      element.typeCommuncation == 'ترحيب'
                                          ? CardRow(
                                              title: 'تم الترحيب من قبل',
                                              value: getnameshort(
                                                  element.nameUser.toString()),
                                            )
                                          : Container(),
                                      element.typeCommuncation == 'ترحيب'
                                          ? CardRow(
                                              title: 'تاريخ الترحيب بالعميل',
                                              value: element.dateCommunication
                                                  .toString(),
                                            )
                                          : Container(),
                                      element.typeCommuncation == 'تركيب'
                                          ? CardRow(
                                              title:
                                                  'تم التأكد من جودة التركيب من قبل',
                                              value: getnameshort(
                                                  element.nameUser.toString()),
                                            )
                                          : Container(),
                                      element.typeCommuncation == 'تركيب'
                                          ? CardRow(
                                              title:
                                                  'تاريخ التأكد من التركيب للعميل',
                                              value: element.dateCommunication
                                                  .toString(),
                                            )
                                          : Container(),
                                      element.typeCommuncation == 'تركيب'
                                          ? CardRow(
                                              title: ' نتيجة التواصل',
                                              value: element.result.toString(),
                                            )
                                          : Container(),
                                      element.typeCommuncation == 'دوري'
                                          ? CardRow(
                                              title: 'موظف التقييم',
                                              value: getnameshort(
                                                  element.nameUser.toString()),
                                            )
                                          : Container(),
                                      element.typeCommuncation == 'دوري'
                                          ? CardRow(
                                              title: 'تاريخ التقييم',
                                              value: element.dateCommunication
                                                  .toString(),
                                            )
                                          : Container(),
                                      element.typeCommuncation == 'دوري'
                                          ? CardRow(
                                              title: 'مستوى التقييم',
                                              value: element.rate.toString(),
                                            )
                                          : Container(),
                                    ],
                                  )));
                        },
                      ),
                    )
                  : ContainerShadows(
                      margin: EdgeInsets.only(),
                      child: Center(child: Text('العميل ليس لديه أي تواصلات ')),
                    ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      listticket_client.isNotEmpty ||
                              listticket_client
                                      .firstWhere(
                                          (element) =>
                                              element.typeTicket ==
                                                  'قيد التنفيذ' ||
                                              element.typeTicket == 'جديدة',
                                          orElse: () => TicketModel(
                                                idTicket: '',
                                                fkClient: '',
                                                typeProblem: '',
                                                detailsProblem: '',
                                                notesTicket: '',
                                                typeTicket: '',
                                                fkUserOpen: '',
                                                fkUserClose: '',
                                                fkUserRecive: '',
                                                dateOpen: '',
                                                dateClose: '',
                                                dateRecive: '',
                                                clientType: '',
                                                nameClient: '',
                                                nameEnterprise: '',
                                                // nameRegoin: '',
                                                // nameuseropen: '',
                                                // nameuserrecive: '',
                                                // nameuserclose: '',
                                                // fk_country: '',
                                              ))
                                      .idTicket !=
                                  ''
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kMainColor)),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => TicketAll()
                                        // TicketView(
                                        //     ticketModel:
                                        //     listticket_client[0]
                                        // ))
                                        ));
                              },
                              child: Text('تذاكر العميل'))
                          : ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kMainColor)),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => AddTicketPage(
                                              fkClient:
                                                  widget.fk_client.toString(),
                                            )));
                              },
                              child: Text(' فتح تذكرة دعم ')),
                      listticket_client.isNotEmpty
                          ? buildcardExpansion(
                              'تفاصيل آخر تذكرة',
                              '',
                              //   Expanded(
                              // child: ListView(
                              //     children: [
                              TicketView(ticketModel: listticket_client.last)
                              //]),
                              //)
                              )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('عدد التذاكر التي فتحت للعميل ' +
                            listticket_client.length.toString()),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
