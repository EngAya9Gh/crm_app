import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_manual_task_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/di/di_container.dart';
import '../../../../view_model/comment.dart';
import '../manager/task_cubit.dart';

class AddManualTaskButton extends StatelessWidget {
  const AddManualTaskButton({
    Key? key,
    required this.list,
    this.clientId,
    this.invoiceId,
  }) : super(key: key);

  final List<PublicType> list;
  final String? clientId;
  final String? invoiceId;

  @override
  Widget build(BuildContext context) {
    if (getIt<PrivilegeCubit>().checkPrivilege('173'))
      return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) => AddManualTaskPage(
                list: list,
                invoiceId: invoiceId,
                clientId: clientId,
              ),
            );

            if (result == true) {
              Provider.of<comment_vm>(context, listen: false)
                  .getComment(clientId.toString());
            }
          },
          child: Text(
            'إضافة مهمة',
            style: TextStyle(fontFamily: kfontfamily2, color: kMainColor),
          ),
        ),
      );
    return SizedBox.shrink();
  }
}
