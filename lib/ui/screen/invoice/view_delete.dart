import 'package:crm_smart/features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../model/invoiceModel.dart';
import '../../widgets/custom_widget/card_row.dart';
import '../../widgets/widgetlogo.dart';

class view_deleted extends StatelessWidget {
  view_deleted({Key? key, required this.invoice}) : super(key: key);
  InvoiceModel invoice;

  Widget _product(String name, String amount, String price) {
    return Column(
      children: [
        Row(
          children: [
            //Expanded flex 1
            Expanded(
              flex: 1,
              child: Text(
                name,
                style: TextStyle(fontFamily: kfontfamily2),
              ),
            ),

            // Spacer(),
            Text(
              amount,
              style: TextStyle(fontFamily: kfontfamily2),
            ),
            SizedBox(width: 13),
            Text(
              price,
              style: TextStyle(fontFamily: kfontfamily2),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تفاصيل الفاتورة",
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (invoice.products?.isNotEmpty ?? false)
                    _product('اسم المنتج', 'الكمية', 'السعر'),
                  for (int index = 0; index < invoice.products!.length; index++)
                    _product(
                        invoice.products![index].nameProduct.toString(),
                        invoice.products![index].amount.toString(),
                        invoice.products![index].price.toString()),
                  Container(
                    color: Colors.amberAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'المبلغ الإجمالي   ',
                          style: TextStyle(fontFamily: kfontfamily3),
                        ),
                        //Spacer(),
                        Text(
                          invoice.total.toString(),
                          style: TextStyle(fontFamily: kfontfamily2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  CardRow(
                      title: 'اسم العميل',
                      value: invoice.nameClient.toString()),
                  CardRow(
                      title: 'اسم المؤسسة',
                      value: invoice.name_enterprise.toString()),
                  CardRow(
                      title: 'حالة الفاتورة',
                      value: invoice.stateclient.toString()),
                  CardRow(
                      title: 'فرع الفاتورة',
                      value: invoice.name_regoin_invoice.toString()),

                  CardRow(
                      title: 'اسم الموظف', value: invoice.nameUser.toString()),
                  CardRow(
                      title: 'فرع الموظف',
                      value: invoice.name_regoin_invoice.toString()),
                  //cardRow(title: 'حالة الفاتورة', value: invoice.amountPaid.toString()),

                  invoice.date_approve.toString() == null
                      ? CardRow(
                          title: 'تاريخ عقد الإشتراك',
                          value: invoice.date_approve.toString())
                      : Container(),

                  CardRow(
                      title: 'المبلغ المدفوع',
                      value: invoice.amountPaid.toString()),
                  CardRow(
                      title: ' المبلغ المتبقي',
                      value: ((num.tryParse(invoice.total?.toString() ?? "0") ??
                                  0) -
                              (num.tryParse(
                                      invoice.amountPaid?.toString() ?? "0") ??
                                  0))
                          .toStringAsFixed(2)),
                  CardRow(
                      title: ' التجديد السنوي',
                      value: invoice.renewYear.toString()),
                  CardRow(
                      title: ' طريقة الدفع',
                      value:
                          invoice.typePay.toString() == '0' ? 'نقدا' : 'تحويل'),
                  //nameuserApprove

                  CardRow(
                      title: ' العملة',
                      value: invoice.currency_name == null
                          ? 'SAR'
                          : invoice.currency_name.toString() == '0'
                              ? 'USD'
                              : 'SAR'),

                  invoice.nameuserApprove != null
                      ? CardRow(
                          title: 'معتمد الفاتورة',
                          value:
                              getnameshort(invoice.nameuserApprove.toString()))
                      : Container(),

                  invoice.nameuserApprove != null
                      ? CardRow(
                          title: 'تاريخ اعتماد الفاتورة',
                          value: invoice.date_approve.toString())
                      : Container(),
                  invoice.date_lastuserupdate != null
                      ? CardRow(
                          title: 'تاريخ آخر تعديل',
                          value: invoice.date_lastuserupdate != null
                              ? invoice.date_lastuserupdate.toString()
                              : '')
                      : Container(),
                  invoice.date_lastuserupdate != null
                      ? CardRow(
                          title: 'آخر تعديل من قبل',
                          value: invoice.date_lastuserupdate != null
                              ? getnameshort(
                                  invoice.lastuserupdateName.toString())
                              : '')
                      : Container(),

                  invoice.date_change_back != null
                      ? CardRow(
                          title: 'تاريخ الإنسحاب',
                          value: invoice.date_change_back.toString())
                      : Container(),
                  invoice.date_change_back != null
                      ? CardRow(
                          title: 'تم الإنسحاب عن طريق',
                          value: getnameshort(invoice.nameuserback.toString()))
                      : Container(),
                  invoice.fkuser_back != null
                      ? CardRow(
                          title: 'المبلغ المسترجع',
                          value: invoice.value_back.toString())
                      : Container(),
                  invoice.fkuser_back != null
                      ? CardRow(
                          title: 'سبب الإنسحاب',
                          value: invoice.desc_reason_back.toString(),
                          isExpanded: true,
                        )
                      : Container(),
                  invoice.numbarnch.toString().trim().isNotEmpty &&
                          invoice.numbarnch != null
                      ? CardRow(
                          title: 'عدد الفروع',
                          value: invoice.numbarnch.toString())
                      : Container(),
                  //invoice!.nummostda != null||
                  invoice.nummostda.toString().trim().isNotEmpty &&
                          invoice.nummostda != null
                      ? CardRow(
                          title: 'عدد المستودعات ',
                          value: invoice.nummostda.toString())
                      : Container(),
                  invoice.numusers.toString().trim().isNotEmpty &&
                          invoice.numusers != null
                      ? CardRow(
                          title: 'عدد المستخدمين',
                          value: invoice.numusers.toString())
                      : Container(),
                  invoice.address_invoice.toString() == ''
                      ? CardRow(
                          title: 'عنوان الفاتورة',
                          value: invoice.address_invoice.toString())
                      : Container(),

                  context.read<PrivilegeCubit>().checkPrivilege('76') == true
                      ? invoice.clientusername != null &&
                              invoice.clientusername.toString().isNotEmpty
                          ? CardRow(
                              title: 'يوزر العميل',
                              value: invoice.clientusername == null
                                  ? ''
                                  : invoice.clientusername.toString())
                          : Container()
                      : Container(),

                  invoice.imagelogo != null &&
                          invoice.imagelogo.toString().isNotEmpty
                      ? widgetlogo(
                          title: 'شعار المؤسسة',
                          value: invoice.imagelogo.toString())
                      : Container(),

                  invoice.participal != null
                      ? Column(
                          children: [
                            CardRow(
                                value: invoice.participal!.name_participate
                                    .toString(),
                                title: 'اسم المتعاون'),
                            CardRow(
                                value: invoice.rate_participate.toString(),
                                title: 'نسبة المتعاون'),
                            CardRow(
                                value: invoice
                                    .participal!.numberbank_participate
                                    .toString(),
                                title: 'رقم بنك المتعاون'),
                            CardRow(
                                value: invoice.participal!.mobile_participate
                                    .toString(),
                                title: 'رقم موبايل المتعاون'),
                          ],
                        )
                      : Container(),
                  invoice.agent_distibutor != null
                      ? Column(
                          children: [
                            CardRow(
                                value: invoice.agent_distibutor!.nameAgent
                                    .toString(),
                                title:
                                    invoice.agent_distibutor!.typeAgent == '1'
                                        ? 'اسم الوكيل'
                                        : 'اسم الموزع'),
                            if (invoice.rate_participate != null)
                              CardRow(
                                  value: invoice.rate_participate.toString(),
                                  title:
                                      invoice.agent_distibutor!.typeAgent == '1'
                                          ? 'نسبة الوكيل'
                                          : 'نسبة الموزع'),
                            CardRow(
                                value: invoice.agent_distibutor!.mobileAgent
                                    .toString(),
                                title:
                                    invoice.agent_distibutor!.typeAgent == '1'
                                        ? 'رقم موبايل الوكيل'
                                        : 'رقم موبايل الموزع'),
                          ],
                        )
                      : Container(),

                  if (invoice.participal == null &&
                      invoice.agent_distibutor == null &&
                      invoice.type_seller == "3")
                    CardRow(value: "موظف", title: "نوع البائع"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
