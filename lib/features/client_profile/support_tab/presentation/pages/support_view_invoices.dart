import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/enums.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';
import '../widgets/support_add.dart';

class NewSupportViewInvoices extends StatelessWidget {
  final ClientModel1 itemClient;

  const NewSupportViewInvoices({required this.itemClient});

  @override
  Widget build(BuildContext context) {
    final SupportTabCubit supportTabCubit = context.read<SupportTabCubit>();
    return BlocConsumer<SupportTabCubit, SupportTabState>(
      listener: (context, state) {
        if (state.getInvoiceByClientStatus.isFailed) {
          AppConstants.showSnakeBar(context, state.getInvoiceByClientMessage);
        } else if (state.addDateInstallStatus.isFailed) {
          AppConstants.showSnakeBar(context, state.addDateInstallMessage);
        } else if (state.setDateDoneStatus.isFailed) {
          AppConstants.showSnakeBar(context, state.setDateDoneMessage);
        }
      },
      builder: (context, state) {
        if (state.getInvoiceByClientStatus == StateStatus.loading) {
          return CustomLoadingIndicator();
        } else if (state.getInvoiceByClientStatus == StateStatus.failure) {
          return CustomErrorWidget(message: state.getInvoiceByClientMessage);
        } else if (state.getInvoiceByClientStatus == StateStatus.success &&
            supportTabCubit.listinvoiceClientSupport.isEmpty) {
          return Center(child: Text('العميل غير مشترك'));
        }
        return Scaffold(
          body: ListView.builder(
            itemCount: supportTabCubit.listinvoiceClientSupport.length,
            itemBuilder: (context, index) {
              return NewSupportAdd(
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
