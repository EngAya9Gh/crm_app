import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class cardcommalltype extends StatelessWidget {
  cardcommalltype(
      {Key? key,
      // required this.iduser,
      required this.itemcom,
      required this.tabCareIndex})
      : super(key: key);

  ///ClientModel itemClient;
  CommunicationModel itemcom;
  final int tabCareIndex;

  //String iduser;

  @override
  Widget build(BuildContext context) {
    //العملاء المشتركين
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
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
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => ProfileClient(
                  idClient: itemcom.fkClient,
                  tabIndex: 4,
                  tabCareIndex: tabCareIndex,
                  idCommunication: itemcom.idCommunication,
                ),
              ),
            );

            // Navigator.push(
            //                context,
            //                CupertinoPageRoute(
            //                    builder: (context) =>
            //                        installAdd(
            //                          com: itemcom,
            //                        )));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      itemcom.type_install == '2'
                          ? Text(
                              itemcom.dateCommunication == null
                                  ? itemcom.date_last_com_install.toString()
                                  : itemcom.dateCommunication.toString(),
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
                            )
                          : Text(
                              itemcom.typeCommuncation == 'ترحيب'
                                  ? itemcom.date_approve.toString()
                                  : itemcom.type_install == '1' && itemcom.dateCommunication == null
                                      ? itemcom.dateinstall_done.toString()
                                      : itemcom.dateCommunication.toString(),
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
                            ),
                    ],
                  ),
                  // itemcom.type_install=='2' &&
                  itemcom.dateCommunication == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              itemcom.name_regoin.toString(),
                              style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: kfontfamily2,
                                  color: kMainColor),
                            ),
                            itemcom.hoursdelaylabel != null
                                ?
                                // itemcom.type_install=='2' ?
                                Text(
                                    int.parse(itemcom.hoursdelaylabel.toString()) < 0
                                        ? ' تأخر عن التواصل  ' +
                                            (int.parse(itemcom.hoursdelaylabel.toString()) * -1).toString() +
                                            ' يوم '
                                        : ' باقي ' + itemcom.hoursdelaylabel.toString() + ' يوم ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: kfontfamily2,
                                        color: kMainColor),
                                  )
                                // Text(
                                //   int.parse(itemcom.hoursdelaylabel.toString())<0?
                                //   ' تأخر عن التواصل  '+(int.parse(itemcom.hoursdelaylabel.toString())*-1).toString()+ ' ساعة '
                                //       :
                                //   ' باقي '+ itemcom.hoursdelaylabel.toString()+' ساعة '
                                //   ,
                                //   style: TextStyle(
                                //       fontSize: 12,
                                //       //fontWeight: FontWeight.bold,
                                //       fontFamily: kfontfamily2,
                                //       color: kMainColor),
                                // )
                                : Container()
                          ],
                        )
                      : Container(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: Text(
                        itemcom.nameEnterprise.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
                      ),
                    ),
                    itemcom.dateNext != null
                        ? Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.parse(itemcom.dateNext.toString())),
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: kfontfamily2,
                                color: kMainColor),
                          )
                        : Container(),
                  ]),
                  itemcom.typeCommuncation == 'تركيب' && itemcom.dateCommunication != null
                      ? Row(
                          children: [
                            RatingBar.builder(
                              initialRating: itemcom.rate == null ? 0.0 : double.parse(itemcom.rate.toString()),
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
                      : Container()
                  //Row(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
