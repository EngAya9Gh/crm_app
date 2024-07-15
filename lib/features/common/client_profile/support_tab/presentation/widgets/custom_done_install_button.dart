import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../domain/use_cases/set_date_done_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class CustomDoneInstallButton extends StatefulWidget {
  const CustomDoneInstallButton({
    super.key,
    this.invoiceModel,
  });

  final InvoiceModel? invoiceModel;

  @override
  State<CustomDoneInstallButton> createState() =>
      _CustomDoneInstallButtonState();
}

class _CustomDoneInstallButtonState extends State<CustomDoneInstallButton> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameUserClient = TextEditingController();
  late final SupportTabCubit supportTabCubit;

  @override
  void initState() {
    supportTabCubit = context.read<SupportTabCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final supportTabCubit = context.read<SupportTabCubit>();
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          nameUserClient.dispose();
        }
      },
      child: AppElevatedButton(
        isDisabled: widget.invoiceModel!.ready_install == '0',
        text: 'تم التركيب للعميل',
        onPressed: () async {
          if (widget.invoiceModel!.ready_install == '0') {
            AppConstants.showSnakeBar(context, 'العميل غير جاهز للتركيب');
            return;
          }
          await showDialog(
            context: context,
            builder: (context) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  title: Text('التأكيد'),
                  content: Text('هل تريد تأكيد عملية التركيب'),
                  actions: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.8,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 600,
                            ),
                            EditTextFormField(
                              maxline: 4,
                              paddcustom: EdgeInsets.all(10),
                              hintText: ' يوزر العميل',
                              obscureText: false,
                              controller: nameUserClient,
                              vaildator: InputValidator.requiredFiled,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: AppElevatedButton(
                                    onPressed: () => AppNavigator.pop(),
                                    child: Text('لا'),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: BlocBuilder<SupportTabCubit,
                                      SupportTabState>(
                                    builder: (context, state) {
                                      return AppElevatedButton(
                                        isLoading:
                                            state.setDateDoneStatus.isLoading,
                                        onPressed: () async {
                                          if (!formKey.currentState!
                                              .validate()) {
                                            return;
                                          }
                                          await supportTabCubit
                                              .setDateDone(SetDateDoneParams(
                                            id_invoice:
                                                widget.invoiceModel!.idInvoice!,
                                            clientusername: nameUserClient.text,
                                          ));
                                          nameUserClient.clear();
                                          AppNavigator.pop();
                                        },
                                        child: Text('نعم'),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
