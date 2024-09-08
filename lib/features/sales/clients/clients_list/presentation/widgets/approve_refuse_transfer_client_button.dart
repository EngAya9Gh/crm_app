import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../view_model/client_vm.dart';

class ApproveRefuseTransferClientButton extends StatelessWidget {
  const ApproveRefuseTransferClientButton({
    Key? key,
    required this.idClient,
    required this.clientModel1,
    required this.color,
    required this.title,
    required this.approve,
  }) : super(key: key);

  final String idClient;
  final ClientModel clientModel1;
  final Color color;
  final String title;
  final String approve;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                return ModalProgressHUD(
                  inAsyncCall:
                      Provider.of<ClientProvider>(context, listen: true)
                          .isapproved,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      titlePadding:
                          const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 15.0),
                      insetPadding:
                          EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      contentPadding:
                          EdgeInsets.only(left: 24, right: 24, bottom: 10),
                      title: Center(child: Text('Confirmation')),
                      content: Text(' هل تريد تأكيد العملية؟  '),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor)),
                          onPressed: () {
                            Provider.of<ClientProvider>(context, listen: false)
                                .approveRefuseTransferClient(
                              idClient: idClient,
                              body: {
                                'approve': '$approve',
                              },
                            ).then((value) {
                              AppNavigator.pop();
                              AppNavigator.pop();
                            });
                          },
                          child: Text('نعم'),
                        ),
                        new ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor)),
                          onPressed: () => AppNavigator.pop(),
                          child: Text('لا'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text(title)),
    );
  }
}
