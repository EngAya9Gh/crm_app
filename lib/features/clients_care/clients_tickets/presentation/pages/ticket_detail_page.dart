import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../function_global.dart';
import '../../../../../ui/widgets/custom_widget/rowdivided.dart';
import '../../../../../view_model/ticket_vm.dart';
import '../../data/models/ticket_model.dart';
import '../widgets/ticket_details_buttons.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({
    this.type,
    Key? key,
    required this.ticketModel,
  }) : super(key: key);
  final String? type;
  final TicketModel ticketModel;

  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
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
                      child: TicketDetailsButtons(
                        ticketModel: widget.ticketModel,
                      )),
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
