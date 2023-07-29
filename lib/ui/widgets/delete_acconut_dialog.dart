import 'package:crm_smart/constants.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/login.dart';

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({Key? key}) : super(key: key);

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          Icon(Icons.warning_rounded, size: 35, color: Colors.redAccent),
          SizedBox(height: 20),
          Text(
            "هل تود حذف الحســاب؟",
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontFamily: kfontfamily2),
          ),
          SizedBox(height: 15),
          Text(
            "عند إجراء هذه الخطوة سيتم حذف حسابك بشكل كامل, ولا يمكنك التراجع عنها عندما تنتهي.",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey, fontFamily: kfontfamily2),
          ),
          Consumer<user_vm_provider>(builder: (context, userProvider, _) {
            if (userProvider.isDeletingAccount) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      userProvider.deleteAccount(
                        onDeleteSucceed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => login()),
                            (route) => false,
                          );
                        },
                      );
                    },
                    child: Text("حذف الحساب"),
                    style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: kfontfamily2),
                        foregroundColor: Colors.red),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("إلغاء"),
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600, fontFamily: kfontfamily2),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
