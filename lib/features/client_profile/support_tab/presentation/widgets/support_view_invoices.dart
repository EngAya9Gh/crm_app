import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/support_tab_cubit/support_tab_cubit.dart';

class NewSupportViewInvoices extends StatelessWidget {
  final ClientModel1 itemClient;

  const NewSupportViewInvoices({required this.itemClient});

  @override
  Widget build(BuildContext context) {
    final SupportTabCubit supportTabCubit = context.read<SupportTabCubit>();
    return BlocBuilder<SupportTabCubit, SupportTabState>(
      builder: (context, state) {
        if (state is SupportTabLoading) {
          return CustomLoadingIndicator();
        } else if (state is SupportTabError) {
          return CustomErrorWidget(message: state.message);
        } else if (state is SupportTabLoaded &&
            supportTabCubit.listinvoiceClientSupport.isEmpty) {
          return Center(child: Text('العميل غير مشترك'));
        }
        return Scaffold(
          body: ListView.builder(
            itemCount: supportTabCubit.listinvoiceClientSupport.length,
            itemBuilder: (context, index) {
              return SupportAdd(
                idInvoice:
                    supportTabCubit.listinvoiceClientSupport[index].idInvoice,
                idClient: itemClient.idClients,
              );
            },
          ),
        );
      },
    );
  }
}
