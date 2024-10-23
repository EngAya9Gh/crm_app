import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/services/di/di_container.dart';
import '../../manager/clients_contacts_bloc.dart';
import '../../widgets/client_contacts_list_item.dart';
class MobClientsContactsPage extends StatefulWidget {
  const MobClientsContactsPage({Key? key}) : super(key: key);

  @override
  State<MobClientsContactsPage> createState() => _MobClientsContactsPageState();
}

class _MobClientsContactsPageState extends State<MobClientsContactsPage> {
  final _scrollController = ScrollController();
  late final ClientsContactsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<ClientsContactsBloc>();
    _bloc.add(const GetAllClientsContactsEvent(page: 1));
    _scrollController.addListener(_onScroll);
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

          return ListView.builder(
            controller: _scrollController,
            itemCount: state.clientContacts.length + (state.getAllClientsContactsStatus.isLoading() ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == state.clientContacts.length) {
                return const AppLoader();
              }
              return ClientContactListItem(contact: state.clientContacts[index]);
            },
          );
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(GetAllClientsContactsEvent(page: _bloc.state.currentPage + 1));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}