import 'package:crm_smart/core/common/enums/client/subscribing_intention_level_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../../view_model/activity_vm.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../pages/client_marketing_report_page.dart';
import '../pages/client_add_edit_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/clients_list_bloc.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../widgets/client_card.dart';
import '../widgets/client_card_pluse.dart';
import '../widgets/filter_clients_sheet.dart';

class ClientListPage2 extends StatefulWidget {
  @override
  State<ClientListPage2> createState() => _ClientListPage2State();
}

class _ClientListPage2State extends State<ClientListPage2> {
  final TextEditingController _searchController = TextEditingController();
  late final ClientsListBloc _clientsListBloc;
  late final PrivilegesCubit _privilegeCubit;
  late final String fkCountry;
  late final UserModel userModel;
  bool value1 = false;

  @override
  void initState() {
    super.initState();
    _clientsListBloc = context.read<ClientsListBloc>()..init();
    _privilegeCubit = context.read<PrivilegesCubit>();
    userModel = AppConstants.currentUser;
    fkCountry = AppConstants.currentCountry;
    _clientsListBloc.state.myclient_parm = false;

    _clientsListBloc.add(
      GetAllClientsListEvent(
        params: GetClientsWithFilterParams(
          fkCountry: fkCountry,
        ),
      ));
    // _clientsListBloc
    //     .add(
    //     FetchPaginatedClientsEvent(
    //       page: 1,
    //       fkCountry: fkCountry));
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
    });
  }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'قائمة العملاء',
        actions: [

        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4, right: 5, left: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
          if (_privilegeCubit.checkPrivilege('47')) ...[ AppElevatedButton(
                    text: "إضافة عميل",
                    onPressed: () =>
                        AppNavigator.go(ClientAddEditPage(), isNew: false),


                  ),  ],
                  SizedBox(width: 16),
            if (_privilegeCubit.checkPrivilege('186')) ...[

                  SizedBox(


                    child: AppElevatedButton(
                      text: "تقرير التسويق",
                      onPressed: () {
                        AppNavigator.go(ClientMarketingReportPage(), isNew: false);
                      },
                      appButtonStyle: AppButtonStyle.secondary,
                      textStyle: AppStyles.textStyle.copyWith(
                        fontSize: (16.0).scaleFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],   ],
              ),
              15.verticalSpace,
              Row(
                children: [
                  Checkbox(value:  _clientsListBloc.filterEntity.isSwitchOnNotifier.value,
                      onChanged: (value) {
                    value1 = value!;
                      _clientsListBloc.filterEntity.isSwitchOnNotifier.value =
                          value;
                      setState(() {});
                      _clientsListBloc.filterEntity.statusNotifier.value =
                      value ? ['مشترك'] : [];
                      _fetchClients();
                      }),
                  AppText('أنشطة العملاء المشتركين'),

                  SizedBox(width: 8),
                  35.horizontal,
                  Expanded(
                    child: CustomSearchWidget(
                      searchController:
                      _clientsListBloc.pageVariables.searchController,
                      onChanged: (value) {
                        _fetchClients(isDebounced: true);
                      },
                    ),
                  ),
                  CustomFilterIcon(
                    onTap: () async {
                      await AppBottomSheet.show(
                        context: context,
                        child: FilterClientsSheet(val: value1),
                      );
                    },
                  ),
                  SizedBox(width: 8),
                  AppElevatedButton(
                    text: "تصدير إلى Excel",
                    onPressed: _exportToExcel,
                  ),
                ],
              ),


              5.verticalSpace,
              Expanded(
                child: BlocBuilder<ClientsListBloc, ClientsListState>(
                  buildWhen: (previous, current) {
                    return previous.getAllClientsStatus != current.getAllClientsStatus;
                  },
                  builder: (context, state) {
                    return state.getAllClientsStatus.when(
                      loading: () => AppLoader(),
                      success: (paginatedData) {
                        final clients = _clientsListBloc.pageVariables.allList;//paginatedData.data;
                       print('clients.length');
                       print('clients.length');
                       print(clients.length);
                        return Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Table(
                                  border: TableBorder.all(color: Colors.grey.shade300),
                                  columnWidths: {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(2),
                                    2: FlexColumnWidth(3),
                                    3: FlexColumnWidth(2),
                                    4: FlexColumnWidth(1),
                                    5: FlexColumnWidth(1),
                                    6: FlexColumnWidth(1),
                                  },
                                  children: [
                                    TableRow(
                                      decoration: BoxDecoration(color: AppColors.primaryMain),
                                      children: [
                                        TableHeader(text: 'الرقم المرجعي'),
                                        TableHeader(text: 'العميل'),
                                        TableHeader(text: 'المؤسسة'),
                                        TableHeader(text: 'تاريخ الإضافة'),
                                        TableHeader(text: 'نوع العميل'),
                                        TableHeader(text: 'الأولوية'),
                                        TableHeader(text: 'الأمر'),
                                      ],
                                    ),
                                    for (var client in clients)
                                      TableRow(
                                        decoration: BoxDecoration(
                                          color: clients.indexOf(client).isEven ? Colors.grey.shade100 : Colors.white,
                                        ),
                                        children: [
                                          TableCell(child: Center(child: AppText(client.serialNumber ?? ''))),
                                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: AppText(client.nameClient ?? ''))),
                                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: AppText(client.nameEnterprise ?? ''))),
                                          TableCell(child: Center(child: AppText(client.dateCreate ?? ''))),
                                          TableCell(child: Center(child: AppText(client.typeClient ?? ''))),


                           TableCell(child:
                           Center( child:
                                      AppIcon(
                                              Icons.flag,
                                              color: client.subscribingIntentionLevel?.color,
                                            )



                                          )),

                                          TableCell(
                                              child:
                                          Center(child: IconButton(
                                            icon: Icon(Icons.remove_red_eye, color: Colors.blue),
                                            onPressed: () {
                                              value1 == false?
                                              AppNavigator.go(
                                                ClientProfile(idClient: client.idClients ),
                                                isNew: false,
                                              ):Container();
                                                  // ? CardClient_pluse(clientModel: client)
                                                  // : CardClient(clientModel: client);
                                            },
                                          ))),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            PaginationControls(
                              clientsListBloc: context.read<ClientsListBloc>(),
                            ),
                          ],
                        );
                      },
                      empty: () => AppErrorWidget(message: 'لا يوجد عملاء'),
                      failure: (error, _) => AppErrorWidget(
                        message: error.toString(),
                        onPressed: () => context.read<ClientsListBloc>().add(GetAllClientsListEvent(fkCountry: fkCountry)),
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
          () {
        _clientsListBloc.add(GetAllClientsListEvent(
          params: GetClientsWithFilterParams(
            fkCountry: fkCountry,
          ),
        ));
      },
      tag: "search_all_clients_list",
      isDebounced: isDebounced,
    );
  }

  void _exportToExcel() {
    _clientsListBloc.add(
      GetAllClientsListEvent(
        params: GetClientsWithFilterParams(
          fkCountry: fkCountry,
          download: 1,
        ),
      ),
    );
  }
}
//
//
// class ClientListHeader extends StatelessWidget {
//     ClientsListBloc  clientsListBloc;
//   ClientListHeader({ required this.clientsListBloc });
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child:
//       Row(
//         children: [
//           Checkbox(value:  clientsListBloc.filterEntity.isSwitchOnNotifier.value,
//               onChanged: (value) {  value1 = value;
//              clientsListBloc.filterEntity.isSwitchOnNotifier.value =
//                   value;
//               setState(() {});
//
//               clientsListBloc.filterEntity.statusNotifier.value =
//               value ? ['مشترك'] : [];
//               _fetchClients();
//           }),
//           Text('أنشطة العملاء المشتركين'),
//         ],
//       ),
//     );
//   }
// }


class TableHeader extends StatelessWidget {
  final String text;

  const TableHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 1),
        child: AppText(
          text,
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PaginationControls extends StatelessWidget {
  final ClientsListBloc clientsListBloc;

  const PaginationControls({
    Key? key,
    required this.clientsListBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsListBloc, ClientsListState>(
      bloc: clientsListBloc,
      builder: (context, state) {
        final currentPage =1;// clientsListBloc.pageVariables.allList;
        final totalPages = clientsListBloc.pageVariables.totalCount;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppElevatedButton(
              text: 'السابق',
              onPressed: currentPage > 1 
                ? () => clientsListBloc.add(FetchPaginatedClientsEvent(page: currentPage - 1, fkCountry:'1'))
                : null,
            ),
            SizedBox(width: 16),
            AppText('الصفحة $currentPage من $totalPages'),
            SizedBox(width: 16),
            AppElevatedButton(
              text: 'التالي',
              onPressed: currentPage < totalPages 
                ? () => clientsListBloc.add(FetchPaginatedClientsEvent(page: currentPage + 1, fkCountry: '1'))
                : null,
            ),
          ],
        );
      },
    );


  }

}

