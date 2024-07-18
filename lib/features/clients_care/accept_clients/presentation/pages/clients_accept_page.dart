import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_accept_cubit.dart';
import '../widgets/card_client_accept.dart';

class ClientsAcceptPage extends StatefulWidget {
  ClientsAcceptPage({Key? key}) : super(key: key);

  @override
  _ClientAcceptState createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<ClientsAcceptPage> {
  late final ClientsAcceptCubit clientsAcceptCubit;

  @override
  void initState() {
    clientsAcceptCubit = context.read<ClientsAcceptCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await clientsAcceptCubit.getClientsAccept();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'العملاء المشتركين'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: TextEditingController(),
                  ),
                ),
                CustomFilterIcon(
                  onTap: () {
                    AppBottomSheet.show(
                      context: context,
                      child: SizedBox(),
                    );
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<ClientsAcceptCubit, ClientsAcceptState>(
                  builder: (context, state) {
                    return CustomPaginatedList(
                      items: clientsAcceptCubit.clientsAccept,
                      onLoadMore: () => clientsAcceptCubit.getClientsAccept(),
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: CardClientAccept(
                              client: clientsAcceptCubit.clientsAccept[index],
                            ),
                          ),
                        );
                      },
                      isLoading: state.getClientsAcceptStatus.isLoading(),
                      hasReachedMax: state.getClientsAcceptStatus.data ?? false,
                      scrollController: ScrollController(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
