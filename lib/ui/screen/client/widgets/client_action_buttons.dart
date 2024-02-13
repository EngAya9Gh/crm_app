import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../model/clientmodel.dart';
import 'edit_client_data_button.dart';
import 'transfer_client_button.dart';

class ClientActionButtons extends StatelessWidget {
  const ClientActionButtons({
    Key? key,
    required this.clientModel,
    this.clientTransfer,
  }) : super(key: key);

  final ClientModel clientModel;
  final String? clientTransfer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: EditClientDataButton(clientModel: clientModel)),
        SizedBox(width: 5),
        if (clientTransfer == null)
          Expanded(child: TransferClientButton(clientModel: clientModel)),
        SizedBox(height: 3),
      ],
    );
  }
}
