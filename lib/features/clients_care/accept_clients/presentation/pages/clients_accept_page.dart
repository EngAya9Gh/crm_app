import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_paginated_list.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/clients_accept_cubit.dart';
import '../widgets/card_client_accept.dart';
import '../widgets/filter_client_accept_sheet.dart';

class ClientsAcceptPage extends StatefulWidget {
  ClientsAcceptPage({Key? key}) : super(key: key);

  @override
  _ClientAcceptState createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<ClientsAcceptPage> {
  late final ClientsAcceptCubit clientsAcceptCubit;

  @override
  void initState() {
    clientsAcceptCubit = context.read<ClientsAcceptCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await clientsAcceptCubit.getClientsAccept(
        fkCountry: AppConstants.currentCountry(context) ?? '',
      );
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
                    searchController:
                        clientsAcceptCubit.pageVariables.searchController,
                    onChanged: (value) {
                      clientsAcceptCubit.getClientsAccept(
                        fkCountry: AppConstants.currentCountry(context) ?? '',
                        isDebounced: true,
                      );
                      AppConstants.debounceFunction(
                        () => clientsAcceptCubit.getClientsAccept(
                          fkCountry: AppConstants.currentCountry(context) ?? '',
                        ),
                        tag: 'search_clients_accept',
                      );
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterClientAcceptSheet(),
                    );
                    if (value != true) {
                      clientsAcceptCubit.returnToPreviousState();
                    }
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
                      items: clientsAcceptCubit.pageVariables.clientsAccept,
                      onLoadMore: () => clientsAcceptCubit.getClientsAccept(
                        fkCountry: AppConstants.currentCountry(context) ?? '',
                        isNewSearch: false,
                      ),
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: CardClientAccept(
                              client: clientsAcceptCubit
                                  .pageVariables.clientsAccept[index],
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
