import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../manager/clients_list_bloc.dart';

import 'client_info_section.dart';

class LinkClientDialog extends StatefulWidget {
  final String clientId;
  final ClientsListState state;

  LinkClientDialog({Key? key, required this.clientId, required this.state}) : super(key: key);

  @override
  _LinkClientDialogState createState() => _LinkClientDialogState();
}

class _LinkClientDialogState extends State<LinkClientDialog> {
  late List<bool> _isCheckedList;
  late List<String> _selectedClientIds;

  @override
  void initState() {
    super.initState();
    _initializeCheckedList();
    _selectedClientIds = [];

    print('widget.state.linkedClients?.length');
    print(widget.state.linkedClients?.length);
  }

  void _initializeCheckedList() {
    if (widget.state.linkedClients != null && widget.state.linkedClients!.isNotEmpty) {
      _isCheckedList = List.generate(
        widget.state.linkedClients!.length,
        (index) => widget.state.linkedClients![index].isParent !=null
      );
    } else {
      _isCheckedList = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: AppText('عملاء المرتبطين / المتشابهين')),
      content: SizedBox(
        width: double.maxFinite / 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: widget.state.linkedClients == null || widget.state.linkedClients!.isEmpty
                  ? Center(child: AppText('لا يوجد عملاء مرتبطين'))
                  : ListView.builder(
                shrinkWrap: true,
                itemCount: widget.state.linkedClients!.length??0,
                itemBuilder: (context, index) {
                  final client = widget.state.linkedClients![index];
                  if(widget.state.linkedClients!.length==0)
                  return Center(child: CircularProgressIndicator());
                  else
                  return Card(
                    child: CheckboxListTile(
                      title: AppText(client.nameEnterprise ?? ''),
                      value: _isCheckedList[index],
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            _isCheckedList[index] = value;
                            if (value) {
                              _selectedClientIds.add(client.idClients.toString());
                            } else {
                              _selectedClientIds.remove(client.idClients.toString());
                            }
                          });
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            AppElevatedButton(
              textColor: AppColors.white,
              child: AppText('حفظ ارتباط العميل'),
              onPressed: () {
                context.read<ClientsListBloc>().add(
                  LinkSelectedClients(widget.clientId, _selectedClientIds)
                );
                // Navigator.of(context).pop(); // Close the dialog after adding the event
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