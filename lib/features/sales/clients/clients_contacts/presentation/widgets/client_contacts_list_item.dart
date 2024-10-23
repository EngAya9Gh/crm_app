import 'package:flutter/material.dart';

import '../../data/models/client_contact_model.dart';

class ClientContactListItem extends StatelessWidget {
  final ClientContactModel contact;

  const ClientContactListItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.name),
      subtitle: Text(contact.contactType),
      trailing: Text(contact.contactValue),
      onTap: () {
        // Handle tap on contact
      },
    );
  }
}