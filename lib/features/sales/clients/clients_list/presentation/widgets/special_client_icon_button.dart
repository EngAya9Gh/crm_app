import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../view_model/client_vm.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
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
        if (!context.read<PrivilegesCubit>().checkPrivilege('133')) {
          return SizedBox.shrink();
        }

        return IconButton(
          onPressed: () async {
            if (context.read<PrivilegesCubit>().checkPrivilege('147')) {
              final ClientModel? client = await clientProvider.setTagClient();
              bloc.currentClient = client;
              // onChanged?.call(client);
            }
          },
          icon: AppIcon(
            (bloc.currentClient?.tag ?? false)
                ? CupertinoIcons.checkmark_seal_fill
                : CupertinoIcons.checkmark_seal,
            color: (bloc.currentClient?.tag ?? false)
                ? AppColors.secondaryColor
                : null,
          ),
          tooltip: (bloc.currentClient?.tag ?? false) ? "مميز" : "غير مميز",
        );
      },
    );
  }
}
