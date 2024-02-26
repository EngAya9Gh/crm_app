import 'package:crm_smart/core/common/models/page_state/result_builder.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants.dart';
import '../../../../core/di/di_container.dart';
import '../../../../ui/widgets/invoice_widget/Card_invoice_client.dart';
import '../manager/manage_withdrawals_cubit.dart';

class WithdrawalsInvoicesPage extends StatefulWidget {
  const WithdrawalsInvoicesPage({Key? key}) : super(key: key);

  @override
  State<WithdrawalsInvoicesPage> createState() =>
      _WithdrawalsInvoicesPageState();
}

class _WithdrawalsInvoicesPageState extends State<WithdrawalsInvoicesPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;

  @override
  void initState() {
    _manageWithdrawalsCubit = getIt<ManageWithdrawalsCubit>()
      ..getWithdrawalsInvoices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _manageWithdrawalsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('إدارة الفواتير المنسحبة',
              style: TextStyle(color: kWhiteColor)),
          centerTitle: true,
          backgroundColor: kMainColor,
        ),
        body: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
          builder: (context, state) {
            return PageStateBuilder<List<InvoiceModel>>(
              init: Center(child: CircularProgressIndicator()),
              success: (data) => ListView.separated(
                padding: REdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemBuilder: (BuildContext context, int index) =>
                    CardInvoiceClient(
                  type: 'withdrawn',
                  invoice: data[index],
                  isFromWithdrawalsInvoicesList: true,
                ),
                separatorBuilder: (context, int index) =>
                    10.verticalSpacingRadius,
                itemCount: data.length,
              ),
              loading: Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                child: IconButton(
                  onPressed: () =>
                      _manageWithdrawalsCubit.getWithdrawalsInvoices(),
                  icon: Icon(Icons.refresh_rounded),
                ),
              ),
              result: state.withdrawalsInvoices,
              empty: Center(child: Text("No Withdrawals Invoices")),
            );
          },
        ),
      ),
    );
  }
}
