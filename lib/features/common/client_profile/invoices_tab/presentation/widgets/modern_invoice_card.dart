import 'package:crm_smart/core/common/enums/withdrawal_status_enum.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/sales/invoices_list/presentation/widgets/invoice_status_widget.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';

import 'package:crm_smart/ui/screen/invoice/add_payement.dart';
import 'package:crm_smart/ui/screen/invoice/edit_invoice.dart';
import 'package:crm_smart/ui/screen/invoice/reject_dialog.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../../features/sales/deleted_invoices/presentation/pages/deleted_invoice_details_page.dart';
import '../../../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../../../features/mangement/manage_withdrawals/presentation/pages/withdrawn_details_page.dart';
import '../../../../../../features/app/presentation/widgets/app_text.dart';

import '../../../../../../view_model/invoice_vm.dart';

class ModernInvoiceCard extends StatelessWidget {
  final InvoiceModel invoice;
  final String type;
  final String routeName;
  final Widget? transferWidget;
  final Widget? commissionWidget;
  final bool isFromWithdrawalsInvoicesList;
  final intl.NumberFormat formatter = intl.NumberFormat("#,##0.00", "ar_SA");

  ModernInvoiceCard({
    Key? key,
    required this.invoice,
    required this.type,
    required this.routeName,
    this.transferWidget,
    this.commissionWidget,
    this.isFromWithdrawalsInvoicesList = false,
  }) : super(key: key);

  double _parseAmount(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value.replaceAll(RegExp(r'[^\d.]'), ''));
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final total = _parseAmount(invoice.total);
    final amountPaid = _parseAmount(invoice.amountPaid);
    final remaining = total - amountPaid;
    final renewYear = _parseAmount(invoice.renewYear);
    final privilegeCubit = context.read<PrivilegesCubit>();
    final invoiceVm = context.read<InvoiceVm>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 4,
                    decoration: BoxDecoration(
                      color: _getStatusColor(),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: InkWell(
                        onTap: () => _handleCardTap(context),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      AppText(
                                        'فاتورة #${invoice.idInvoice}',
                                        style: TextStyle(
                                          fontSize: 14.scaleFontSize,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.fontFamily1,
                                        ),
                                      ),
                                      SizedBox(width: 30.scaleWidth),
                                      prepareStatusWidget(
                                        isDeleted: invoice.isDeleted,
                                        isApprove: invoice.isApprove,
                                        stateclient: invoice.stateclient,
                                        isApproveBackDone: (invoice
                                                    .approveBackDone !=
                                                null)
                                            ? int.parse(
                                                    invoice.approveBackDone!) ==
                                                0
                                            : null,
                                      ),
                                    ],
                                  ),
                                  PopupMenuButton<String>(
                                    icon: Icon(Icons.more_vert),
                                    onSelected: (value) async {
                                      switch (value) {
                                        // case 'edit':
                                        //   if (invoice.fkIdClient != null) {
                                        //     AppNavigator.go(
                                        //       AddInvoice(
                                        //         invoice: invoice,
                                        //         itemClient: invoice.fkIdClient!,
                                        //       ),
                                        //       isNew: false,
                                        //     );
                                        //   }
                                        //   break;
                                        // case 'actions':
                                        //   if (invoice.fkIdClient != null) {
                                        //     if (invoice.stateclient !=
                                        //         StatusClient
                                        //             .restrictWithdrawn.text) {
                                        //       _showConvertToRestrictWithdrawDialog(
                                        //           context, invoice);
                                        //     } else {
                                        //       showDialog<void>(
                                        //         context: context,
                                        //         builder: (context) {
                                        //           return RejectDialog(
                                        //             invoice: invoice,
                                        //             clientModel:
                                        //            invoice.fkIdClient!,
                                        //           );
                                        //         },
                                        //       );
                                        //     }
                                        //   }
                                        //   break;
                                        case 'delete':
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
                                                      invoiceVm.deleteInvoice(
                                                          invoice.idInvoice!);
                                                      AppNavigator.pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          break;
                                        case 'add_payment':
                                          AppNavigator.go(
                                            AddPayement(
                                              invoiceModel: invoice,
                                            ),
                                            isNew: false,
                                          );
                                          break;
                                        case 'change_details':
                                          AppNavigator.go(
                                            EditInvoice(
                                              key: UniqueKey(),
                                              invoiceModel: invoice,
                                            ),
                                            isNew: false,
                                          );
                                          break;
                                      }
                                    },
                                    itemBuilder: (BuildContext context) {
                                      List<PopupMenuItem<String>> items = [];

                                      // if (privilegeCubit
                                      //             .checkPrivilege('141') &&
                                      //         invoice.isApprove == null ||
                                      //     privilegeCubit.checkPrivilege('31') ==
                                      //             true &&
                                      //         invoice.isApprove != null) {
                                      //   items.add(
                                      //     PopupMenuItem<String>(
                                      //       value: 'edit',
                                      //       child: Row(
                                      //         children: [
                                      //           Icon(Icons.edit),
                                      //           SizedBox(width: 8),
                                      //           AppText('تعديل الفاتورة'),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   );
                                      // }

                                      // if (privilegeCubit.checkPrivilege('41')) {
                                      //   items.add(
                                      //     PopupMenuItem<String>(
                                      //       value: 'actions',
                                      //       child: Row(
                                      //         children: [
                                      //           Icon(Icons.settings),
                                      //           SizedBox(width: 8),
                                      //           AppText('الاجراءات'),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   );
                                      // }

                                      if (privilegeCubit.checkPrivilege('32')) {
                                        items.add(
                                          PopupMenuItem<String>(
                                            value: 'delete',
                                            child: Row(
                                              children: [
                                                Icon(Icons.delete,
                                                    color: Colors.red),
                                                SizedBox(width: 8),
                                                AppText('حذف الفاتورة',
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                              ],
                                            ),
                                          ),
                                        );
                                      }

                                      if (privilegeCubit
                                              .checkPrivilege('116') ||
                                          (privilegeCubit
                                                  .checkPrivilege('189') &&
                                              invoice.isdoneinstall == null)) {
                                        items.add(
                                          PopupMenuItem<String>(
                                            value: 'add_payment',
                                            child: Row(
                                              children: [
                                                Icon(Icons.payment),
                                                SizedBox(width: 8),
                                                AppText('اضافة دفعة للفاتورة'),
                                              ],
                                            ),
                                          ),
                                        );
                                      }

                                      if (privilegeCubit
                                              .checkPrivilege('115') ||
                                          (privilegeCubit
                                                  .checkPrivilege('182') &&
                                              invoice.isApprove == null)) {
                                        items.add(
                                          PopupMenuItem<String>(
                                            value: 'change_details',
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit_note),
                                                SizedBox(width: 8),
                                                AppText(
                                                    'تغيير بيانات الفاتورة'),
                                              ],
                                            ),
                                          ),
                                        );
                                      }

                                      return items;
                                    },
                                  ),
                                ],
                              ),
                              if (invoice.address_invoice != null &&
                                  invoice.address_invoice!.isNotEmpty) ...[
                                SizedBox(height: 8),
                                AppText(
                                  invoice.address_invoice!,
                                  style: TextStyle(
                                    fontSize: 14.scaleFontSize,
                                    color: Colors.grey[600],
                                    fontFamily: AppFonts.fontFamily1,
                                  ),
                                ),
                              ],
                              SizedBox(height: 12),
                              _buildInfoRow(
                                'المؤسسة:',
                                invoice.name_enterprise ?? '',
                                Icons.business,
                              ),
                              SizedBox(height: 8),
                              _buildInfoRow(
                                'التاريخ:',
                                invoice.date_approve ?? '',
                                Icons.calendar_today,
                              ),
                              SizedBox(height: 8),
                              _buildInfoRow(
                                'الفرع:',
                                invoice.name_regoin_invoice ?? '',
                                Icons.location_on,
                              ),
                              SizedBox(height: 8),
                              _buildInfoRow(
                                'العملة:',
                                HelperFunctions.getCurrencyName(
                                    invoice.currency_name),
                                Icons.currency_exchange,
                              ),
                              Row(
                                children: [
                                  if (renewYear > 0)
                                    Expanded(
                                      child: _buildInfoRow(
                                        'التجديد السنوي:',
                                        formatter.format(renewYear),
                                        Icons.autorenew,
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 2),
                              Divider(),
                              SizedBox(height: 2),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _buildAmountInfo('الإجمالي', total),
                                          _buildAmountInfo(
                                              'المدفوع', amountPaid),
                                          _buildAmountInfo(
                                              'المتبقي', remaining),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    _buildPaymentStatusChip(total, amountPaid),
                                  ],
                                ),
                              ),
                              if (invoice.dateLastOperation?.isNotEmpty ??
                                  false) ...[
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      'تاريخ العملية',
                                      fontFamily: AppFonts.fontFamily1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.scaleFontSize,
                                    ),
                                    AppText(
                                      "(${intl.DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(invoice.dateLastOperation!))})",
                                      fontFamily: AppFonts.fontFamily1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.scaleFontSize,
                                    ),
                                  ],
                                ),
                              ],
                              if (invoice.lastOperation != null &&
                                  invoice.userDidOperation != null) ...[
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: AppText(
                                        "${invoice.lastOperation}  (${invoice.userDidOperation})",
                                        fontFamily: AppFonts.fontFamily1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.scaleFontSize,
                                      ),
                                    ),
                                    transferWidget ?? SizedBox.shrink(),
                                  ],
                                ),
                              ],
                              if (commissionWidget != null) commissionWidget!,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (invoice.approveBackDone != null &&
                isFromWithdrawalsInvoicesList)
              Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: WithdrawalStatus
                      .values[int.parse(invoice.approveBackDone!)].color,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
                      color: Colors.black87.withOpacity(0.2),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: AppText(
                    WithdrawalStatus
                        .values[int.parse(invoice.approveBackDone!)].name,
                    color: Colors.white,
                    fontFamily: AppFonts.fontFamily1,
                    fontSize: 16.scaleFontSize,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentStatusChip(double total, double amountPaid) {
    String label;
    Color color;

    if (invoice.isDeleted == true) {
      label = 'محذوف';
      color = Colors.red;
    } else if (invoice.stateclient == 'منسحب') {
      label = 'منسحب';
      color = Colors.orange;
    } else if (amountPaid == 0) {
      label = 'غير مدفوع';
      color = Colors.red;
    } else if (amountPaid < total) {
      label = 'مدفوع جزئياً';
      color = Colors.orange;
    } else {
      label = 'مدفوع';
      color = Colors.green;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12.scaleFontSize,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.fontFamily1,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.scaleFontSize,
            color: Colors.grey[600],
            fontFamily: AppFonts.fontFamily1,
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.scaleFontSize,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.fontFamily1,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAmountInfo(String label, double amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.scaleFontSize,
            color: Colors.grey[600],
            fontFamily: AppFonts.fontFamily1,
          ),
        ),
        SizedBox(height: 4),
        Text(
          formatter.format(amount),
          style: TextStyle(
            fontSize: 14.scaleFontSize,
            fontWeight: FontWeight.bold,
            color: label == 'المتبقي' && amount > 0 ? Colors.red : null,
            fontFamily: AppFonts.fontFamily1,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor() {
    if (invoice.isDeleted == true) {
      return Colors.red;
    }
    if (invoice.stateclient == 'منسحب') {
      return Colors.orange;
    }
    if (invoice.isApprove == '1' &&
        invoice.stateclient == StatusClient.subscriber.text) {
      return StatusClient.subscriber.color;
    }
    if (invoice.isApprove != '1' &&
        invoice.stateclient == StatusClient.unsupported.text) {
      return StatusClient.unsupported.color;
    }
    if (invoice.stateclient == StatusClient.withdrawn.text) {
      return StatusClient.withdrawn.color;
    }
    if (invoice.stateclient == StatusClient.restrictWithdrawn.text) {
      return StatusClient.restrictWithdrawn.color;
    }
    // if (invoice.amountPaid == null || invoice.amountPaid == 0) {
    //   return Colors.red;
    // }
    // if (_parseAmount(invoice.amountPaid) < _parseAmount(invoice.total)) {
    //   return Colors.orange;
    // }
    return Colors.green;
  }

  Color _getWithdrawalStatusColor(String status) {
    switch (int.parse(status)) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.green;
      case 2:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getWithdrawalStatusText(String status) {
    switch (int.parse(status)) {
      case 0:
        return 'قيد الانتظار';
      case 1:
        return 'تمت الموافقة';
      case 2:
        return 'مرفوض';
      default:
        return '';
    }
  }

  void _handleCardTap(BuildContext context) {
    if (invoice.isDeleted == true) {
      AppNavigator.push(
        DeletedInvoiceDetailsPage(invoice: invoice),
        extra: {'invoice': invoice},
        name: AppRoutesNames.invoices.deletedInvoiceDetailsPage,
      );
      return;
    }

    Widget page;
    if (invoice.stateclient == StatusClient.withdrawn.text) {
      page = WithdrawnDetailsPage(invoice: invoice);
    } else if (type == 'profile') {
      page = ClientProfile(
        tabIndex: 1,
        idClient: invoice.fkIdClient.toString(),
      );
    } else if (type == 'withdrawn') {
      page = WithdrawnDetailsPage(invoice: invoice);
    } else {
      page = InvoiceView(
        invoice: invoice,
        invoiceId: invoice.idInvoice!,
      );
    }

    if (routeName.isNotEmpty) {
      AppNavigator.go(
        page,
        name: routeName,
        pathParameters: {
          'idClient': invoice.fkIdClient.toString(),
          'invoiceId': invoice.idInvoice.toString(),
        },
        extra: {
          'tabIndex': 1,
          'invoice': invoice,
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }
  }

  void _showConvertToRestrictWithdrawDialog(
      BuildContext context, InvoiceModel invoice) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppText('تأكيد'),
          content: AppText('هل تريد تحويل العميل الى منسحب مقيد؟'),
          actions: [
            AppTextButton(
              onPressed: () => AppNavigator.pop(),
              child: AppText('لا'),
            ),
            AppTextButton(
              onPressed: () {
                AppNavigator.pop();
                // Add your logic for converting to restrict withdraw here
              },
              child: AppText('نعم'),
            ),
          ],
        );
      },
    );
  }
}
