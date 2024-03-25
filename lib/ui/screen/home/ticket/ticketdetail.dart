import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/clients_care/clients_tickets/data/models/TicketModel.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../function_global.dart';
import '../../../../view_model/ticket_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../widgets/custom_widget/rowdivided.dart';
import '../../client/profileclient.dart';
import '../../client/transfer_client.dart';
import 'close_ticket_dialog.dart';
import 'ticket_rate.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({
    this.type,
    Key? key,
    required this.ticketModel,
  }) : super(key: key);
  final String? type;
  final TicketModel ticketModel;

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  late final ticket_vm ticketVm;

  @override
  void initState() {
    ticketVm = context.read<ticket_vm>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ticketVm.getCategories();
      ticketVm.getSubCategories();
    });

    super.initState();
  }

  Widget _tranferall(
      String nameto, String namefrom, String date, String resoan) {
    return Column(
      children: [
        cardRowDivided(
          title: 'قام بتحويل التذكرة ',
          value: getnameshort(namefrom),
        ),
        cardRowDivided(
          title: 'الشخص المحول له ',
          value: getnameshort(nameto),
        ),

        cardRowDivided(title: 'تاريخ تحويل التذكرة ', value: date),
        cardRowDivided(
          title: ' سبب التحويل ',
          value: resoan,
          isExpanded: true,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        // Row(
        //
        //   children: [
        //     //Expanded flex 1
        //     Text(name,
        //       style: TextStyle(fontFamily: kfontfamily2),),
        //     Spacer(),
        //     Text( price,style: TextStyle(fontFamily: kfontfamily2),),
        //   ],
        // ),
        // Divider(thickness: 1,color: Colors.grey,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.ticketModel.typeTicket} #${widget.ticketModel.idTicket}",
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                if (widget.type == null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.ticketModel.dateRecive == null
                            ? context
                                    .read<PrivilegeCubit>()
                                    .checkPrivilege('71')
                                ? Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kMainColor)),
                                          onPressed: () async {
                                            Provider.of<ticket_vm>(context,
                                                    listen: false)
                                                .updateTicketvm({
                                              'fk_user_recive':
                                                  Provider.of<UserProvider>(
                                                          context,
                                                          listen: false)
                                                      .currentUser
                                                      .idUser,
                                              'date_recive': DateTime.now(),
                                              'type_ticket': 'قيد التنفيذ'
                                            }, widget.ticketModel.idTicket);
                                            Navigator.pop(context);
                                          },
                                          child: Text('استلام التذكرة')),
                                    ),
                                  )
                                : Container()
                            : Container(),
                        widget.ticketModel.dateClose == null
                            ? context
                                    .read<PrivilegeCubit>()
                                    .checkPrivilege('72')
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kMainColor)),
                                          onPressed: () async {
                                            await showDialog<void>(
                                                context: context,
                                                builder: (context) =>
                                                    CloseTicketDialog(
                                                      ticketModel:
                                                          widget.ticketModel,
                                                    ));
                                          },
                                          child: Text('اغلاق التذكرة')),
                                    ),
                                  )
                                : Container()
                            : Container(),
                        // SizedBox(width: 2,),
                        widget.ticketModel.dateRecive != null &&
                                widget.ticketModel.dateClose == null
                            ? context
                                    .read<PrivilegeCubit>()
                                    .checkPrivilege('75')
                                ? Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    kMainColor)),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      transferClient(
                                                        name_enterprise: widget
                                                            .ticketModel
                                                            .nameEnterprise
                                                            .toString(),
                                                        idclient: widget
                                                            .ticketModel
                                                            .fkClient
                                                            .toString(),
                                                        idticket: widget
                                                            .ticketModel
                                                            .idTicket,
                                                        type: "ticket",
                                                      ),
                                                  fullscreenDialog: true));
                                        },
                                        child: Text('تحويل التذكرة'),
                                      ),
                                    ),
                                  )
                                : Container()
                            : Container(),
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kMainColor)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ProfileClient(
                                            idClient:
                                                widget.ticketModel.fkClient,
                                          )));
                            },
                            child: Text('ملف العميل'),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (widget.ticketModel.dateClose != null &&
                            widget.ticketModel.dateRate == null) ...[
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kMainColor)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ticket_rate(
                                              ticket_model: widget.ticketModel,
                                            )));
                              },
                              child: Text('تقييم بعد الإغلاق'),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                if (widget.ticketModel.dateClose != null) ...[
                  cardRowDivided(
                      title: 'قام بإغلاق التذكرة ',
                      value: getnameshort(
                        widget.ticketModel.fkUserClose.toString(),
                      )),
                  cardRowDivided(
                    title: 'تاريخ إغلاق التذكرة ',
                    value: widget.ticketModel.dateClose,
                  ),
                  cardRowDivided(
                    title: '  ملاحظات إغلاق التذكرة ',
                    value: widget.ticketModel.notesTicket,
                    isExpanded: true,
                  ),
                ],
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                // for (int i = 0;
                //     i < widget.ticketModel.transferticket!.length;
                //     i++)
                //   _tranferall(
                //       widget.ticketModel.transferticket![i]!.nameuserto
                //           ,
                //       widget.ticketModel.transferticket![i]!.nameuserfrom
                //           ,
                //       widget.ticketModel.transferticket![i]!.date_assigntr
                //           ,
                //       widget
                //           .ticketModel.transferticket![i]!.resoantransfer_ticket
                //           ),

                if (widget.ticketModel.dateRecive != null) ...[
                  cardRowDivided(
                      title: 'قام باستلام التذكرة ',
                      value: getnameshort(
                        widget.ticketModel.fkUserRecive.toString(),
                      )),
                ],
                widget.ticketModel.dateRecive != null
                    ? cardRowDivided(
                        title: 'تاريخ استلام التذكرة ',
                        value: widget.ticketModel.dateRecive)
                    : Container(),

                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                cardRowDivided(
                    title: 'قام بفتح التذكرة ',
                    value:
                        getnameshort(widget.ticketModel.fkUserOpen.toString())),
                cardRowDivided(
                    title: 'تاريخ فتح التذكرة ',
                    value: widget.ticketModel.dateOpen),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                cardRowDivided(
                    title: 'نوع التذكرة',
                    value: widget.ticketModel.typeProblem),
                cardRowDivided(
                    title: 'مصدر التذكرة',
                    value: widget.ticketModel.ticketSource),
                cardRowDivided(
                  title: 'تفاصيل التذكرة',
                  value: widget.ticketModel.detailsProblem,
                  isExpanded: true,
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                //cardRowDivided( title: 'تقييم بعد الإغلاق',value:  ticketModel.rate),
                widget.ticketModel.dateRate != null
                    ? Row(
                        children: [
                          Text('تقييم بعد الإغلاق'),
                          RatingBar.builder(
                            initialRating:
                                double.parse(widget.ticketModel.rate),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            // glow: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      )
                    : Container(),

                widget.ticketModel.dateRate != null
                    ? cardRowDivided(
                        title: 'قام بالتقييم',
                        value: widget.ticketModel.fkuserRate)
                    : Container(),

                widget.ticketModel.dateRate != null
                    ? cardRowDivided(
                        title: 'تاريخ التقييم',
                        value: widget.ticketModel.dateRate)
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
