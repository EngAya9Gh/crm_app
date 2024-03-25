import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../constants.dart';
import '../../data/models/TicketModel.dart';

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
                      // todo: fix this
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
