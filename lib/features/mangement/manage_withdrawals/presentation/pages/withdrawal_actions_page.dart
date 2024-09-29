import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:text_scroll/text_scroll.dart';

import '../../../../../core/common/enums/withdrawal_status_enum.dart';
import '../../../../../core/common/extensions/build_context.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/page_state/result_builder.dart';
import '../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/invoice_withdrawal_series_model.dart';
import '../../domain/use_cases/set_approve_series_usecase.dart';
import '../manager/manage_withdrawals_cubit.dart';

class WithdrawalActionsPage extends StatefulWidget {
  const WithdrawalActionsPage({Key? key, required this.invoice})
      : super(key: key);

  final InvoiceModel invoice;

  @override
  State<WithdrawalActionsPage> createState() => _WithdrawalActionsPageState();
}

class _WithdrawalActionsPageState extends State<WithdrawalActionsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late UserModel currentUser;
  late TextEditingController _noteController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _manageWithdrawalsCubit = context.read<ManageWithdrawalsCubit>()
      ..getWithdrawalInvoiceDetails(widget.invoice.idInvoice!);
    currentUser = context.read<UserProvider>().currentUser;
    _noteController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: TextScroll(
            "${widget.invoice.name_enterprise}    ",
            mode: TextScrollMode.endless,
            velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
            delayBefore: Duration(milliseconds: 2000),
            pauseBetween: Duration(milliseconds: 1000),
            style: TextStyle(
                color: AppColors.white, fontFamily: AppFonts.fontFamily1),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryMain,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
            builder: (context, state) {
              return PageStateBuilder<List<InvoiceWithdrawalSeries>>(
                init: Center(child: CircularProgressIndicator()),
                success: (data) {
                  final hasDecline = data
                      .any((element) => element.withdrawalStatus.isDeclined);
                  final firstPendingEmployee = data.firstWhereOrNull(
                      (element) => element.withdrawalStatus.isPending);

                  final isShowingActionButtons = !hasDecline &&
                      firstPendingEmployee?.fkUser == currentUser.idUser;
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: REdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          itemBuilder: (BuildContext context, int index) =>
                              cardWithdrawalManagerStatus(
                            data: data[index],
                            index: index,
                          ),
                          separatorBuilder: (context, int index) =>
                              15.verticalSpacingRadius,
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
                        Padding(
                          padding: HWEdgeInsets.symmetric(horizontal: 20),
                          child: AppTextField(
                            labelText: "ملاحظة*",
                            maxLines: 2,
                            validator: InputValidator.requiredFiled,
                            controller: _noteController,
                          ),
                        ),
                        20.verticalSpace,
                        if (state.setApproveSeriesState.isLoading())
                          Center(child: CircularProgressIndicator())
                        else
                          manageSeriesButtons(firstPendingEmployee!),
                        20.verticalSpacingRadius,
                      },
                    ],
                  );
                },
                loading: Center(child: CircularProgressIndicator()),
                error: (error) => Center(
                  child: IconButton(
                    onPressed: () => _manageWithdrawalsCubit
                        .getWithdrawalInvoiceDetails(widget.invoice.idInvoice!),
                    icon: Icon(Icons.refresh_rounded),
                  ),
                ),
                result: state.withdrawalInvoiceDetails,
                empty: Center(child: Text("No Withdrawals Invoices")),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget cardWithdrawalManagerStatus({
    required InvoiceWithdrawalSeries data,
    required int index,
  }) {
    index++;
    double mainPadding = 10;
    double subPadding = 55;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 17.r,
                  backgroundColor: Colors.blueGrey,
                  child: Text(index.toString(),
                      style: context.textTheme.bodyMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ),
                mainPadding.horizontalSpace,
                Container(
                  child: Text(
                    data.nameUser!,
                    style: context.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 7,
              backgroundColor: data.withdrawalStatus.color,
            ),
          ],
        ),
        if (data.notesApprove?.isNotEmpty ?? false) ...[
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.only(right: subPadding, left: mainPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "التاريخ:",
                  style: context.textTheme.titleSmall!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  intl.DateFormat("yyyy-MM-dd HH:mm:ss")
                      .format(data.dateApprove!),
                  style: context.textTheme.titleSmall!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.only(right: subPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "الملاحظة: ",
                  style: context.textTheme.titleSmall!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                  ),
                ),
                10.width,
                Flexible(
                  child: AppText(
                    "${data.notesApprove}",
                    style: context.textTheme.titleSmall!.copyWith(
                      color: data.withdrawalStatus.color,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
            onPressed: () =>
                _onAction(firstPendingEmployee, WithdrawalStatus.approved),
            child: Text("موافقة"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: WithdrawalStatus.approved.color,
              side: BorderSide(color: WithdrawalStatus.approved.color),
              textStyle: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily1),
            ),
          ),
        ),
        20.horizontalSpace,
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                _onAction(firstPendingEmployee, WithdrawalStatus.declined),
            child: Text("رفض"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              foregroundColor: WithdrawalStatus.declined.color,
              side: BorderSide(color: WithdrawalStatus.declined.color),
              textStyle: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontFamily: AppFonts.fontFamily1),
            ),
          ),
        ),
        20.horizontalSpace,
      ],
    );
  }

  _onAction(
      InvoiceWithdrawalSeries firstPendingEmployee, WithdrawalStatus status) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _manageWithdrawalsCubit.setApproveSeries(
      SetApproveSeriesParams(
        notesApprove: _noteController.text,
        idApproveSeries: firstPendingEmployee.idApproveSeries!,
        invoiceId: firstPendingEmployee.fkInvoice!,
        withdrawalStatus: status,
        clientId: widget.invoice.fkIdClient.toString(),
        nameUserdo: currentUser.nameUser!,
        nameEnterprise: widget.invoice.name_enterprise!,
        fk_regoin: widget.invoice.fk_regoin_invoice!,
        fkcountry: widget.invoice.fk_country!,
        id_user: currentUser.idUser.toString(),
      ),
      () {},
    );
  }
}
