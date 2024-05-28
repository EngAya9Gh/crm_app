import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/support/dates_table/presentation/pages/support_table_page.dart';
import 'package:crm_smart/function_global.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClientSupportCardDetails extends StatelessWidget {
  const ClientSupportCardDetails({
    super.key,
    this.invoiceModel,
    required this.datesInstallation,
    this.nextInstallation,
    required this.list_installation_type,
    this.selectInstallationType,
  });

  final InvoiceModel? invoiceModel;
  final List<DateInstallationClient> datesInstallation;
  final DateInstallationClient? nextInstallation;
  final List<String> list_installation_type;
  final String? selectInstallationType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (invoiceModel!.dateinstall_done != null) ...[
          CardRow(
              title: ' تاريخ التركيب ',
              value: DateFormat('yyyy-MM-dd HH:mm').format(
                  DateTime.parse(invoiceModel!.dateinstall_done.toString()))),
          CardRow(
              title: ' تم التركيب من قبل ',
              value: getnameshort(invoiceModel!.nameuserinstall.toString()))
        ],

        if (nextInstallation?.dateClientVisit != null) ...[
          InkWell(
            onTap: () => AppNavigator.push(SupportTable()),
            child: CardRow(
                title: 'تاريخ الزيارة القادمة',
                value: DateFormat('yyyy-MM-dd HH:mm')
                    .format(nextInstallation!.dateClientVisit!)),
          ),
        ],
        InkWell(
          onTap: () => AppNavigator.push(SupportTable()),
          child: CardRow(
              title: 'عدد الزيارات التي تمت ',
              value: datesInstallation
                  .where((element) => element.isDone == "1")
                  .length
                  .toString()),
        ),
        InkWell(
          onTap: () => AppNavigator.push(SupportTable()),
          child: CardRow(
              title: 'عدد الزيارات المتبقية',
              value: datesInstallation
                  .where((element) =>
                      element.isDone == "0" || element.isDone == '3')
                  .length
                  .toString()),
        ),
        InkWell(
          onTap: () => AppNavigator.push(SupportTable()),
          child: CardRow(
              title: 'عدد الزيارات الملغية',
              value: datesInstallation
                  .where((element) => element.isDone == "2")
                  .length
                  .toString()),
        ),

        invoiceModel!.clientusername == null
            ? Container()
            : CardRow(
                title: 'يوزر العميل ',
                value: getnameshort(invoiceModel!.clientusername.toString())),
        CardRow(
            title: 'حالة الفاتورة',
            value: invoiceModel!.stateclient.toString()),
        CardRow(
            title: 'عنوان الفاتورة ',
            value: getnameshort(invoiceModel!.address_invoice.toString())),
        //////////////////////////////////////////////////////////////////////////////////////////
        invoiceModel!.daterepaly != null
            ? CardRow(
                title: ' تاريخ إعادة الجدولة',
                value: DateFormat('yyyy-MM-dd HH:mm').format(
                    DateTime.parse(invoiceModel!.daterepaly.toString())))
            : Container(),
        invoiceModel!.daterepaly != null
            ? CardRow(
                title: ' قام بإعادة الجدولة',
                value: invoiceModel!.nameuserreplay.toString())
            : Container(),
        invoiceModel!.daterepaly != null
            ? CardRow(
                title: ' سبب إعادة الجدولة',
                value: invoiceModel!.reason_date.toString(),
                isExpanded: true,
              )
            : Container(),
        ///////////////////////////////////////////////
        invoiceModel!.dateinstall_task != null
            ? CardRow(
                title: ' تاريخ جدولة التركيب ',
                value: DateFormat('yyyy-MM-dd HH:mm').format(
                    DateTime.parse(invoiceModel!.dateinstall_task.toString()))
                // DateFormat.yMMMd().
                // format(DateTime.parse(_invoice!.dateinstall_task.toString()))
                )
            : Container(),
        invoiceModel!.dateinstall_task != null
            ? CardRow(
                title: ' قام بجدولة التركيب ',
                value: invoiceModel!.nameusertask.toString())
            : Container(),

        CardRow(
            title: 'طريقة التركيب ',
            value: invoiceModel!.typeInstallation.toString() == '0'
                ? 'ميداني'
                : (invoiceModel!.typeInstallation.toString() == '2'
                    ? 'عميل موصى به'
                    : 'اونلاين')),

        invoiceModel!.ready_install == '0' &&
                invoiceModel!.TypeReadyClient == 'suspend'
            ? CardRow(title: 'هل تم التركيب للعميل ', value: 'معلق')
            : invoiceModel!.ready_install == '0' &&
                    invoiceModel!.TypeReadyClient == 'notReady'
                ? CardRow(title: 'هل تم التركيب للعميل ', value: 'غير جاهز')
                : CardRow(
                    title: 'هل تم التركيب للعميل ',
                    value: invoiceModel!.dateinstall_done == null
                        ? 'بالانتظار'
                        : 'تم التركيب'),

        invoiceModel!.ready_install == '0' &&
                invoiceModel!.dateinstall_done == null
            ? CardRow(
                title: 'ملاحظة التعليق',
                value: invoiceModel!.notes_ready.toString())
            : Container(),

        invoiceModel!.ready_install == '0' &&
                invoiceModel!.TypeReadyClient == 'notReady'
            ? CardRow(
                title: 'سبب تعليق العميل',
                value: invoiceModel!.reason_notReady.toString())
            : Container(),
        invoiceModel!.ready_install == '0' &&
                invoiceModel!.TypeReadyClient == 'suspend'
            ? CardRow(
                title: 'سبب تعليق العميل',
                value: invoiceModel!.reason_suspend.toString())
            : Container(),

        invoiceModel!.date_readyinstall != null
            ? CardRow(
                title: ' تاريخ الغاء تعليق العميل ',
                value: DateFormat('yyyy-MM-dd HH:mm').format(
                    DateTime.parse(invoiceModel!.date_readyinstall.toString())))
            : Container(),
        invoiceModel!.date_readyinstall != null
            ? CardRow(
                title: ' قام بالغاء تعليق العميل ',
                value: invoiceModel!.nameuser_ready_install.toString())
            : Container(),
        invoiceModel!.date_not_readyinstall != null
            ? CardRow(
                title: ' تاريخ تعليق العميل ',
                value: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(
                    invoiceModel!.date_not_readyinstall.toString())))
            : Container(),
        invoiceModel!.date_not_readyinstall != null
            ? CardRow(
                title: ' قام بتعليق العميل ',
                value: invoiceModel!.nameuser_notready_install.toString())
            : Container(),
      ],
    );
  }
}
