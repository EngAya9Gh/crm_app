import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/client_model.dart';
import '../../../../../view_model/client_vm.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/clients_list_bloc.dart';

class SpecialClientIconButton extends StatelessWidget {
  const SpecialClientIconButton({
    super.key,
    this.onChanged,
  });

  final void Function(ClientModel? client)? onChanged;

  @override
  Widget build(BuildContext context) {
    final clientProvider = context.watch<ClientProvider>();
    final bloc = context.read<ClientsListBloc>();

    return BlocBuilder<ClientsListBloc, ClientsListState>(
      builder: (context, state) {
        if (!context.read<PrivilegeCubit>().checkPrivilege('133')) {
          return SizedBox.shrink();
        }

        return IconButton(
          onPressed: () async {
            if (context.read<PrivilegeCubit>().checkPrivilege('147')) {
              final ClientModel? client = await clientProvider.setTagClient();
              bloc.currentClient = client;
              // onChanged?.call(client);
            }
          },
          icon: Icon(
            (bloc.currentClient?.tag ?? false)
                ? CupertinoIcons.checkmark_seal_fill
                : CupertinoIcons.checkmark_seal,
            color: (bloc.currentClient?.tag ?? false) ? Colors.amber : null,
          ),
          tooltip: (bloc.currentClient?.tag ?? false) ? "مميز" : "غير مميز",
        );
      },
    );
  }
}
