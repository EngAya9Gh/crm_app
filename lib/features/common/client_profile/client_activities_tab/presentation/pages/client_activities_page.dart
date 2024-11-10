import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../manager/client_activities_bloc.dart';
import '../widgets/client_activities_paginated_list.dart';

class ClientActivitiesPage extends StatefulWidget {
  const ClientActivitiesPage({Key? key, required this.client}) : super(key: key);
  final ClientModel client;
  @override
  State<ClientActivitiesPage> createState() => _ClientActivitiesPageState();
  }

  class _ClientActivitiesPageState extends State<ClientActivitiesPage> {


  late final ClientActivitiesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ClientActivitiesBloc>();
    _bloc.pageVariables.clear();
    _bloc.pageVariables.clientId = widget.client.idClients!;
    _bloc.add( GetAllClientActivitiesEvent(page: 1, clientId:widget.client.idClients! ));
  }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // 15.verticalSpace,
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomSearchWidget(
            //         searchController:
            //         _bloc.pageVariables.searchController,
            //         onChanged: (value) {
            //           AppConstants.debounceFunction(
            //                 () => _bloc.add( GetAllClientActivitiesEvent(page: 1,filter: value)),
            //             tag: "search_clients_contacts_list",
            //             isDebounced: true,
            //           );
            //         },
            //       ),
            //     ),
            //     CustomFilterIcon(
            //       onTap: () async {
            //         await AppBottomSheet.show(
            //           context: context,
            //           child: FilterClientActivitiesSheet(),
            //         );
            //       },
            //     ),
            //     SizedBox(width: 8),
            //   ],
            // ),
            5.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('عدد الانشطة: '),
                  BlocBuilder<ClientActivitiesBloc, ClientActivitiesState>(
                    builder: (context, state) {
                      final count = _bloc.pageVariables.allList.length;
                      final total = _bloc.pageVariables.totalCount;
                      return AppText('$count/$total');
                    },
                  ),
                ],
              )
            ),
            5.verticalSpace,
            Expanded(
              child: ClientActivitiesPaginatedList(),
            ),
          ],
        ),
      ),
    );
  }
}