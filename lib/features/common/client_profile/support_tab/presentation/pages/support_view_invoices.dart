import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';
import '../widgets/support_add.dart';

class SupportViewInvoices extends StatelessWidget {
  final ClientModel itemClient;

  const SupportViewInvoices({required this.itemClient});

  @override
  Widget build(BuildContext context) {
    final SupportTabCubit supportTabCubit = context.read<SupportTabCubit>();
    return BlocConsumer<SupportTabCubit, SupportTabState>(
      listener: (context, state) {
        if (state.getInvoiceByClientStatus.isFailed()) {
          AppSnackbar.showSnakeBar(
            state.getInvoiceByClientStatus.error ?? 'Something went wrong!',
          );
        } else if (state.setDateDoneStatus.isFailed) {
          AppSnackbar.showSnakeBar(state.setDateDoneMessage);
        } else if (state.setReadyInstallStatus.isFailed) {
          AppSnackbar.showSnakeBar(state.setReadyInstallMessage);
        }
      },
      buildWhen: (previous, current) {
        return current.refreshUi != previous.refreshUi ||
            previous.getInvoiceByClientStatus !=
                current.getInvoiceByClientStatus;
      },
      builder: (context, state) {
        if (state.getInvoiceByClientStatus.isLoading()) {
          return AppLoader();
        } else if (state.getInvoiceByClientStatus.isFailed()) {
          return CustomErrorWidget(
              message: state.getInvoiceByClientStatus.error);
        } else if (state.getInvoiceByClientStatus.isSuccess() &&
            supportTabCubit.listInvoiceClientSupport.isEmpty) {
          return Center(child: Text('العميل غير مشترك'));
        }
        return Scaffold(
          body: ListView.builder(
            key: UniqueKey(),
            itemCount: supportTabCubit.listInvoiceClientSupport.length,
            itemBuilder: (context, index) {
              return SupportAdd(
                idInvoice:
                    supportTabCubit.listInvoiceClientSupport[index].idInvoice,
                idClient: itemClient.idClients,
              );
            },
          ),
        );
      },
    );
  }
}
