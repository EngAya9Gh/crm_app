import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/model/communication_withdrawal_reason_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/installation_type_enum.dart';
import '../../../core/common/enums/periodic_communication_client_type_enum.dart';
import '../../../core/common/models/config_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/common/client_profile/support_tab/presentation/widgets/add_date_dialog.dart';
import '../../../model/communication_modle.dart';
import '../../../view_model/communication_vm.dart';
import '../../widgets/custom_widget/card_expansion.dart';
import '../../widgets/custom_widget/card_row.dart';
import 'app_rate_widget.dart';
import 'communication_withdrawal_reasons_drop_down.dart';
import 'edit_care_communication_sheet.dart';

class CommunicationExpandedWidget extends StatefulWidget {
  CommunicationExpandedWidget({
    super.key,
    required this.communicationModel,
    required this.initiallyExpanded,
  });

  CommunicationModel communicationModel;
  final bool initiallyExpanded;

  @override
  State<CommunicationExpandedWidget> createState() => _CommunicationExpandedWidgetState();
}

class _CommunicationExpandedWidgetState extends State<CommunicationExpandedWidget> {
  bool typepayController = false;
  bool numberwrong = false;
  bool repeat = false;
  bool isdone = false;
  late ConfigModel peroid;
  bool isRecommendation = false;
  bool isVisit = false;
  bool isSuspend = false;
  late final CommunicationVm watchCommunicationVm;
  late final CommunicationVm listenCommunicationVm;
  double rateSalesValue = 0.0;
  double rateSupportValue = 0.0;
  double rateProductValue = 0.0;
  ValueNotifier<PeriodicCommunicationClientTypeEnum?> clientTypeNotifier = ValueNotifier<PeriodicCommunicationClientTypeEnum?>(null);
  ValueNotifier<CommunicationWithdrawalReasonModel?> withdrawalReasonNotifier = ValueNotifier<CommunicationWithdrawalReasonModel?>(null);

  @override
  void initState() {
    listenCommunicationVm = context.read<CommunicationVm>();
    watchCommunicationVm = context.read<CommunicationVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? dateinvoice = widget.communicationModel.date_create;
    String val = dateinvoice != null ? '(فاتورة ${dateinvoice})' : '';
    if (widget.communicationModel.idCommunication != '') {
      return buildcardExpansion(
        get_title_care(widget.communicationModel.typeCommuncation.toString()) + val,
        '',
        widget.communicationModel.dateCommunication != null
            ? Column(
                children: [
                  widget.communicationModel.typeCommuncation == 'ترحيب'
                      ? CardRow(
                          title: 'تم الترحيب من قبل',
                          value: (widget.communicationModel.nameUser.toString()),
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'ترحيب'
                      ? CardRow(
                          title: 'تاريخ الترحيب بالعميل',
                          value: widget.communicationModel.dateCommunication.toString(),
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دورى' || widget.communicationModel.typeCommuncation == 'تركيب'
                      ? CardRow(
                          title: 'موظف التقييم',
                          value: (widget.communicationModel.nameUser.toString()),
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دورى' || widget.communicationModel.typeCommuncation == 'تركيب'
                      ? CardRow(
                          title: 'تاريخ التقييم',
                          value: widget.communicationModel.dateCommunication.toString(),
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دورى' && widget.communicationModel.result.toString() == 'true'
                      ? CardRow(
                          title: ' نتيجة التواصل',
                          value: widget.communicationModel.result.toString() == 'true' ? 'لايستخدم النظام' : 'يستخدم النظام',
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دورى' && widget.communicationModel.clientRepeat.toString() != 'false'
                      ? CardRow(
                          title: ' نتيجة التواصل',
                          value: widget.communicationModel.clientRepeat.toString() == 'false' ? '' : 'العميل متكرر',
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دوري' && widget.communicationModel.number_wrong.toString() != 'false'
                      ? CardRow(
                          title: ' نتيجة التواصل',
                          value: widget.communicationModel.number_wrong.toString() == 'false' ? '' : 'الرقم خاطئ',
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دوري' && widget.communicationModel.isRecommendation.toString() == 'true'
                      ? CardRow(
                          title: ' نتيجة التواصل',
                          value: 'وصى بالنظام',
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دوري' && widget.communicationModel.is_visit.toString() == 'true'
                      ? CardRow(
                          title: ' نتيجة التواصل',
                          value: 'يحتاج زيارة ميدانية',
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'دوري' && widget.communicationModel.is_suspend.toString() == 'true'
                      ? CardRow(
                          title: ' نتيجة التواصل',
                          value: 'معلق',
                        )
                      : Container(),
                  widget.communicationModel.typeCommuncation == 'تركيب'
                      ? CardRow(
                          title: ' نوع التركيب',
                          value: widget.communicationModel.type_install.toString() == '1' ? 'جودة أول' : 'جودة ثاني',
                        )
                      : Container(),
                  if (widget.communicationModel.typeCommuncation == 'دوري' || widget.communicationModel.typeCommuncation == 'تركيب')
                    AppRateWidget(
                      title: 'تقييم عام',
                      isReadOnly: true,
                      initialRating: double.tryParse(widget.communicationModel.rate ?? '0') ?? 0,
                      rateValue: double.tryParse(widget.communicationModel.rate ?? '0') ?? 0,
                    ),
                  if (widget.communicationModel.typeCommuncation == 'دوري') ...[
                    AppRateWidget(
                      title: 'تقييم المنتج',
                      isReadOnly: true,
                      initialRating: double.tryParse(widget.communicationModel.rateProductValue ?? '0') ?? 0,
                      rateValue: double.tryParse(widget.communicationModel.rateProductValue ?? '0') ?? 0,
                    ),
                    AppRateWidget(
                      title: 'تقييم الدعم الفني (الشات)',
                      isReadOnly: true,
                      initialRating: double.tryParse(widget.communicationModel.rateSupportValue ?? '0') ?? 0,
                      rateValue: double.tryParse(widget.communicationModel.rateSupportValue ?? '0') ?? 0,
                    ),
                  ],
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppElevatedButton(
                        text: 'تعديل',
                        onPressed: () async {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => EditCareCommunicationSheet(
                              communicationModel: widget.communicationModel,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                            ),
                            isScrollControlled: true,
                          );
                        },
                      ),
                      if (widget.communicationModel.typeCommuncation == 'ترحيب') ...[
                        10.width,
                        AppElevatedButton(
                          text: 'إضافة موعد زيارة',
                          onPressed: () => _addDateInstall(context),
                          appButtonStyle: AppButtonStyle.secondary,
                        ),
                      ],
                    ],
                  ),
                  5.height,
                ],
              )
            // : Provider.of<communication_vm>(context,listen: true).isload?
            //    Center(child: CircularProgressIndicator())
            : watchCommunicationVm.isload
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        widget.communicationModel.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: AppText('لا يستخدم النظام'),
                                value: typepayController, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    typepayController = value!;
                                  });
                                },
                              )
                            : Container(),
                        widget.communicationModel.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: AppText('لايوجد رقم هاتف-أو الرقم خاطئ'),
                                value: numberwrong, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    numberwrong = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.communicationModel.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: AppText('العميل متكرر'),
                                value: repeat, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    repeat = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.communicationModel.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: AppText('وصى بالنظام'),
                                value: isRecommendation, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isRecommendation = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.communicationModel.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: AppText('يحتاج زيارة ميدانية'),
                                value: isVisit, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isVisit = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        widget.communicationModel.typeCommuncation == 'دوري'
                            ? CheckboxListTile(
                                title: AppText('معلق'),
                                value: isSuspend, // as bool,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSuspend = value!;
                                    //values[key] = value;
                                  });
                                },
                              )
                            : Container(),
                        if (widget.communicationModel.typeCommuncation == 'تركيب' || widget.communicationModel.typeCommuncation == 'دوري') ...[
                          AppRateWidget(
                              initialRating: rateSalesValue,
                              title: 'تقييم عام',
                              rateValue: rateSalesValue,
                              onRatingUpdate: (value) {
                                setState(() {
                                  rateSalesValue = value;
                                });
                              }),
                        ],
                        if (widget.communicationModel.typeCommuncation == 'دوري') ...[
                          AppRateWidget(
                              initialRating: rateProductValue,
                              title: 'تقييم المنتج',
                              rateValue: rateProductValue,
                              onRatingUpdate: (value) {
                                setState(() {
                                  rateProductValue = value;
                                });
                              }),
                          AppRateWidget(
                              title: 'تقييم الدعم الفني (الشات)',
                              initialRating: rateSupportValue,
                              rateValue: rateSupportValue,
                              onRatingUpdate: (value) {
                                setState(() {
                                  rateSupportValue = value;
                                });
                              }),
                        ],
                        10.height,
                        if (widget.communicationModel.typeCommuncation == 'دوري') ...[
                          CustomDropDown<PeriodicCommunicationClientTypeEnum>(
                            hint: "نوع العميل",
                            items: PeriodicCommunicationClientTypeEnum.values,
                            itemAsString: (item) => item!.value,
                            selectedItem: clientTypeNotifier.value,
                            onChanged: (value) => clientTypeNotifier.value = value,
                            height: 105.h,
                          ),
                          10.height,
                        ],
                        ListenableBuilder(
                          listenable: clientTypeNotifier,
                          builder: (context, child) {
                            if (clientTypeNotifier.value?.isWithdrawn ?? false) {
                              return CommunicationWithdrawalReasonsDropDown(
                                withdrawalReason: withdrawalReasonNotifier.value,
                                onChanged: (value) {
                                  withdrawalReasonNotifier.value = value;
                                },
                              );
                            }
                            return SizedBox.shrink();
                          },
                        ),
                        20.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppElevatedButton(
                              text: 'تم التواصل',
                              isLoading: listenCommunicationVm.isload,
                              onPressed: () async {
                                await _onDoneCommunication(context);
                                if (widget.communicationModel.typeCommuncation == 'ترحيب') {
                                  _addDateInstall(context).then((value) async {
                                    if (value == true) {}
                                  });
                                }
                              },
                            ),
                            if (widget.communicationModel.typeCommuncation == 'ترحيب') ...[
                              10.width,
                              AppElevatedButton(
                                text: 'إضافة موعد زيارة',
                                onPressed: () => _addDateInstall(context),
                                appButtonStyle: AppButtonStyle.secondary,
                              ),
                            ],
                          ],
                        ),
                        5.height,
                      ],
                    ),
                  ),
        initiallyExpanded: widget.initiallyExpanded,
      );
    }
    return SizedBox.shrink();
  }

  Future<bool?> _addDateInstall(BuildContext context) async {
    return await showDialog<bool?>(
      context: context,
      builder: (context) {
        return AddDateDialog(
          invoiceId: widget.communicationModel.id_invoice,
          idClient: widget.communicationModel.fkClient,
          datesInstallation: null,
        );
      },
    );
  }

  Future<void> _onDoneCommunication(BuildContext context) async {
    Provider.of<CommunicationVm>(context, listen: false).isloadval(true);

    if (widget.communicationModel.typeCommuncation != 'دوري') {
      Provider.of<CommunicationVm>(context, listen: false).addCommunication(
          {
            'rate': rateSalesValue.toString(),
            'rate_product': rateProductValue.toString(),
            'rate_chat': rateSupportValue.toString(),
            'result': '0',
            'type_install': widget.communicationModel.type_install.toString(),
            'id_invoice': widget.communicationModel.id_invoice.toString(),
            if (clientTypeNotifier.value != null) 'state': clientTypeNotifier.value!.value,
            if (withdrawalReasonNotifier.value != null) 'reason_id': withdrawalReasonNotifier.value!.idReason,
          },
          widget.communicationModel.idCommunication,
          widget.communicationModel.type_install == null
              ? 1
              : int.parse(widget.communicationModel.type_install.toString())).then((value) => clear(value));
    } else {
      if (widget.communicationModel.dateCommunication == null) {
        if (isSuspend.toString() == 'true') rateSalesValue = 0.0;

        await Provider.of<CommunicationVm>(context, listen: false).updateCareCommunication(
          body: {
            'rate': rateSalesValue.toString(),
            'rate_product': rateProductValue.toString(),
            'rate_chat': rateSupportValue.toString(),
            'number_wrong': numberwrong.toString(),
            'client_repeat': repeat.toString(),
            'type': 'دوري',
            'result': typepayController.toString(), //use or not using
            'isRecommendation': isRecommendation.toString(),
            'is_visit': isVisit.toString(),
            'is_suspend': isSuspend.toString(),
            if (clientTypeNotifier.value != null) 'state': clientTypeNotifier.value!.value,
            if (withdrawalReasonNotifier.value != null) 'reason_id': withdrawalReasonNotifier.value!.idReason,
          },
          id_communication: widget.communicationModel.idCommunication,
        );
        // clear(val);
      }
    }
  }

  String get_title_care(String type) {
    switch (type) {
      case 'ترحيب':
        return 'تفاصيل الترحيب بالعميل ';
      case 'تركيب':
        return 'تفاصيل جودة التركيب والتدريب  ';
      case 'دوري':
        return 'تفاصيل تقييم الخدمة ';
    }
    return '';
  }

  clear(value) {
    widget.communicationModel = value;
    setState(() {});
  }
}
