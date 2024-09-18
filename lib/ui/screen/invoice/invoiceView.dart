import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/client/type_client_enum.dart';
import '../../../core/common/enums/devices_state_enum.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/app/presentation/widgets/app_text_button.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/client_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../widgets/custom_widget/card_row.dart';
import '../../widgets/widgetlogo.dart';
import 'addInvoice.dart';
import 'add_payement.dart';
import 'edit_invoice.dart';
import 'invoice_file_gallery_page.dart';
import 'prepare_button.dart';
import 'reject_dialog.dart';

class InvoiceView extends StatefulWidget {
  InvoiceView({
    super.key,
    this.invoice,
    required this.invoiceId,
    this.type,
    this.showActions = true,
    this.clientModel,
  });

  final InvoiceModel? invoice;
  final String invoiceId;
  String? type;
  bool showActions;
  final ClientModel? clientModel;

  @override
  State<StatefulWidget> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  ClientModel? client;
  late PrivilegesCubit _privilegeCubit;
  late final InvoiceVm _invoiceVm;
  late final InvoicesSectionCubit _invoicesCubit;

  InvoiceModel get invoiceModel =>
      widget.invoice ?? _invoicesCubit.currentInvoice!;

  @override
  void initState() {
    _invoicesCubit = context.read<InvoicesSectionCubit>();
    _privilegeCubit = context.read<PrivilegesCubit>();
    _invoiceVm = context.read<InvoiceVm>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.invoice == null) {
        await _invoicesCubit.getInvoiceById(widget.invoiceId);
      } else {
        _invoicesCubit.setSuccessState();
      }
      _invoiceVm.setCurrentInvoice(invoiceModel);
      if (widget.clientModel != null) {
        client = widget.clientModel;
        return;
      }
      await Provider.of<ClientProvider>(context, listen: false).getClientById(
          invoiceModel.fkIdClient.toString(), (value) => client = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: widget.type == 'approved' ? null : CustomAppBar(),
      body: BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
        builder: (context, state) {
          return state.getInvoiceByIdStatus.when(
            success: (data) {
              return Padding(
                padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Directionality(
                  textDirection: myui.TextDirection.rtl,
                  child: Consumer<InvoiceVm>(builder: (context, value, child) {
                    final invoice = value.currentInvoice;

                    return Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AddManualTaskButton(
                              list: invoicePublicTypeList,
                              invoiceId: invoiceModel.idInvoice!,
                            ),
                            _product('اسم المنتج', 'الكمية', 'السعر'),

                            for (ProductsInvoice product in invoice!.products!)
                              _product(
                                product.nameProduct.toString(),
                                product.amount.toString(),
                                product.price.toString(),
                              ),

                            Container(
                              color: Colors.amberAccent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    'المبلغ الإجمالي   ',
                                    fontFamily: AppFonts.fontFamily3,
                                  ),
                                  //Spacer(),
                                  AppText(invoice.total),
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

                            invoice.invoice_source != null
                                ? CardRow(
                                    title: 'مصدر الفاتورة',
                                    value: invoice.invoice_source!.toString())
                                : Container(),

                            CardRow(
                                title: 'اسم الموظف',
                                value: invoice.nameUser.toString()),
                            CardRow(
                                title: 'فرع الموظف',
                                value: invoice.name_regoin_invoice.toString()),

                            CardRow(
                              title: 'تاريخ عقد الإشتراك',
                              value: invoice.date_approve,
                            ),

                            CardRow(
                                title: 'المبلغ المدفوع',
                                value: invoice.amountPaid.toString()),
                            CardRow(
                                title: ' المبلغ المتبقي',
                                value: ((num.tryParse(
                                                invoice.total?.toString() ??
                                                    "0") ??
                                            0) -
                                        (num.tryParse(invoice.amountPaid
                                                    ?.toString() ??
                                                "0") ??
                                            0))
                                    .toStringAsFixed(2)),

                            invoice.renewYear != '0' &&
                                    invoice.renewYear != null
                                ? CardRow(
                                    title: ' التجديد السنوي',
                                    value: invoice.renewYear.toString())
                                : Container(),
                            invoice.renew2year != '0' &&
                                    invoice.renew2year != null
                                ? CardRow(
                                    title: 'تجديد الموارد البشرية',
                                    value: invoice.renew2year.toString())
                                : Container(),

                            invoice.renewPlus.toString() == '' ||
                                    invoice.renewPlus == null
                                ? Container()
                                : CardRow(
                                    title: 'تجديد الفرع الإضافي',
                                    value: invoice.renewPlus.toString()),

                            invoice.typeInstallation.toString() == '' ||
                                    invoice.typeInstallation == null ||
                                    invoice.typeInstallation.toString() ==
                                        'null'
                                ? Container()
                                : CardRow(
                                    title: 'نوع التركيب',
                                    value:
                                        invoice.typeInstallation.toString() ==
                                                '0'
                                            ? 'ميداني'
                                            : (invoice.typeInstallation
                                                        .toString() ==
                                                    '2'
                                                ? 'عميل موصى به'
                                                : 'اونلاين'),
                                  ),

                            CardRow(
                                title: ' طريقة الدفع',
                                value: invoice.typePay.toString() == '0'
                                    ? 'نقدا'
                                    : 'تحويل'),
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
                                    value: (invoice.nameuserApprove.toString()))
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
                                        ? (invoice.lastuserupdateName
                                            .toString())
                                        : '')
                                : Container(),

                            if (invoice.stateclient ==
                                TypeClientEnum.withdrawn.value) ...[
                              invoice.date_change_back != null
                                  ? CardRow(
                                      title: 'تاريخ الإنسحاب',
                                      value:
                                          invoice.date_change_back.toString())
                                  : Container(),
                              invoice.date_change_back != null
                                  ? CardRow(
                                      title: 'تم الإنسحاب عن طريق',
                                      value: (invoice.nameuserback.toString()))
                                  : Container(),
                              invoice.fkuser_back != null
                                  ? CardRow(
                                      title: 'المبلغ المسترجع',
                                      value: invoice.value_back.toString())
                                  : Container(),
                              invoice.fkuser_back != null
                                  ? CardRow(
                                      title: 'سبب الإنسحاب',
                                      value:
                                          invoice.desc_reason_back.toString(),
                                      isExpanded: true,
                                    )
                                  : Container(),
                            ],

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

                            _privilegeCubit.checkPrivilege('76')
                                ? invoice.clientusername != null &&
                                        invoice.clientusername
                                            .toString()
                                            .isNotEmpty
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
                                          value: invoice
                                              .participal!.name_participate
                                              .toString(),
                                          title: 'اسم المتعاون'),
                                      CardRow(
                                          value: invoice.rate_participate
                                              .toString(),
                                          title: 'نسبة المتعاون'),
                                      CardRow(
                                          value: invoice.participal!
                                              .numberbank_participate
                                              .toString(),
                                          title: 'رقم بنك المتعاون'),
                                      CardRow(
                                          value: invoice
                                              .participal!.mobile_participate
                                              .toString(),
                                          title: 'رقم موبايل المتعاون'),
                                    ],
                                  )
                                : Container(),
                            invoice.agent_distibutor != null
                                ? Column(
                                    children: [
                                      CardRow(
                                          value: invoice
                                              .agent_distibutor!.nameAgent
                                              .toString(),
                                          title: invoice.agent_distibutor!
                                                      .typeAgent ==
                                                  '1'
                                              ? 'اسم الوكيل'
                                              : 'اسم الموزع'),
                                      if (invoice.rate_participate != null)
                                        CardRow(
                                            value: invoice.rate_participate
                                                .toString(),
                                            title: invoice.agent_distibutor!
                                                        .typeAgent ==
                                                    '1'
                                                ? 'نسبة الوكيل'
                                                : 'نسبة الموزع'),
                                      CardRow(
                                          value: invoice
                                              .agent_distibutor!.mobileAgent
                                              .toString(),
                                          title: invoice.agent_distibutor!
                                                      .typeAgent ==
                                                  '1'
                                              ? 'رقم موبايل الوكيل'
                                              : 'رقم موبايل الموزع'),
                                    ],
                                  )
                                : Container(),

                            if (invoice.participal == null &&
                                invoice.agent_distibutor == null &&
                                invoice.type_seller == "3")
                              CardRow(value: "موظف", title: "نوع البائع"),

                            if (widget.showActions) ...{
                              Consumer<InvoiceVm>(
                                builder: (context, value, child) {
                                  if (_isAllowedToChangeDeviceState()) {
                                    return PrepareButton();
                                  }
                                  return SizedBox.shrink();
                                },
                              ),
                              5.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _privilegeCubit.checkPrivilege('141') &&
                                              invoice.isApprove == null ||
                                          _privilegeCubit
                                                      .checkPrivilege('31') ==
                                                  true &&
                                              invoice.isApprove != null
                                      ? Expanded(
                                          child: AppElevatedButton(
                                            text: 'تعديل الفاتورة',
                                            onPressed: () async {
                                              if (client != null)
                                                AppNavigator.go(
                                                  AddInvoice(
                                                    invoice: invoice,
                                                    itemClient: client!,
                                                  ),
                                                  isNew: false,
                                                );
                                            },
                                          ),
                                        )
                                      : Container(),
                                  // widget.type == 'approved'

                                  if (_privilegeCubit.checkPrivilege('41') &&
                                      invoice.isApprove != null) ...{
                                    5.width,
                                    Expanded(
                                      child: AppElevatedButton(
                                        text: 'الاجراءات',
                                        onPressed: () async {
                                          if (client != null)
                                            showDialog<void>(
                                              context: context,
                                              builder: (context) {
                                                return RejectDialog(
                                                  invoice: invoice,
                                                  clientModel: client!,
                                                );
                                              },
                                            );
                                        },
                                      ),
                                    ),
                                  },
                                  if (_privilegeCubit.checkPrivilege('32')) ...{
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: AppElevatedButton(
                                          text: 'حذف الفاتورة',
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: AppText('التأكيد'),
                                                  content: AppText(
                                                      'هل تريد حذف الفاتورة'),
                                                  actions: <Widget>[
                                                    AppTextButton(
                                                      onPressed: () =>
                                                          AppNavigator.pop(),
                                                      child: AppText('لا'),
                                                    ),
                                                    AppTextButton(
                                                      child: AppText('نعم'),
                                                      onPressed: () async {
                                                        AppNavigator.pop();
                                                        _invoiceVm.deleteInvoice(
                                                            invoice.idInvoice!);
                                                        AppNavigator.pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }),
                                    ),
                                  },
                                ],
                              ),
                              5.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_privilegeCubit.checkPrivilege('116') ||
                                      (_privilegeCubit.checkPrivilege('189') &&
                                          invoice.isdoneinstall == null))
                                    Expanded(
                                      child: AppElevatedButton(
                                        text: 'اضافة دفعة للفاتورة',
                                        onPressed: () async {
                                          AppNavigator.go(
                                            AddPayement(
                                              invoiceModel: invoice,
                                            ),
                                            isNew: false,
                                          );
                                        },
                                      ),
                                    ),
                                  if (_privilegeCubit.checkPrivilege('115') ||
                                      (_privilegeCubit.checkPrivilege('182') &&
                                          invoice.isApprove == null)) ...{
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: AppElevatedButton(
                                        text: 'تغيير بيانات الفاتورة',
                                        onPressed: () async {
                                          AppNavigator.go(
                                            EditInvoice(
                                              invoiceModel: invoice,
                                            ),
                                            isNew: false,
                                          );
                                        },
                                      ),
                                    ),
                                  },
                                ],
                              ),
                              5.height,
                              if (widget.type == 'approved') ...[
                                if (invoice.isApprove == null)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: AppElevatedButton(
                                          text: 'Approve',
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return ModalProgressHUD(
                                                  inAsyncCall:
                                                      Provider.of<InvoiceVm>(
                                                              context)
                                                          .isapproved,
                                                  child: AlertDialog(
                                                    content: AppText(
                                                        'تأكيد العملية'),
                                                    actions: <Widget>[
                                                      AppElevatedButton(
                                                        text: 'لا',
                                                        onPressed: () {
                                                          AppNavigator.pop(
                                                              result: false);
                                                        },
                                                      ),
                                                      AppElevatedButton(
                                                        text: 'نعم',
                                                        onPressed: () async {
                                                          _setApproveClient(
                                                            context: context,
                                                            invoice: invoice,
                                                            isApprove: '1',
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      5.width,
                                      Expanded(
                                        child: AppElevatedButton(
                                          text: 'Refuse',
                                          backgroundColor: Colors.redAccent,
                                          onPressed: () async {
                                            _setApproveClient(
                                              context: context,
                                              invoice: invoice,
                                              isApprove: '0',
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                              5.height,
                              AppElevatedButton(
                                width: double.infinity,
                                text: 'مرفقات الفاتورة',
                                icon: Icons.file_present_rounded,
                                onPressed: () {
                                  AppNavigator.go(
                                    InvoiceFileGalleryPage(),
                                    isNew: false,
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                            },
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
            failure: (error, data) {
              return AppErrorWidget(
                message: error,
                onPressed: () {
                  _invoicesCubit.getInvoiceById(widget.invoiceId);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _product(String name, String amount, String price) {
    return Column(
      children: [
        Row(
          children: [
            //Expanded flex 1
            Expanded(
              flex: 1,
              child: AppText(name),
            ),
            // Spacer(),
            AppText(amount),
            10.width,
            AppText(price),
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  bool _isAllowedToChangeDeviceState() {
    return _privilegeCubit.checkPrivilege('191') &&
        _invoiceVm.currentInvoice!.hasDevices == true &&
        DevicesStateEnum.isSalesTeam(_invoiceVm.currentInvoice!.deviceState);
  }

  void _setApproveClient({
    required BuildContext context,
    required InvoiceModel invoice,
    required String isApprove,
  }) {
    _invoiceVm.setApproveclient_vm({
      "isApprove": isApprove,
    }, invoice.idInvoice).then((value) {
      return value != false ? clear() : error();
    });
  }

  clear() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }

  error() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }
}
