import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/model/communication_withdrawal_reason_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/periodic_communication_client_type_enum.dart';
import '../../../core/common/models/config_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/common/client_profile/support_tab/presentation/widgets/add_date_dialog.dart';
import '../../../model/communication_modle.dart';
import '../../../view_model/communication_vm.dart';
import 'app_rate_widget.dart';
import 'communication_withdrawal_reasons_drop_down.dart';
import 'edit_care_communication_sheet.dart';
import 'package:crm_smart/features/care/presentation/widgets/care_card_new.dart';
import '../../../core/utils/app_colors.dart';

class CommunicationExpandedWidget extends StatefulWidget {
  CommunicationExpandedWidget({
    super.key,
    required this.communicationModel,
    required this.initiallyExpanded,
  });

  CommunicationModel communicationModel;
  final bool initiallyExpanded;

  @override
  State<CommunicationExpandedWidget> createState() =>
      _CommunicationExpandedWidgetState();
}

class _CommunicationExpandedWidgetState
    extends State<CommunicationExpandedWidget> {
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
  ValueNotifier<PeriodicCommunicationClientTypeEnum?> clientTypeNotifier =
      ValueNotifier<PeriodicCommunicationClientTypeEnum?>(null);
  ValueNotifier<CommunicationWithdrawalReasonModel?> withdrawalReasonNotifier =
      ValueNotifier<CommunicationWithdrawalReasonModel?>(null);

  @override
  void initState() {
    listenCommunicationVm = context.read<CommunicationVm>();
    watchCommunicationVm = context.read<CommunicationVm>();

    // تهيئة القيم من النموذج إذا كانت موجودة
    if (widget.communicationModel.result == 'true') {
      typepayController = true;
    }
    if (widget.communicationModel.number_wrong == 'true') {
      numberwrong = true;
    }
    if (widget.communicationModel.clientRepeat == 'true') {
      repeat = true;
    }
    if (widget.communicationModel.isRecommendation == 'true') {
      isRecommendation = true;
    }
    if (widget.communicationModel.is_visit == 'true') {
      isVisit = true;
    }
    if (widget.communicationModel.is_suspend == 'true') {
      isSuspend = true;
    }

    // تهيئة قيم التقييم
    if (widget.communicationModel.rate != null) {
      rateSalesValue = double.tryParse(widget.communicationModel.rate!) ?? 0.0;
    }
    if (widget.communicationModel.rateProductValue != null) {
      rateProductValue =
          double.tryParse(widget.communicationModel.rateProductValue!) ?? 0.0;
    }
    if (widget.communicationModel.rateSupportValue != null) {
      rateSupportValue =
          double.tryParse(widget.communicationModel.rateSupportValue!) ?? 0.0;
    }

    super.initState();
  }

  Widget _buildActionButtons() {
    final TextStyle titleStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Column(
      children: [
        // عرض معلومات كفاءة الاستخدام
        if (widget.communicationModel.typeCommuncation == 'كفاءة') ...[
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey[200]!, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildInfoRow(
                  'آخر نشاط:',
                  widget.communicationModel.lastActivity ?? 'غير متوفر',
                ),
                12.verticalSpace,
                _buildInfoRow(
                  'نهاية الاشتراك:',
                  widget.communicationModel.endSubscription != null
                      ? widget.communicationModel.endSubscription!.split(' ')[0]
                      : 'غير متوفر',
                ),
                12.verticalSpace,
                _buildInfoRow(
                  'الباقة:',
                  widget.communicationModel.package ?? 'غير متوفر',
                ),
                12.verticalSpace,
                _buildInfoRow(
                  'آخر موديول:',
                  widget.communicationModel.lastModuleActivity ?? 'غير متوفر',
                ),
                12.verticalSpace,
                _buildInfoRow(
                  'آخر عملية:',
                  widget.communicationModel.lastOperationActivity ??
                      'غير متوفر',
                ),
              ],
            ),
          ),
          if (widget.communicationModel.shouldCommunicate == 1 ||
              widget.communicationModel.dateCommunication == null) ...[
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                text: 'تم التواصل',
                onPressed: () => _onDoneCommunication(context),
                backgroundColor: AppColors.primaryMain,
              ),
            ),
          ],
        ] else if (widget.communicationModel.typeCommuncation == 'دوري' &&
            widget.communicationModel.dateCommunication == null) ...[
          // تقييم عام للخدمة
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'تقييم عام للخدمة',
                style: titleStyle,
                fontSize: 14,
              ),
              AppRateWidget(
                rateValue: rateSalesValue,
                onRatingUpdate: (value) {
                  setState(() {
                    rateSalesValue = value;
                  });
                },
              ),
            ],
          ),
          10.height,
          // تقييم المنتج
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'تقييم المنتج',
                style: titleStyle,
                fontSize: 14,
              ),
              AppRateWidget(
                rateValue: rateProductValue,
                onRatingUpdate: (value) {
                  setState(() {
                    rateProductValue = value;
                  });
                },
              ),
            ],
          ),
          10.height,
          // تقييم الدعم الفني
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'تقييم الدعم الفني',
                style: titleStyle,
                fontSize: 14,
              ),
              AppRateWidget(
                rateValue: rateSupportValue,
                onRatingUpdate: (value) {
                  setState(() {
                    rateSupportValue = value;
                  });
                },
              ),
            ],
          ),
          10.height,
          // خيارات إضافية للتواصل الدوري
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: AppText(
                    'لا يستخدم النظام',
                    fontSize: 15.scaleFontSize,
                  ),
                  value: typepayController,
                  onChanged: (val) {
                    setState(() {
                      typepayController = val ?? false;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: AppText(
                    'رقم خاطئ',
                    fontSize: 15.scaleFontSize,
                  ),
                  value: numberwrong,
                  onChanged: (val) {
                    setState(() {
                      numberwrong = val ?? false;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: AppText(
                    'عميل متكرر',
                    fontSize: 15.scaleFontSize,
                  ),
                  value: repeat,
                  onChanged: (val) {
                    setState(() {
                      repeat = val ?? false;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: AppText(
                    'وصى بالنظام',
                    fontSize: 15.scaleFontSize,
                  ),
                  value: isRecommendation,
                  onChanged: (val) {
                    setState(() {
                      isRecommendation = val ?? false;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: AppText(
                    'يحتاج زيارة',
                    fontSize: 15.scaleFontSize,
                  ),
                  value: isVisit,
                  onChanged: (val) {
                    setState(() {
                      isVisit = val ?? false;
                    });
                  },
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: AppText(
                    'معلق',
                    fontSize: 15.scaleFontSize,
                  ),
                  value: isSuspend,
                  onChanged: (val) {
                    setState(() {
                      isSuspend = val ?? false;
                      // if (isSuspend) {
                      //   rateSalesValue = 0.0;
                      //   rateProductValue = 0.0;
                      //   rateSupportValue = 0.0;
                      // }
                    });
                  },
                ),
              ),
            ],
          ),
          20.height,
        ],
        // تقييم عام للتركيب
        if (widget.communicationModel.typeCommuncation == 'تركيب' &&
            widget.communicationModel.dateCommunication == null) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'تقييم عام للتركيب',
                style: titleStyle,
                fontSize: 14,
              ),
              AppRateWidget(
                rateValue: rateSalesValue,
                onRatingUpdate: (value) {
                  setState(() {
                    rateSalesValue = value;
                  });
                },
              ),
            ],
          ),
          20.height,
        ],
        if (widget.communicationModel.typeCommuncation == 'دوري' &&
            widget.communicationModel.dateCommunication == null) ...[
          CustomDropDown<PeriodicCommunicationClientTypeEnum>(
            hint: "نوع العميل",
            compareFn: (item, selectedItem) => item.index == selectedItem.index,
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
              return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 10),
                  child: CommunicationWithdrawalReasonsDropDown(
                    withdrawalReason: withdrawalReasonNotifier.value,
                    onChanged: (value) {
                      withdrawalReasonNotifier.value = value;
                    },
                  ));
            }
            return SizedBox.shrink();
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // زر تم التواصل - يظهر فقط إذا لم يكن هناك تاريخ تواصل
            if (widget.communicationModel.dateCommunication == null)
              AppElevatedButton(
                text: 'تم التواصل',
                onPressed: () => _onDoneCommunication(context),
              ),
            // زر التعديل - يظهر فقط إذا كان هناك تاريخ تواصل
            // if (widget.communicationModel.dateCommunication != null)
            //   AppElevatedButton(
            //     text: 'تعديل',
            //     onPressed: () async {
            //       showModalBottomSheet(
            //         context: context,
            //         builder: (context) => EditCareCommunicationSheet(
            //           communicationModel: widget.communicationModel,
            //         ),
            //         shape: RoundedRectangleBorder(
            //           borderRadius:
            //               BorderRadius.vertical(top: Radius.circular(15)),
            //         ),
            //         isScrollControlled: true,
            //       );
            //     },
            //   ),
            // زر إضافة موعد زيارة - يظهر فقط في حالة الترحيب
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
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.grey[700],
        ),
        8.horizontalSpace,
        Expanded(
          child: AppText(
            value,
            fontSize: 14.sp,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  String _buildDescription() {
    List<String> details = [];

    if (widget.communicationModel.typeCommuncation == 'ترحيب') {
      details.add('تم الترحيب من قبل: ${widget.communicationModel.nameUser}');
      details
          .add('تاريخ الترحيب: ${widget.communicationModel.dateCommunication}');
    }

    if (widget.communicationModel.typeCommuncation == 'كفاءة') {
      if (widget.communicationModel.dateCommunication != null) {
        details.add('تم التواصل من قبل: ${widget.communicationModel.nameUser}');
        details.add(
            'تاريخ التواصل: ${widget.communicationModel.dateCommunication}');
      }

      // إضافة معلومات كفاءة الاستخدام الرئيسية
      if (widget.communicationModel.lastActivity != null) {
        details.add('آخر نشاط: ${widget.communicationModel.lastActivity}');
      }

      if (widget.communicationModel.package != null) {
        details.add('الباقة: ${widget.communicationModel.package}');
      }

      if (widget.communicationModel.endSubscription != null) {
        String endDate =
            widget.communicationModel.endSubscription!.split(' ')[0];
        details.add('نهاية الاشتراك: $endDate');
      }
    }

    if (widget.communicationModel.typeCommuncation == 'دوري') {
      // إضافة معلومات الموظف والتاريخ إذا تم التواصل
      if (widget.communicationModel.dateCommunication != null) {
        details.add('موظف التقييم: ${widget.communicationModel.nameUser}');
        details.add(
            'تاريخ التقييم: ${widget.communicationModel.dateCommunication}');

        // إضافة نتيجة التواصل
        if (widget.communicationModel.result == 'true') {
          details.add('نتيجة التواصل: لا يستخدم النظام');
        } else if (widget.communicationModel.result == 'false') {
          details.add('نتيجة التواصل: يستخدم النظام');
        }

        // إضافة التقييمات
        // if (widget.communicationModel.rate != null &&
        //     widget.communicationModel.rate!.isNotEmpty) {
        //   details.add('تقييم عام: ${widget.communicationModel.rate}');
        // }
        // if (widget.communicationModel.rateProductValue != null &&
        //     widget.communicationModel.rateProductValue!.isNotEmpty) {
        //   details.add(
        //       'تقييم المنتج: ${widget.communicationModel.rateProductValue}');
        // }
        // if (widget.communicationModel.rateSupportValue != null &&
        //     widget.communicationModel.rateSupportValue!.isNotEmpty) {
        //   details.add(
        //       'تقييم الدعم الفني: ${widget.communicationModel.rateSupportValue}');
        // }

        // إضافة الحالات المختلفة
        if (widget.communicationModel.clientRepeat == 'true') {
          details.add('العميل متكرر');
        }
        if (widget.communicationModel.number_wrong == 'true') {
          details.add('الرقم خاطئ');
        }
        if (widget.communicationModel.isRecommendation == 'true') {
          details.add('وصى بالنظام');
        }
        if (widget.communicationModel.is_visit == 'true') {
          details.add('يحتاج زيارة ميدانية');
        }
        if (widget.communicationModel.is_suspend == 'true') {
          details.add('معلق');
        }

        // إضافة الملاحظات إذا وجدت
        if (widget.communicationModel.notes?.isNotEmpty == true) {
          details.add('الملاحظات: ${widget.communicationModel.notes}');
        }

        // إضافة موعد المتابعة القادم إذا وجد
        if (widget.communicationModel.dateNext?.isNotEmpty == true &&
            widget.communicationModel.dateCommunication != null &&
            widget.communicationModel.typeCommuncation != 'دوري') {
          details.add(
              'موعد المتابعة القادم: ${widget.communicationModel.dateNext}');
        }
      } else {
        // إذا لم يتم التواصل بعد، نعرض معلومات الفرع
        details.add('فرع المدينة');
      }
    }

    if (widget.communicationModel.typeCommuncation == 'تركيب') {
      if (widget.communicationModel.dateCommunication != null) {
        details.add('موظف التقييم: ${widget.communicationModel.nameUser}');
        details.add(
            'تاريخ التقييم: ${widget.communicationModel.dateCommunication}');
      }

      details.add(
          'نوع التركيب: ${widget.communicationModel.type_install == '1' ? 'جودة أول' : 'جودة ثاني'}');

      if (widget.communicationModel.rate != null &&
          widget.communicationModel.rate!.isNotEmpty) {
        details.add('تقييم عام: ${widget.communicationModel.rate}');
      }
    }

    return details.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    if (widget.communicationModel.idCommunication == '') {
      return SizedBox.shrink();
    }

    String? dateinvoice = widget.communicationModel.date_approve;
    String val = dateinvoice != null ? '(فاتورة ${dateinvoice})' : '';
    String title =
        get_title_care(widget.communicationModel.typeCommuncation.toString()) +
            val;

    // عرض مؤشر التحميل عندما يكون هناك تحميل
    if (watchCommunicationVm.isload &&
        watchCommunicationVm.id == widget.communicationModel.idCommunication) {
      return Center(child: CircularProgressIndicator());
    }

    return CareCardNew(
      title: title,
      description: _buildDescription(),
      type: widget.communicationModel.typeCommuncation,
      status: widget.communicationModel.result,
      date:
          DateTime.tryParse(widget.communicationModel.dateCommunication ?? ''),
      userName: widget.communicationModel.nameUser,
      userRole: widget.communicationModel.name_regoin ?? 'فرع المدينة',
      rate: widget.communicationModel.rate?.isNotEmpty == true
          ? widget.communicationModel.rate
          : null,
      rateProduct:
          widget.communicationModel.rateProductValue?.isNotEmpty == true
              ? widget.communicationModel.rateProductValue
              : null,
      rateSupport:
          widget.communicationModel.rateSupportValue?.isNotEmpty == true
              ? widget.communicationModel.rateSupportValue
              : null,
      onEdit: () async {
        if (widget.communicationModel.dateCommunication != null) {
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
        }
      },
      isExpanded: widget.initiallyExpanded,
      actionButtons: _buildActionButtons(),
      // showActions: false,
    );
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
    Provider.of<CommunicationVm>(context, listen: false)
        .isloadval(true, id: widget.communicationModel.idCommunication);

    try {
      if (widget.communicationModel.typeCommuncation == 'كفاءة') {
        await Provider.of<CommunicationVm>(context, listen: false)
            .updateCareCommunication(
          body: {
            'type': 'كفاءة',
            'result': '0',
          },
          id_communication: widget.communicationModel.idCommunication,
        );
      } else if (widget.communicationModel.typeCommuncation != 'دوري') {
        await Provider.of<CommunicationVm>(context, listen: false)
            .addCommunication(
          {
            'rate': rateSalesValue.toString(),
            'rate_product': rateProductValue.toString(),
            'rate_chat': rateSupportValue.toString(),
            'result': '0',
            'type_install':
                widget.communicationModel.type_install?.toString() ?? '1',
            'id_invoice': widget.communicationModel.id_invoice.toString(),
            if (clientTypeNotifier.value != null)
              'state': clientTypeNotifier.value!.value,
            if (withdrawalReasonNotifier.value != null)
              'reason_id': withdrawalReasonNotifier.value!.idReason,
          },
          widget.communicationModel.idCommunication,
          widget.communicationModel.type_install == null
              ? 1
              : int.parse(widget.communicationModel.type_install.toString()),
        ).then((value) => clear(value));
      } else {
        // التعامل مع التواصل الدوري
        if (widget.communicationModel.dateCommunication == null) {
          if (isSuspend) rateSalesValue = 0.0;

          await Provider.of<CommunicationVm>(context, listen: false)
              .updateCareCommunication(
            body: {
              'rate': rateSalesValue.toString(),
              'rate_product': rateProductValue.toString(),
              'rate_chat': rateSupportValue.toString(),
              'number_wrong': numberwrong.toString(),
              'client_repeat': repeat.toString(),
              'type': 'دوري',
              'result': typepayController.toString(),
              'isRecommendation': isRecommendation.toString(),
              'is_visit': isVisit.toString(),
              'is_suspend': isSuspend.toString(),
              if (clientTypeNotifier.value != null)
                'state': clientTypeNotifier.value!.value,
              if (withdrawalReasonNotifier.value != null)
                'reason_id': withdrawalReasonNotifier.value!.idReason,
            },
            id_communication: widget.communicationModel.idCommunication,
          );
        }
      }
    } finally {
      Provider.of<CommunicationVm>(context, listen: false).isloadval(false);
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
