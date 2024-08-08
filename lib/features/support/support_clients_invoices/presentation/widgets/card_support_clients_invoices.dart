import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';

class CardSupportClientsInvoices extends StatelessWidget {
  const CardSupportClientsInvoices({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: InkWell(
          onTap: () {
            AppNavigator.push(ProfileClient(
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
                    child: AppText(invoice.name_enterprise.toString()),
                  ),
                  AppText(
                    invoice.date_approve.toString(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
              if (_showTagIcon(context))
                Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Colors.amber,
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool _showTagIcon(BuildContext context) {
    return (invoice.tag ?? false) &&
        context.read<PrivilegeCubit>().checkPrivilege('133');
  }
}
