import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../ui/widgets/custom_widget/card_row.dart';
import '../manager/clients_list_bloc.dart';

class ClientInfoDetails extends StatefulWidget {
  const ClientInfoDetails({super.key});

  @override
  State<ClientInfoDetails> createState() => _ClientInfoDetailsState();
}

class _ClientInfoDetailsState extends State<ClientInfoDetails> {
  late ClientModel client;
  late final ClientsListBloc _clientsListBloc;

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();
    client = _clientsListBloc.currentClient!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientsListBloc, ClientsListState>(
      listener: (context, state) {
        client = _clientsListBloc.currentClient!;
      },
      builder: (context, state) {
        print("client $client");
        return Column(
          children: [
            GestureDetector(
                onLongPress: () async {
                  await Clipboard.setData(
                          ClipboardData(text: client.serialNumber.toString()))
                      .then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "تم النسخ إلى الحافظة",
                            textDirection: TextDirection.rtl,
                          ))));
                },
                child: CardRow(
                    title: 'الرقم المرجعي',
                    value: client.serialNumber.toString())),
            CardRow(
                title: 'تاريخ الاضافة', value: client.dateCreate.toString()),
            CardRow(
              title: 'المؤسسة',
              value: client.nameEnterprise.toString(),
              isExpanded: true,
            ),
            CardRow(
              title: 'اسم العميل',
              value: client.nameClient.toString(),
              isExpanded: true,
            ),
            CardRow(title: ' الفرع', value: client.nameRegion.toString()),

            CardRow(
                title: ' نوع النشاط',
                value: client.activity_type_title?.toString() ?? "لا يوجد"),
            CardRow(
                title: 'حجم النشاط', value: client.size_activity.toString()),
            CardRow(title: 'البريد الالكتروني', value: client.email.toString()),

            CardRow(title: ' مدينة العميل', value: client.name_city.toString()),
            CardRow(title: ' المنطقة', value: client.namemaincity.toString()),

            CardRow(title: ' رقم آخر', value: client.phone.toString()),

            CardRow(title: 'حالة العميل', value: client.typeClient.toString()),
            client.typeClient == 'مستبعد'
                ? CardRow(
                    value: client.nameUserApproveRreject.toString(),
                    //nameuserdoning
                    title: 'قام بتحويل حالة العميل')
                : IgnorePointer(),

            client.typeClient == 'مستبعد'
                ? CardRow(
                    value: client.date_approve_reject.toString(),
                    //clientModel1.dateChangetype.toString(),
                    title: 'تاريخ تحويل حالة العميل')
                : IgnorePointer(),
            client.typeClient == 'مستبعد'
                ? CardRow(
                    value: client.reasonChange.toString(),
                    title: 'تفاصيل الاستبعاد')
                : IgnorePointer(),
            client.typeClient == 'مستبعد'
                ? CardRow(
                    value: client.NameReason_reject.toString(),
                    title: 'سبب الاستبعاد')
                : IgnorePointer(),

            client.typeClient == 'عرض سعر'
                ? CardRow(
                    title: 'مبلغ عرض السعر',
                    value: client.offer_price.toString())
                : IgnorePointer(),

            client.typeClient == 'عرض سعر'
                ? CardRow(
                    title: 'تاريخ عرض السعر',
                    value: client.date_price.toString())
                : IgnorePointer(),

            client.user_do != null
                ? CardRow(
                    title: 'الموظف الذي قام بتغيير حالة العميل',
                    value: client.nameuserdoning.toString())
                : IgnorePointer(),

            CardRow(
                title: 'الموظف الذي أضاف العميل',
                value: (client.nameAdduser.toString())),
            CardRow(title: 'الموظف', value: (client.nameUser.toString())),

            CardRow(title: 'رقم الموظف', value: client.mobileuser.toString()),

            if (client.nameTransferTo != null)
              // context.read<PrivilegeCubit>().checkPrivilege('150') ==
              //             true &&
              client.fkusertrasfer != null
                  ? CardRow(
                      title: 'قام بتحويل العميل',
                      value: (client.nameusertransfer.toString()))
                  : IgnorePointer()
            else
              client.fkusertrasfer != null
                  ? CardRow(
                      title: 'قام بتحويل العميل',
                      value: (client.nameusertransfer.toString()))
                  : IgnorePointer(),

            // context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
            (client.nameTransferTo != null) && client.fkusertrasfer != null
                ? CardRow(
                    title: 'تحويل العميل إلى',
                    value: client.nameTransferTo.toString())
                : IgnorePointer(),

            // context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
            (client.nameTransferTo == null) && client.fkusertrasfer != null
                ? CardRow(title: 'حالة التحويل', value: 'تم قبول التحويل')
                : IgnorePointer(),

            // context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
            (client.nameTransferTo != null) && client.fkusertrasfer != null
                ? CardRow(title: 'حالة التحويل', value: 'معلق')
                : IgnorePointer(),

            if (client.dateTransfer != null) ...[
              CardRow(
                  title: 'تاريخ التحويل',
                  value: client.dateTransfer.toString()),
            ],
            if (client.nameTransferTo != null) ...[
              CardRow(
                title: 'تم تحويل العميل إلى',
                value: client.nameTransferTo,
              ),
            ],

            client.location.toString() == ''
                ? IgnorePointer()
                : CardRow(title: ' الموقع', value: client.location.toString()),

            client.ismarketing == '1'
                ? CardRow(
                    title: ' عميل تسويق الكتروني',
                    value: client.ismarketing == '1' ? 'نعم' : '')
                : IgnorePointer(),
            client.type_record != null &&
                    client.type_record.toString().trim().isNotEmpty &&
                    client.type_record != ""
                ? CardRow(
                    title: 'نوع التسجيل', value: client.type_record.toString())
                : IgnorePointer(),

            client.type_classification != null &&
                    client.type_classification.toString().trim().isNotEmpty &&
                    client.type_classification != "null"
                ? CardRow(
                    title: 'نوع التصنيف',
                    value: client.type_classification.toString())
                : IgnorePointer(),
            client.reason_class != null &&
                    client.reason_class.toString().trim().isNotEmpty &&
                    client.reason_class != "null"
                ? CardRow(
                    title: 'سبب الإدخال', value: client.reason_class.toString())
                : IgnorePointer(),
            CardRow(
                title: 'عنوان العميل',
                value: client.address_client == null
                    ? ''
                    : client.address_client.toString()),

            client.presystem == null ||
                    client.presystem.toString().trim().isEmpty
                ? IgnorePointer()
                : CardRow(
                    title: 'نظام سابق',
                    value: client.presystemtitle == null
                        ? ''
                        : client.presystemtitle.toString()),

            CardRow(
                title: 'مصدر العميل',
                value: client.sourcclient == null
                    ? ''
                    : client.sourcclient.toString()),
            if (client.sourcclient == 'عميل موصى به')
              CardRow(
                  title: 'تمت التوصية من:',
                  value: client.NameClient_recomand == null
                      ? ''
                      : client.NameClient_recomand.toString()),

            client.NameReason_reject == null
                ? CardRow(
                    title: 'نوع النشاط',
                    value: client.activity_type_title.toString())
                : IgnorePointer(),

            client.NameReason_reject == null
                ? CardRow(
                    title: 'وصف النشاط',
                    value: client.descActivController.toString())
                : IgnorePointer(),
          ],
        );
      },
    );
  }
}
