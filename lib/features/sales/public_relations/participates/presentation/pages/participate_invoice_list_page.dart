import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../domain/use_cases/get_invoice_by_id_usecase.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';
import '../widgets/participate_invoice_card.dart';

class ParticipateInvoiceListPage extends StatefulWidget {
  final String participateId;

  ParticipateInvoiceListPage({Key? key, required this.participateId})
      : super(key: key);

  @override
  State<ParticipateInvoiceListPage> createState() =>
      _ParticipateInvoiceListPageState();
}

class _ParticipateInvoiceListPageState
    extends State<ParticipateInvoiceListPage> {
  late ParticipateListBloc _participateListBloc;
  late TextEditingController _searchTextField;

  @override
  void initState() {
    _searchTextField = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc = context.read<ParticipateListBloc>();
    });
    super.initState();
  }

  void onSearch() {
    _participateListBloc.add(SearchInvoiceEvent(_searchTextField.text));
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: context
          .read<ParticipateListBloc>()
          .state
          .dialogProgressState
          .isLoading(),
      dismissible: false, // Prevent user from dismissing while loading
      progressIndicator: AppLoader(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
          builder: (context, state) {
            return state.particiPateInvoicesListState.when(
              init: () => AppLoader(),
              loading: () => AppLoader(),
              loaded: (data) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomSearchWidget(
                      searchController: _searchTextField,
                      onChanged: (value) => onSearch(),
                    ),
                    10.height,
                    Padding(
                      padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText("عدد الفواتير"),
                          AppText(data.length.toString()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: AppPaginatedList(
                        items: state.particiPateInvoicesListState.data,
                        itemBuilder: (BuildContext context, int index) =>
                            ParticipateInvoiceCard(
                          invoice:
                              state.particiPateInvoicesListState.data[index],
                          type: "",
                          openInvoice: _opentInvoice,
                        ),
                      ),
                      // ListView.separated(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //   itemBuilder: (BuildContext context, int index) =>
                      //       ParticipateInvoiceCard(
                      //           invoice: state
                      //               .particiPateInvoicesListState.data[index],
                      //           type: "",
                      //           openInvoice: _opentInvoice),
                      //   separatorBuilder: (BuildContext context, int index) =>
                      //       SizedBox(height: 10),
                      //   itemCount:
                      //       state.particiPateInvoicesListState.data.length,
                      // ),
                    ),
                  ],
                ),
              ),
              empty: () => AppText("Empty communications"),
              error: (exception) => AppText("Exception"),
            );
          },
        ),
      ),
    );
  }

  void _opentInvoice(String idInvoice) {
    context.read<ParticipateListBloc>().add(GetInvoiceByIdEvent(
            GetInvoiceByIdParams(idInvoice: idInvoice.toString()),
            onSuccess: (invoice) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => InvoiceView(invoice: invoice),
            ),
          );
        }));
  }
}
