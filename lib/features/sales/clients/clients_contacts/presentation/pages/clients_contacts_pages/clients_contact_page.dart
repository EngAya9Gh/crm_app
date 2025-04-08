import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/config/navigator/app_routes_names.dart';
import '../../manager/clients_contacts_bloc.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/sales/clients/add_client_contact/presentation/pages/add_client_contact_page.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../widgets/client_contacts_list_item.dart';
import '../../widgets/filter_clients_contacts_sheet.dart';

class ClientsContactsPage extends StatefulWidget {
  const ClientsContactsPage({Key? key}) : super(key: key);

  @override
  State<ClientsContactsPage> createState() => _ClientsContactsPageState();
  }

  class _ClientsContactsPageState extends State<ClientsContactsPage> {


  late final ClientsContactsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ClientsContactsBloc>();
    _bloc.add(const GetAllClientsContactsEvent(page: 1));
    _bloc.pageVariables.searchController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
          title: 'قائمة جهات الاتصال',
          actions: [
            AppTextButton(child: 
            Icon(Icons.add_box_outlined,
            color: AppColors.white,),
            onPressed: () async{
              ClientContactModel? result =
              await AppNavigator.go(
                  AddClientContactPage(),
                name: AppRoutesNames.salesInternalRoutes.addContact,
                isNew: false,
              );
              if(result!=null){
                _bloc.add(const GetAllClientsContactsEvent(page: 1));
              }
            },)
          ]
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController:
                    _bloc.pageVariables.searchController,
                    onChanged: (value) {
                      AppConstants.debounceFunction(
                            () => _bloc.add( GetAllClientsContactsEvent(page: 1,filter: value)),
                        tag: "search_clients_contacts_list",
                        isDebounced: true,
                      );
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    await AppBottomSheet.show(
                      context: context,
                      child: FilterClientsContactsSheet(),
                    );
                  },
                ),
                SizedBox(width: 8),
              ],
            ),
            5.verticalSpace,
            Expanded(
              child: BlocBuilder<ClientsContactsBloc, ClientsContactsState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state.getAllClientsContactsStatus.isFailed()) {
                    return AppErrorWidget(
                      message: state.getAllClientsContactsStatus.error ?? '',
                      onPressed: () => _bloc.add(const GetAllClientsContactsEvent(page: 1)),
                    );
                  } else if (state.getAllClientsContactsStatus.isEmpty()) {
                    return const Center(child: Text('No contacts found'));
                  }else if( state.getAllClientsContactsStatus.isLoading() && state.currentPage==1){
                    return const Center(child: AppLoader(),);
                  }
                  return AppPaginatedList(
                    items: _bloc.pageVariables.allList,
                    itemBuilder: (context, index) {
                      return ClientContactListItem(contact: state.clientContacts[index]);
                    },
                    hasReachedEnd: _bloc.pageVariables.hasReachedEnd,
                    onLoadMore: () {
                      _bloc.add(GetAllClientsContactsEvent(page: _bloc.state.currentPage + 1));
                    },
                    isLoading: _bloc.state.getAllClientsContactsStatus.isLoading(),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}