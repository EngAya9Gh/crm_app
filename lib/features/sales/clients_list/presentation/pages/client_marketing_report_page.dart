import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/clients_list_bloc.dart';
import 'filter_clients_merketing_reports_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientMarketingReportPage extends StatefulWidget {
  const ClientMarketingReportPage({super.key});

  @override
  State<ClientMarketingReportPage> createState() =>
      _ClientMarketingReportPageState();
}

class _ClientMarketingReportPageState extends State<ClientMarketingReportPage> {
  late final ClientsListBloc clientsListBloc;

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  @override
  void initState() {
    clientsListBloc = context.read<ClientsListBloc>();
    clientsListBloc.add(GetClientMarketingReportEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تقرير التسويق للعملاء'),
        titleTextStyle: context.textTheme.titleMedium,
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<ClientsListBloc, ClientsListState>(
          builder: (context, state) {
            if (state.clientMarketingReportStatus.isLoading()) {
              return CustomLoadingIndicator();
            } else if (state.clientMarketingReportStatus.isFailed()) {
              return CustomErrorWidget(
                message: state.clientMarketingReportStatus.error,
              );
            }
            // list to display List<clientMarketingReportModel>, display name and count
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchWidget(
                          hint: "اسم الموظف، عدد العملاء ...",
                          searchController: clientsListBloc.searchController,
                          onChanged: (value) {
                            clientsListBloc
                                .add(SearchClientMarketingReportEvent());
                          },
                        ),
                      ),
                      if (context
                          .read<PrivilegeCubit>()
                          .checkPrivilege("188")) ...[
                        CustomFilterIcon(
                          onTap: () {
                            AppBottomSheet.show(
                              context: context,
                              child: FilterClientsMarketingReportsSheet(),
                            );
                          },
                        ),
                        SizedBox(width: 5),
                      ],
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.clientMarketingReportStatus.data.length,
                      itemBuilder: (context, index) {
                        final clientMarketingReport =
                            state.clientMarketingReportStatus.data[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 10,
                            ),
                            child: AppText(
                                "عدد العملاء للموظف ${clientMarketingReport.nameUser} هو ${clientMarketingReport.count}"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
