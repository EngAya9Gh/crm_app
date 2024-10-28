import 'package:crm_smart/core/common/enums/client/subscribing_intention_level_enum.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/sales/clients/add_client_contact/presentation/manager/add_client_contact_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../clients_list/presentation/widgets/client_card.dart';
import '../../../clients_list/presentation/widgets/clients_paginated_list.dart';
import '../../../clients_list/presentation/widgets/filter_clients_sheet.dart';
class ClientsSearchDialog extends StatefulWidget {
  const ClientsSearchDialog({Key? key}) : super(key: key);

  @override
  State<ClientsSearchDialog> createState() => _ClientsSearchDialogState();
}

class _ClientsSearchDialogState extends State<ClientsSearchDialog> {
  late final ClientsListBloc _clientsListBloc;

  @override
  void initState() {
    super.initState();
    _clientsListBloc = context.read<ClientsListBloc>();
    _clientsListBloc.pageVariables.searchController.clear();

    // Reset and load initial data
    _clientsListBloc.add(const GetAllClientsListEvent(
      isNewFilter: true,
      isInfiniteScroll: false,
      pageWeb: 1,
    ));

  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Text(
                'اختر العميل',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              5.verticalSpace,
              CustomSearchWidget(
                searchController:
                _clientsListBloc.pageVariables.searchController,
                onChanged: (value) {
                  _fetchClients(isDebounced: true);
                },
              ),
              15.verticalSpace,
              Expanded(
                child: BlocBuilder<ClientsListBloc, ClientsListState>(
                  builder: (context, state) {
                    if (state.getAllClientsStatus.isLoading() &&
                        _clientsListBloc.pageVariables.allList.isEmpty) {
                      return const Center(child: AppLoader());
                    }

                    if (state.getAllClientsStatus.isEmpty()) {
                      return const Center(child: Text('لا يوجد عملاء'));
                    }

                    return Expanded(
                      child: BlocBuilder<ClientsListBloc, ClientsListState>(
                        buildWhen: (previous, current) {
                          return previous.getAllClientsStatus !=
                              current.getAllClientsStatus &&
                              _clientsListBloc.pageVariables.isNewFilter;
                        },
                        builder: (context, state) {
                          return state.getAllClientsStatus.when(
                            loading: () => AppLoader(),
                            success: (data) {
                              return BlocBuilder<ClientsListBloc, ClientsListState>(
                                buildWhen: (previous, current) {
                                  return previous.getAllClientsStatus != current.getAllClientsStatus;
                                },
                                builder: (context, state) {
                                  return AppPaginatedList(
                                    items: _clientsListBloc.pageVariables.allList,
                                    itemBuilder: (context, index) {
                                      final client = _clientsListBloc.pageVariables.allList[index];
                                      return AppCardContainer(
                                        onTap: () {
                                          AppNavigator.pop(result:client);
                                        },
                                        child: AppText(
                                          client.nameEnterprise,
                                        ),
                                      );
                                    },
                                    hasReachedEnd: _clientsListBloc.pageVariables.hasReachedEnd,
                                    onLoadMore: () {
                                      _clientsListBloc.add(GetAllClientsListEvent(
                                        isNewFilter: false,
                                        isInfiniteScroll: true,
                                      ));
                                    },
                                    isLoading: _clientsListBloc.state.getAllClientsStatus.isLoading(),
                                  );
                                },
                              );
                            },
                            empty: () => AppErrorWidget(message: 'لا يوجد عملاء'),
                            failure: (error, data) => AppErrorWidget(
                              message: error.toString(),
                              onPressed: () =>  _fetchClients(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _fetchClients({bool isDebounced = false}) {
    AppConstants.debounceFunction(
          () => _clientsListBloc.add(GetAllClientsListEvent()),
      tag: "search_all_clients_list",
      isDebounced: isDebounced,
    );
  }


}