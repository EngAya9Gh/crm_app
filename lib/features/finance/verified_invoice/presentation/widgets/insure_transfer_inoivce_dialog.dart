import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/manager/verified_invoice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/common/widgets/app_dialog.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../model/invoiceModel.dart';

class InsureTransferInoivceDialog extends StatelessWidget {
  const InsureTransferInoivceDialog({
    super.key,
    required VerifiedInvoiceBloc bloc,
    required this.invoiceModel,
  }) : _bloc = bloc;

  final VerifiedInvoiceBloc _bloc;
  final InvoiceModel invoiceModel;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'ترحيل الفاتورة',
      children: [
        20.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<VerifiedInvoiceBloc, VerifiedInvoiceState>(
              bloc: _bloc,
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.verifiedInvoiceList.isLoading(),
                  text: 'تأكيد',
                  onPressed: () {
                    _bloc
                      ..add(ChangeStatusVerifiedInvoiceEvent(invoiceModel: invoiceModel))
                      ..add(GetVerifiedInvoiceEvent());
                    context.pop();
                  },
                );
              },
            ),
            20.height,
            AppElevatedButton(
                text: 'رجوع',
                onPressed: () {
                  context.pop();
                }),
          ],
        ),
        5.height,
      ],
    );
  }
}
