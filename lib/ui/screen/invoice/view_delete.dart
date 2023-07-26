import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/privilge_vm.dart';
import '../../widgets/custom_widget/RowWidget.dart';
import '../../widgets/widgetlogo.dart';

class view_deleted extends StatelessWidget {


    view_deleted({Key? key,required this.invoice}) : super(key: key);
    InvoiceModel invoice;

    Widget _product(String name,String amount, String price) {
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
        body:
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(invoice.products?.isNotEmpty ?? false)
                  _product('اسم المنتج','الكمية','السعر'),
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

                  cardRow(title: 'اسم العميل', value: invoice.nameClient.toString()),
                  cardRow(title: 'اسم المؤسسة', value: invoice.name_enterprise.toString()),
                  cardRow(title: 'حالة الفاتورة', value: invoice.stateclient.toString()),
                  cardRow(title: 'فرع الفاتورة', value: invoice.name_regoin_invoice.toString()),

                  cardRow(title: 'اسم الموظف', value: invoice.nameUser.toString()),
                  cardRow(title: 'فرع الموظف', value: invoice.name_regoin.toString()),
                  //cardRow(title: 'حالة الفاتورة', value: invoice.amountPaid.toString()),

                  invoice.date_approve.toString() == null
                      ? cardRow(title: 'تاريخ عقد الإشتراك', value: invoice.date_approve.toString())
                      : Container(),

                  cardRow(title: 'المبلغ المدفوع', value: invoice.amountPaid.toString()),
                  cardRow(
                      title: ' المبلغ المتبقي',
                      value: ((num.tryParse(invoice.total?.toString() ?? "0") ?? 0) - (num.tryParse(invoice.amountPaid?.toString() ?? "0") ?? 0))
                          .toStringAsFixed(2)),
                  cardRow(title: ' التجديد السنوي', value: invoice.renewYear.toString()),
                  cardRow(title: ' طريقة الدفع', value: invoice.typePay.toString() == '0' ? 'نقدا' : 'تحويل'),
                  //nameuserApprove

                  cardRow(title: ' العملة',
                      value:invoice.currency_name==null? 'SAR':
                      invoice.currency_name.toString() == '0' ? 'USD' : 'SAR'),

                  invoice.nameuserApprove != null
                      ? cardRow(title: 'معتمد الفاتورة', value: getnameshort(invoice.nameuserApprove.toString()))
                      : Container(),

                  invoice.nameuserApprove != null
                      ? cardRow(title: 'تاريخ اعتماد الفاتورة', value: invoice.date_approve.toString())
                      : Container(),
                  invoice.date_lastuserupdate != null
                      ? cardRow(
                      title: 'تاريخ آخر تعديل',
                      value: invoice.date_lastuserupdate != null ? invoice.date_lastuserupdate.toString() : '')
                      : Container(),
                  invoice.date_lastuserupdate != null
                      ? cardRow(
                      title: 'آخر تعديل من قبل',
                      value: invoice.date_lastuserupdate != null
                          ? getnameshort(invoice.lastuserupdateName.toString())
                          : '')
                      : Container(),

                  invoice.date_change_back != null
                      ? cardRow(title: 'تاريخ الإنسحاب', value: invoice.date_change_back.toString())
                      : Container(),
                  invoice.date_change_back != null
                      ? cardRow(title: 'تم الإنسحاب عن طريق', value: getnameshort(invoice.nameuserback.toString()))
                      : Container(),
                  invoice.fkuser_back != null
                      ? cardRow(title: 'المبلغ المسترجع', value: invoice.value_back.toString())
                      : Container(),
                  invoice.fkuser_back != null
                      ? cardRow(
                    title: 'سبب الإنسحاب',
                    value: invoice.desc_reason_back.toString(),
                    isExpanded: true,
                  )
                      : Container(),
                  invoice.numbarnch.toString().trim().isNotEmpty && invoice.numbarnch != null
                      ? cardRow(title: 'عدد الفروع', value: invoice.numbarnch.toString())
                      : Container(),
                  //invoice!.nummostda != null||
                  invoice.nummostda.toString().trim().isNotEmpty && invoice.nummostda != null
                      ? cardRow(title: 'عدد المستودعات ', value: invoice.nummostda.toString())
                      : Container(),
                  invoice.numusers.toString().trim().isNotEmpty && invoice.numusers != null
                      ? cardRow(title: 'عدد المستخدمين', value: invoice.numusers.toString())
                      : Container(),
                  invoice.address_invoice.toString() == ''
                      ? cardRow(title: 'عنوان الفاتورة', value: invoice.address_invoice.toString())
                      : Container(),

                  Provider.of<privilge_vm>(context, listen: true).checkprivlge('76') == true
                      ? invoice.clientusername != null && invoice.clientusername.toString().isNotEmpty
                      ? cardRow(
                      title: 'يوزر العميل',
                      value: invoice.clientusername == null ? '' : invoice.clientusername.toString())
                      : Container()
                      : Container(),

                  invoice.imagelogo != null && invoice.imagelogo.toString().isNotEmpty
                      ? widgetlogo(title: 'شعار المؤسسة', value: invoice.imagelogo.toString())
                      : Container(),

                  invoice.participal != null
                      ? Column(
                    children: [
                      cardRow(value: invoice.participal!.name_participate.toString(), title: 'اسم المتعاون'),
                      cardRow(value: invoice.rate_participate.toString(), title: 'نسبة المتعاون'),
                      cardRow(
                          value: invoice.participal!.numberbank_participate.toString(),
                          title: 'رقم بنك المتعاون'),
                      cardRow(
                          value: invoice.participal!.mobile_participate.toString(),
                          title: 'رقم موبايل المتعاون'),
                    ],
                  )
                      : Container(),
                  invoice.agent_distibutor != null
                      ? Column(
                    children: [
                      cardRow(
                          value: invoice.agent_distibutor!.nameAgent.toString(),
                          title: invoice.agent_distibutor!.typeAgent == '1' ? 'اسم الوكيل' : 'اسم الموزع'),

                      if(invoice.rate_participate != null)
                        cardRow(
                            value: invoice.rate_participate.toString(),
                            title: invoice.agent_distibutor!.typeAgent == '1' ? 'نسبة الوكيل' : 'نسبة الموزع'),
                      cardRow(
                          value: invoice.agent_distibutor!.mobileAgent.toString(),
                          title: invoice.agent_distibutor!.typeAgent == '1'
                              ? 'رقم موبايل الوكيل'
                              : 'رقم موبايل الموزع'),
                    ],
                  )
                      : Container(),

                  if(invoice.participal == null && invoice.agent_distibutor == null && invoice.type_seller == "3")
                    cardRow(
                        value: "موظف",
                        title: "نوع البائع"),

                ],
              ),
            ),
          ),
        ),
      );
    }
}
