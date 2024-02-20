import 'package:crm_smart/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../common/enums/enums.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart';
import '../../../../manage_participates/presentation/widgets/participate_invoice_card.dart';
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
    _searchTextField = TextEditingController()..addListener(onSearch);
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
                return CustomLoadingIndicator();
              } else if (state.invoicesStatus == StateStatus.failure) {
                return Center(child: Text(state.invoicesError!));
              } else if (state.invoicesStatus == StateStatus.success) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            )),
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2, left: 8, right: 8, bottom: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextField(
                                controller: _searchTextField,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  hintText: "اسم االؤسسة, رقم الفاتورة .....",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            itemBuilder: (BuildContext context, int index) =>
                                ParticipateInvoiceCard(
                              invoice: state.invoicesList[index],
                              type: "",
                              openInvoice: _openInvoice,
                            ),
                            // ParticipateInvoiceCard(
                            //     invoice: state.particiPateInvoicesListState
                            //         .data[index],
                            //     type: "",
                            //     openInvoice: _opentInvoice),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: 10),
                            itemCount: state.invoicesList.length,
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
        AppNavigator.push(InvoiceView(invoice: invoice));
      },
    ));
  }
}
