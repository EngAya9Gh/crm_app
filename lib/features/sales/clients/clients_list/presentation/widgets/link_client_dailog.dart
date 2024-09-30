import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/utils/app_dimensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../manager/clients_list_bloc.dart';

class LinkClientDialog extends StatefulWidget {
  final String clientId;

  const LinkClientDialog({
    super.key,
    required this.clientId,
  });

  @override
  State<LinkClientDialog> createState() => _LinkClientDialogState();
}

class _LinkClientDialogState extends State<LinkClientDialog> {
  late final ClientsListBloc _clientsListBloc;
  List<String> _selectedClientIds = [];

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();
    _selectedClientIds = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: AppText(
          'عملاء المرتبطين / المتشابهين',
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        width: AppDimensions.currentWidth() * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<ClientsListBloc, ClientsListState>(
              builder: (context, state) {
                return state.getLinkClientsStatus.when(
                  loading: () => AppLoader(isExpanded: true),
                  failure: (error, data) => AppText('حدث خطأ ما'),
                  empty: () => Expanded(
                      child: Center(child: AppText('لا يوجد عملاء مرتبطين'))),
                  success: (data) {
                    final _linkedClients =
                        _clientsListBloc.linkedClientsVariables.allList;
                    final _checkedClients = _clientsListBloc
                        .linkedClientsVariables.checkedClientsList;
                    return Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: AppPaginatedList(
                          items: _linkedClients,
                          itemBuilder: (context, index) {
                            final client = _linkedClients[index];
                            return AppCardContainer(
                              child: CheckboxListTile(
                                title: AppText(client.nameEnterprise ?? ''),
                                value: _checkedClients[index],
                                onChanged: (bool? value) {
                                  if (value == null) return;
                                  _checkedClients[index] = value;
                                  if (value) {
                                    _selectedClientIds
                                        .add(client.idClients.toString());
                                  } else {
                                    _selectedClientIds
                                        .remove(client.idClients.toString());
                                  }
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 16),
            AppElevatedButton(
              text: 'حفظ ارتباط العميل',
              onPressed: () {
                context.read<ClientsListBloc>().add(LinkSelectedClients(
                      widget.clientId,
                      _selectedClientIds,
                    ));
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: AppText('رجوع'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
    );
  }
}
