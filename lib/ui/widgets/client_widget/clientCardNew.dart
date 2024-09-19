import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../screen/client/client_profile.dart';

class cardClientnew extends StatelessWidget {
  cardClientnew({Key? key, required this.iduser, required this.itemClient})
      : super(key: key);
  ClientModel itemClient;
  String iduser;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
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
          //splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        ClientProfile(idClient: itemClient.idClients.toString())
                    //   editclient(
                    // itemClient: itemClient,
                    // fkclient: itemClient.idClients.toString(),
                    // fkuser: itemClient.fkUser.toString(),)
                    ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            //height: 125,//MediaQuery.of(context).size.height*0.15,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemClient.typeClient.toString(),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.fontFamily2,
                            color: AppColors.primaryMain),
                      ),
                      itemClient.dateCreate == null
                          ? Text('')
                          : Text(
                              itemClient.dateCreate.toString(),
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryMain),
                            ),
                    ],
                  ),
                  //SizedBox(height:2,),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      itemClient.nameEnterprise.toString().length > 45
                          ? Text('''
${itemClient.nameEnterprise.toString().substring(0, 45)}
${itemClient.nameEnterprise.toString().substring(45, itemClient.nameEnterprise.toString().length)}
                          ''',
                              style: TextStyle(
                                  fontFamily: AppFonts.fontFamily2,
                                  fontWeight: FontWeight.bold))
                          : Text(itemClient.nameEnterprise.toString(),
                              style: TextStyle(
                                  fontFamily: AppFonts.fontFamily2,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemClient.nameRegion.toString(),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMain,
                            fontFamily: AppFonts.fontFamily2),
                      ),
                      itemClient.total_paid != null
                          ? Text(
                              ' المتبقي ' + itemClient.total_paid.toString(),
                              style: TextStyle(
                                  color: AppColors.primaryMain,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.fontFamily2),
                            )
                          : Text(
                              '',
                              style: TextStyle(
                                  color: AppColors.primaryMain,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppFonts.fontFamily2),
                            ),
                      Text(
                        HelperFunctions.getNameShort(
                            itemClient.nameUser.toString()),
                        style: TextStyle(
                            fontSize: 11,
                            color: AppColors.primaryMain,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.fontFamily2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //});
  }
}
