import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/utils/withdrawal_status.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../common/models/page_state/result_builder.dart';
import '../../../../constants.dart';
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

  @override
  void initState() {
    _manageWithdrawalsCubit = GetIt.I<ManageWithdrawalsCubit>()..getWithdrawalInvoiceDetails(widget.invoice.idInvoice!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _manageWithdrawalsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('سلسلة ادارة الانسحاب', style: TextStyle(color: kWhiteColor)),
          centerTitle: true,
          backgroundColor: kMainColor,
        ),
        body: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
          builder: (context, state) {
            return PageStateBuilder<List<InvoiceWithdrawalSeries>>(
              init: Center(child: CircularProgressIndicator()),
              success: (data) => Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        itemBuilder: (BuildContext context, int index) => cardWithdrawalManagerStatus(data[index]),
                        separatorBuilder: (context, int index) => 10.verticalSpacingRadius,
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
                  ],
                ),
              ),
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
          backgroundColor: data.isApprove.color,
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
}
