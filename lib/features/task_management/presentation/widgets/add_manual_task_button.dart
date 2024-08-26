import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../view_model/comment.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/task_cubit.dart';
import '../pages/add_manual_task_page.dart';

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
    if (getIt<PrivilegesCubit>().checkPrivilege('173'))
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
                  .getComments(clientId.toString());
            }
          },
          child: Text(
            'إضافة مهمة',
            style: TextStyle(
                fontFamily: AppFonts.fontFamily2,
                color: AppColors.primaryColor),
          ),
        ),
      );
    return SizedBox.shrink();
  }
}
