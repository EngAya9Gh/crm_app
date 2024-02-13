import 'package:flutter/cupertino.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../model/clientmodel.dart';
import '../transfer_client.dart';

class TransferClientButton extends StatelessWidget {
  const TransferClientButton({
    Key? key,
    required this.clientModel,
  }) : super(key: key);

  final ClientModel clientModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPress: () async => await _onPress(context),
      text: "تحويل العميل",
    );
  }

  Future<void> _onPress(BuildContext context) async {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          return transferClient(
            name_enterprise: clientModel.nameEnterprise.toString(),
            idclient: clientModel.idClients.toString(),
            type: "client",
          );
        },
        fullscreenDialog: true,
      ),
    );
  }
}
