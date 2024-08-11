import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../core/common/helpers/isStarClientCommunication.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../model/communication_modle.dart';
import '../client/profileclient.dart';

class CardCommAllType extends StatelessWidget {
  CardCommAllType({
    super.key,
    required this.itemcom,
    required this.tabCareIndex,
  });

  CommunicationModel itemcom;
  final int tabCareIndex;

  @override
  Widget build(BuildContext context) {
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
            AppNavigator.push(ProfileClient(
              idClient: itemcom.fkClient,
              tabIndex: 4,
              tabCareIndex: tabCareIndex,
              idCommunication: itemcom.idCommunication,
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: _showStar()
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      if (_showStar())
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.workspace_premium,
                              color: Colors.amber,
                            ),
                            AppText("عميل غير مرتبط بوكيل "),
                          ],
                        ),
                      itemcom.type_install == '2'
                          ? Text(
                              itemcom.dateCommunication == null
                                  ? itemcom.date_last_com_install.toString()
                                  : itemcom.dateCommunication.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: kfontfamily2,
                                  color: kMainColor),
                            )
                          : Text(
                              itemcom.typeCommuncation == 'ترحيب'
                                  ? itemcom.date_approve.toString()
                                  : itemcom.type_install == '1' &&
                                          itemcom.dateCommunication == null
                                      ? itemcom.dateinstall_done.toString()
                                      : itemcom.dateCommunication.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: kfontfamily2,
                                  color: kMainColor),
                            ),
                    ],
                  ),
                  // itemcom.type_install=='2' &&
                  if (itemcom.dateCommunication == null)
                    Row(
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
                        if (itemcom.hoursdelaylabel != null)
                          Text(
                            int.parse(itemcom.hoursdelaylabel.toString()) < 0
                                ? ' تأخر عن التواصل  ' +
                                    (int.parse(itemcom.hoursdelaylabel
                                                .toString()) *
                                            -1)
                                        .toString() +
                                    ' يوم '
                                : ' باقي ' +
                                    itemcom.hoursdelaylabel.toString() +
                                    ' يوم ',
                            style: TextStyle(
                                fontSize: 12,
                                //fontWeight: FontWeight.bold,
                                fontFamily: kfontfamily2,
                                color: kMainColor),
                          ),
                      ],
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            itemcom.nameEnterprise.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: kfontfamily2),
                          ),
                        ),
                        if (itemcom.dateNext != null)
                          Text(
                            DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(itemcom.dateNext.toString())),
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: kfontfamily2,
                                color: kMainColor),
                          )
                        else
                          Container(),
                      ]),
                  itemcom.typeCommuncation == 'تركيب' &&
                          itemcom.dateCommunication != null
                      ? Row(
                          children: [
                            RatingBar.builder(
                              initialRating: itemcom.rate == null
                                  ? 0.0
                                  : double.parse(itemcom.rate.toString()),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              ignoreGestures: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                          ],
                        )
                      : Container(),
                  if ((itemcom.tag ?? false) &&
                      context.read<PrivilegeCubit>().checkPrivilege('133'))
                    Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      color: Colors.amber,
                    )
                  //Row(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _showStar() {
    return isStarClientCommunication(
      typeSeller: itemcom.typeSeller,
      fkRegion: itemcom.fk_regoin,
    );
  }
}
