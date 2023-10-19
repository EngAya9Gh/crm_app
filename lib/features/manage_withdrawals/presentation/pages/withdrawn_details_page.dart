import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/withdrawn_details_model.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/utils/withdrawal_status.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../common/models/page_state/result_builder.dart';
import '../../../../constants.dart';
import '../../../../model/usermodel.dart';
import '../../../../ui/widgets/custom_widget/RowWidget.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../manager/manage_withdrawals_cubit.dart';

class WithdrawnDetailsPage extends StatefulWidget {
  const WithdrawnDetailsPage({Key? key, required this.invoice}) : super(key: key);

  final InvoiceModel invoice;

  @override
  State<WithdrawnDetailsPage> createState() => _WithdrawnDetailsPageState();
}

class _WithdrawnDetailsPageState extends State<WithdrawnDetailsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late UserModel currentUser;

  @override
  void initState() {
    _manageWithdrawalsCubit = GetIt.I<ManageWithdrawalsCubit>()..getWithdrawnDetails(widget.invoice.idInvoice!);
    currentUser = context.read<user_vm_provider>().currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _manageWithdrawalsCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تفاصيل الانسحاب"),
          centerTitle: true,
          backgroundColor: kMainColor,
        ),
        body: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
          builder: (context, state) {
            return PageStateBuilder<WithdrawnDetailsModel>(
              init: Center(child: CircularProgressIndicator()),
              success: (data) {
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 150.h,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(imageUrl: urlfile + data.fileReject!, fit: BoxFit.cover)),
                      ),
                      20.verticalSpacingRadius,
                      cardRow(title: 'اسم الموظف الذي قام بالانسحاب', value: data.nameUser.toString()),
                      cardRow(title: 'سبب الإنسحاب', value: data.reasonBack.toString()),
                      cardRow(title: 'وصف سبب الإنسحاب', value: data.descReasonBack.toString()),
                      cardRow(title: 'المبلغ المسترجع', value: data.valueBack.toString()),
                      cardRow(
                          title: 'تاريخ الإنسحاب',
                          value: "${intl.DateFormat("dd").format(DateTime.parse(data.dateChangeBack!))} ${intl.DateFormat("MMMM").format(DateTime.parse(data.dateChangeBack!))} ${intl.DateFormat(" yyyy").format(DateTime.parse(data.dateChangeBack!))}"),
                      cardRow(
                          title: 'الحالة',
                          value: WithdrawalStatus.values[int.parse(data.approveBackDone!)].text,
                          withDivider: false),
                    ],
                  ),
                );
              },
              loading: Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                child: IconButton(
                  onPressed: () => _manageWithdrawalsCubit.getWithdrawnDetails(widget.invoice.idInvoice!),
                  icon: Icon(Icons.refresh_rounded),
                ),
              ),
              result: state.withdrawnDetailsState,
              empty: Center(child: Text("No Withdrawals Invoices")),
            );
          },
        ),
      ),
    );
  }
}
