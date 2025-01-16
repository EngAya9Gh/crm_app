import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/location/city_model.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/maincity_vm.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../sales/clients/clients_list/presentation/widgets/custom_location_field.dart';
import '../../domain/use_cases/set_date_done_usecase.dart';
import '../manager/support_tab_cubit/support_tab_cubit.dart';

class CustomDoneInstallButton extends StatefulWidget {
  const CustomDoneInstallButton({
    super.key,
    this.invoiceModel,
  });

  final InvoiceModel? invoiceModel;

  @override
  State<CustomDoneInstallButton> createState() => _CustomDoneInstallButtonState();
}

class _CustomDoneInstallButtonState extends State<CustomDoneInstallButton> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameUserClient = TextEditingController();
  late final SupportTabCubit supportTabCubit;
  TextEditingController addressClientController = TextEditingController();
  ValueNotifier<CityModel?> selectedCity = ValueNotifier(null);

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
            AppSnackbar.showSnakeBar(
              'العميل غير جاهز للتركيب',
              color: ToastColorsEnum.warning,
            );
            return;
          }
          await showDialog(
            context: context,
            builder: (context) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: AlertDialog(
                  title: AppText('التأكيد'),
                  content: AppText('هل تريد تأكيد عملية التركيب'),
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
                            AppTextField(
                              hintText: ' يوزر العميل',
                              controller: nameUserClient,
                              contentPadding: EdgeInsets.all(10),
                              maxLines: 3,
                              validator: InputValidator.requiredFiled,
                            ),
                            SizedBox(height: 10),
                            // CustomLocationField(
                            //   isEdit: false,
                            //   locationController: addressClientController,
                            // ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: AppElevatedButton(
                                    text: 'لا',
                                    onPressed: () => AppNavigator.pop(),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: BlocBuilder<SupportTabCubit, SupportTabState>(
                                    builder: (context, state) {
                                      return AppElevatedButton(
                                          text: 'نعم',
                                          isLoading: state.setDateDoneStatus.isLoading,
                                          onPressed: () async {
                                            if (!formKey.currentState!.validate()) {
                                              return;
                                            }
                                            await supportTabCubit.setDateDone(SetDateDoneParams(
                                                id_invoice: widget.invoiceModel!.idInvoice!,
                                                clientusername: nameUserClient.text,
                                                // location: addressClientController.text
                                            ));
                                            nameUserClient.clear();
                                            AppNavigator.pop();
                                          });
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
