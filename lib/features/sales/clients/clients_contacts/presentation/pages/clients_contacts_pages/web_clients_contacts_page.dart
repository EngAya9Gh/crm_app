import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../../core/services/di/di_container.dart';
import '../../manager/clients_contacts_bloc.dart';
import '../../widgets/client_contacts_list_item.dart';

class WebClientsContactsPage extends StatefulWidget {
  const WebClientsContactsPage({Key? key}) : super(key: key);

  @override
  State<WebClientsContactsPage> createState() => _WebClientsContactsPageState();
}

class _WebClientsContactsPageState extends State<WebClientsContactsPage> {
  late final ClientsContactsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<ClientsContactsBloc>();
    _bloc.add(const GetAllClientsContactsEvent(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Contacts'),
      ),
      body: BlocBuilder<ClientsContactsBloc, ClientsContactsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state.getAllClientsContactsStatus.isLoading() && state.currentPage == 1) {
            return const AppLoader();
          } else if (state.getAllClientsContactsStatus.isFailed()) {
            return AppErrorWidget(
              message: state.getAllClientsContactsStatus.error ?? '',
              onPressed: () => _bloc.add(const GetAllClientsContactsEvent(page: 1)),
            );
          } else if (state.getAllClientsContactsStatus.isEmpty()) {
            return const Center(child: Text('No contacts found'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.clientContacts.length,
                  itemBuilder: (context, index) {
                    return ClientContactListItem(contact: state.clientContacts[index]);
                  },
                ),
              ),
              _buildPagination(state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPagination(ClientsContactsState state) {
    final totalPages = (state.totalCount / 20).ceil(); // Assuming 20 items per page
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: state.currentPage > 1
              ? () => _bloc.add(GetAllClientsContactsEvent(page: state.currentPage - 1))
              : null,
        ),
        Text('${state.currentPage} / $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: state.currentPage < totalPages
              ? () => _bloc.add(GetAllClientsContactsEvent(page: state.currentPage + 1))
              : null,
        ),
      ],
    );
  }
}