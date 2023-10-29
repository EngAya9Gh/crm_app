import 'package:crm_smart/constants.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class CardClient extends StatelessWidget {
  CardClient({Key? key, required this.clientModel}) : super(key: key);
  final ClientModel clientModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ProfileClient(idClient: clientModel.idClients.toString()),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10).r,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 8.0,
              color: Colors.black87.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateTime.tryParse(clientModel.dateCreate!) != null
                    ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(DateTime.parse(clientModel.dateCreate!))
                    : clientModel.dateCreate.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
                textDirection: TextDirection.ltr,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Text(
                    clientModel.nameEnterprise.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
                  ),
                ),
                if (clientModel.tag ?? false)
                  Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: Colors.amber,
                  )
              ]),
              //Row(),
            ],
          ),
        ),
      ),
    );
  }
}
