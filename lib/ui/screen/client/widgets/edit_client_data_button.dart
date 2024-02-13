import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../features/clients_list/data/models/clients_list_response.dart';
import '../../../../features/clients_list/presentation/pages/action_client_page.dart';
import '../../../../model/clientmodel.dart';
import '../../../../view_model/client_vm.dart';

class EditClientDataButton extends StatelessWidget {
  const EditClientDataButton({
    Key? key,
    required this.clientModel,
  }) : super(key: key);

  final ClientModel clientModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPress: () async => await _onPress(context),
      text: 'تعديل بيانات العميل',
    );
  }

  Future<void> _onPress(BuildContext context) async {
    final ClientsListResponse clientsListResponse =
        ClientsListResponse.fromJson(
      clientModel.toJson(),
    );
    final ClientsListResponse editedClient = await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ActionClientPage(
            client: clientsListResponse,
          ),
        ));
    final ClientModel editedClientModel =
        ClientModel.fromJson(editedClient.toJson());
    context.read<ClientProvider>().updateClient(editedClientModel);
  }
}
