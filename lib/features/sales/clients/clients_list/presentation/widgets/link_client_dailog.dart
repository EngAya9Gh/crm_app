import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/clients_list_bloc.dart';

import 'client_info_section.dart';

class LinkClientDialog extends StatelessWidget {
  final String clientId;
  ClientsListState state;

  LinkClientDialog({Key? key, required this.clientId   , required this.state } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listidselected=[];

    return AlertDialog(
      title: Text('Link Clients'),
      content: BlocConsumer<ClientsListBloc, ClientsListState>(
          listener: (context, state) {
            // if (state is ClientsLinked) {
            //   Navigator.of(context).pop(true);
            // } else if (state is LinkClientError) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(content: Text(state.message)),
            //   );
            // }
          },
          builder: (context, state) {
            // if (state is LinkClientLoading) {
            //   return Center(child: CircularProgressIndicator());
            // } else if (state is LinkClientLoaded) {
            return SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.linkedClients?.length,
                      itemBuilder: (context, index) {
                        final client = state.linkedClients?[index];
                        return Card(
                          child: CheckboxListTile(
                            title: Text(client!.nameEnterprise.toString()),
                            value: client!.isParent=='1'?true:false,
                            onChanged: (bool? value) {
                              if (value != null) {

                                if (value) {
                                  listidselected.add(  client.idClients.toString());
                                } else {
                                  listidselected.remove(client.idClients.toString());
                                }



                                //   context.read<LinkClientBloc>().add(UpdateClientSelection(client.id, value));
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    child: Text('Link Checked Clients'),
                    onPressed: () {
                      context.read<ClientsListBloc>().add(LinkSelectedClients(clientId,listidselected));
                    },
                  ),
                ],
              ),
            );
          }
        //   if (state is LinkClientError) {
        //   return Text('Error: ${state.message}');
        // }


      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
    );
  }
}