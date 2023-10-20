import 'package:collection/collection.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/pages/withdrawn_details_page.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/utils/withdrawal_status.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../common/models/page_state/result_builder.dart';
import '../../../../constants.dart';
import '../../../../model/usermodel.dart';
import '../../../../ui/screen/client/profileclient.dart';
import '../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../data/models/invoice_withdrawal_series_model.dart';
import '../manager/manage_withdrawals_cubit.dart';

class WithdrawalInvoiceDetailsPage extends StatefulWidget {
  const WithdrawalInvoiceDetailsPage({Key? key, required this.invoice}) : super(key: key);

  final InvoiceModel invoice;

  @override
  State<WithdrawalInvoiceDetailsPage> createState() => _WithdrawalInvoiceDetailsPageState();
}

class _WithdrawalInvoiceDetailsPageState extends State<WithdrawalInvoiceDetailsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late UserModel currentUser;

  @override
  void initState() {
    _manageWithdrawalsCubit = GetIt.I<ManageWithdrawalsCubit>()..getWithdrawalInvoiceDetails(widget.invoice.idInvoice!);
    currentUser = context.read<user_vm_provider>().currentUser;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _manageWithdrawalsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: TextScroll(
            "${widget.invoice.name_enterprise}    ",
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
            delayBefore: Duration(milliseconds: 2000),
            pauseBetween: Duration(milliseconds: 1000),
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          centerTitle: true,
          backgroundColor: kMainColor,
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => InvoiceView(invoice: widget.invoice, showActions: false)),
                    );
                    break;
                  case 1:
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => ProfileClient(idClient: widget.invoice.fkIdClient)));
                    break;
                  case 2:
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => WithdrawnDetailsPage(invoice: widget.invoice)));
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(Icons.receipt_rounded, color: kMainColor),
                      Text("تفاصيل الفاتورة"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(Icons.person_2_rounded, color: kMainColor),
                      Text("بروفايل العميل"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(Icons.info, color: kMainColor),
                      Text("تفاصيل الانسحاب"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
          builder: (context, state) {
            return PageStateBuilder<List<InvoiceWithdrawalSeries>>(
              init: Center(child: CircularProgressIndicator()),
              success: (data) {
                final hasDecline = data.any((element) => element.withdrawalStatus.isDeclined);
                final firstPendingEmployee = data.firstWhereOrNull((element) => element.withdrawalStatus.isPending);

                final isShowingActionButtons = !hasDecline && firstPendingEmployee?.fkUser == currentUser.idUser;
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: REdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          itemBuilder: (BuildContext context, int index) => cardWithdrawalManagerStatus(data[index]),
                          separatorBuilder: (context, int index) => 15.verticalSpacingRadius,
                          itemCount: data.length,
                        ),
                      ),
                      20.verticalSpacingRadius,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          cardStatus(Colors.orange, "معلقة"),
                          cardStatus(Colors.red, "مرفوضة"),
                          cardStatus(Colors.green, "تمت الموافقة"),
                        ],
                      ),
                      20.verticalSpacingRadius,
                      if (isShowingActionButtons) ...{
                        if (state.setApproveSeriesState.isLoading())
                          Center(child: CircularProgressIndicator())
                        else
                          manageSeriesButtons(firstPendingEmployee!),
                        20.verticalSpacingRadius,
                      },
                    ],
                  ),
                );
              },
              loading: Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                child: IconButton(
                  onPressed: () => _manageWithdrawalsCubit.getWithdrawalInvoiceDetails(widget.invoice.idInvoice!),
                  icon: Icon(Icons.refresh_rounded),
                ),
              ),
              result: state.withdrawalInvoiceDetails,
              empty: Center(child: Text("No Withdrawals Invoices")),
            );
          },
        ),
      ),
    );
  }

  Widget cardWithdrawalManagerStatus(InvoiceWithdrawalSeries data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 17.r,
              backgroundColor: Colors.blueGrey,
              child: Text(data.priorityApprove!,
                  style: context.textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
            ),
            20.horizontalSpace,
            Container(
              child: Text(
                data.nameUser!,
                style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 7,
          backgroundColor: data.withdrawalStatus.color,
        ),
      ],
    );
  }

  Widget cardStatus(Color color, String text) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7).r,
            color: color,
          ),
          width: 45,
          height: 25,
        ),
        5.horizontalSpace,
        Text(text)
      ],
    );
  }

  Widget manageSeriesButtons(InvoiceWithdrawalSeries firstPendingEmployee) {
    return Row(
      children: [
        20.horizontalSpace,
        Expanded(
          child: ElevatedButton(
            onPressed: () => _onAction(firstPendingEmployee, WithdrawalStatus.approved),
            child: Text("موافقة"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: WithdrawalStatus.approved.color,
              side: BorderSide(color: WithdrawalStatus.approved.color),
              textStyle: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, fontFamily: kfontfamily2),
            ),
          ),
        ),
        20.horizontalSpace,
        Expanded(
          child: ElevatedButton(
            onPressed: () => _onAction(firstPendingEmployee, WithdrawalStatus.declined),
            child: Text("رفض"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: WithdrawalStatus.declined.color,
              side: BorderSide(color: WithdrawalStatus.declined.color),
              textStyle: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w300, fontFamily: kfontfamily2),
            ),
          ),
        ),
        20.horizontalSpace,
      ],
    );
  }

  _onAction(InvoiceWithdrawalSeries firstPendingEmployee, WithdrawalStatus status) {
    _manageWithdrawalsCubit.setApproveSeries(
      SetApproveSeriesParams(
        idApproveSeries: firstPendingEmployee.idApproveSeries!,
        invoiceId: firstPendingEmployee.fkInvoice!,
        withdrawalStatus: status,
        clientId: widget.invoice.fkIdClient.toString(),
        nameUserdo: currentUser.nameUser!,
        nameEnterprise: widget.invoice.name_enterprise!,
        fk_regoin: widget.invoice.fk_regoin_invoice!,
        fkcountry: widget.invoice.fk_country!,


      ),
      () {},
    );
  }
}
