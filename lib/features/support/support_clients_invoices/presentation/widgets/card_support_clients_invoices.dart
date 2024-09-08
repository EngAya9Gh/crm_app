import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

class CardSupportClientsInvoices extends StatelessWidget {
  const CardSupportClientsInvoices({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.push(ClientProfile(
          tabIndex: 3,
          idClient: invoice.fkIdClient,
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppText(invoice.name_enterprise),
              ),
              10.width,
              AppText(
                invoice.date_approve.toString(),
                color: AppColors.primaryColor,
              ),
            ],
          ),
          if (_showTagIcon(context))
            AppIcon(
              CupertinoIcons.checkmark_seal_fill,
              color: AppColors.secondaryColor,
            ),
        ],
      ),
    );
  }

  bool _showTagIcon(BuildContext context) {
    return (invoice.tag ?? false) &&
        context.read<PrivilegesCubit>().checkPrivilege('133');
  }
}
