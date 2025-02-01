import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/manager/verified_invoice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/widgets/app_dialog.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../model/invoiceModel.dart';
import '../../data/models/verified_client_model.dart';
import '../manager/verified_client_bloc.dart';

class InsureTransferClientDialog extends StatelessWidget {
  const InsureTransferClientDialog({
    super.key,
    required VerifiedClientBloc bloc,
    required this.clientModel,
  }) : _bloc = bloc;

  final VerifiedClientBloc _bloc;
  final VerifiedClientModel clientModel;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: 'ترحيل العميل',
      children: [
        20.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<VerifiedClientBloc, VerifiedClientState>(
              bloc: _bloc,
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.verifiedClientList.isLoading(),
                  text: 'تأكيد',
                  onPressed: () {
                    _bloc
                      ..add(ChangeStatusVerifiedClientEvent(clientModel: clientModel))
                      ..add(GetVerifiedClientEvent());
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
