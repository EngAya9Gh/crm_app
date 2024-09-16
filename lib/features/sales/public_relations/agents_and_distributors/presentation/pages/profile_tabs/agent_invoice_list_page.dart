import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../../../participates/domain/use_cases/get_invoice_by_id_usecase.dart';
import '../../../../participates/presentation/widgets/participate_invoice_card.dart';
import '../../../domain/use_cases/get_agent_invoice_list_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';

class AgentInvoiceListPage extends StatefulWidget {
  final String participateId;

  AgentInvoiceListPage({Key? key, required this.participateId})
      : super(key: key);

  @override
  State<AgentInvoiceListPage> createState() => _AgentInvoiceListPageState();
}

class _AgentInvoiceListPageState extends State<AgentInvoiceListPage> {
  // late ParticipateListBloc _participateListBloc;
  late TextEditingController _searchTextField;

  //
  @override
  void initState() {
    _searchTextField = TextEditingController();
    super.initState();
  }

  void onSearch() {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.add(SearchInvoiceEvent(_searchTextField.text));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    return BlocBuilder<AgentsDistributorsProfileBloc,
        AgentsDistributorsProfileState>(
      buildWhen: (previous, current) =>
          previous.invoicesStatus != current.invoicesStatus ||
          previous.invoicesList != current.invoicesList ||
          previous.dialogProgressState != current.dialogProgressState ||
          previous.invoicesError != current.invoicesError,
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.dialogProgressState == StateStatus.loading,
          dismissible: false, // Prevent user from dismissing while loading
          progressIndicator: CircularProgressIndicator(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Builder(builder: (context) {
              if (state.invoicesStatus == StateStatus.loading ||
                  state.invoicesStatus == StateStatus.initial) {
                return AppLoader();
              } else if (state.invoicesStatus == StateStatus.failure) {
                return Center(child: Text(state.invoicesError ?? ''));
              } else if (state.invoicesStatus == StateStatus.success) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CustomSearchWidget(
                        searchController: _searchTextField,
                        onChanged: (value) => onSearch(),
                      ),
                      10.verticalSpace,
                      Padding(
                        padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText("عدد الفواتير"),
                            AppText(state.invoicesList.length.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async =>
                              bloc.add(GetAgentInvoiceListEvent(
                            query: _searchTextField.text,
                            getAgentInvoiceListParams:
                                GetAgentInvoiceListParams(
                                    agentId: widget.participateId),
                          )),
                          child: AppPaginatedList(
                            items: state.invoicesList,
                            itemBuilder: (context, index) =>
                                ParticipateInvoiceCard(
                              invoice: state.invoicesList[index],
                              type: "",
                              openInvoice: _openInvoice,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text('No Invoices Found'));
              }
            }),
          ),
        );
      },
    );
  }

  void _openInvoice(String idInvoice) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.add(GetInvoiceByIdEvent(
      GetInvoiceByIdParams(idInvoice: idInvoice.toString()),
      onSuccess: (invoice) {
        AppNavigator.go(
          InvoiceView(invoice: invoice),
          isNew: false,
        );
      },
    ));
  }
}
