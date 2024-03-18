import 'dart:io';

import 'package:crm_smart/features/manage_withdrawals/data/models/withdrawn_details_model.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/pages/withdrawal_actions_page.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/utils/withdrawal_status.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as pp;

import '../../../../api/api.dart';
import '../../../../constants.dart';
import '../../../../core/common/models/page_state/result_builder.dart';
import '../../../../core/di/di_container.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../model/usermodel.dart';
import '../../../../ui/screen/client/profileclient.dart';
import '../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../ui/widgets/app_photo_viewer.dart';
import '../../../../ui/widgets/custom_widget/RowWidget.dart';
import '../../../../ui/widgets/fancy_image_shimmer_viewer.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/manage_withdrawals_cubit.dart';

class WithdrawnDetailsPage extends StatefulWidget {
  const WithdrawnDetailsPage({Key? key, required this.invoice})
      : super(key: key);

  final InvoiceModel invoice;

  @override
  State<WithdrawnDetailsPage> createState() => _WithdrawnDetailsPageState();
}

class _WithdrawnDetailsPageState extends State<WithdrawnDetailsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late UserModel currentUser;

  @override
  void initState() {
    _manageWithdrawalsCubit = getIt<ManageWithdrawalsCubit>()
      ..setCurrentInvoice(widget.invoice)
      ..getWithdrawnDetails(widget.invoice.idInvoice!);
    currentUser = context.read<UserProvider>().currentUser;
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
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => InvoiceView(
                              invoice: widget.invoice, showActions: false)),
                    );
                    break;
                  case 1:
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ProfileClient(
                                idClient: widget.invoice.fkIdClient)));
                    break;
                  case 2:
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => WithdrawalActionsPage(
                                invoice: widget.invoice)));
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
                      Icon(Icons.settings_rounded, color: kMainColor),
                      Text("معالجة الطلب"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
          builder: (context, state) {
            return PageStateBuilder<WithdrawnDetailsModel>(
              init: Center(child: CircularProgressIndicator()),
              success: (data) {
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: data.fileReject!.mimeType
                                        ?.contains("image") ==
                                    true
                                ? InkWell(
                                    onTap: () => AppFileViewer(
                                      imageSource: ImageSourceViewer.network,
                                      urls: [
                                        EndPoints.baseUrls.urlfile +
                                            data.fileReject!
                                      ],
                                    ).show(context),
                                    child: FancyImageShimmerViewer(
                                      imageUrl: EndPoints.baseUrls.urlfile +
                                          data.fileReject!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () => openFile(data.fileReject!),
                                    child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: kMainColor.withOpacity(0.1)),
                                        child: Icon(
                                            Icons.picture_as_pdf_rounded,
                                            color: Colors.grey,
                                            size: 30)),
                                  ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: 20.verticalSpacingRadius),
                      SliverToBoxAdapter(
                        child: cardRow(
                            title: 'اسم الموظف الذي قام بالانسحاب',
                            value: data.nameUser.toString()),
                      ),
                      SliverToBoxAdapter(
                        child: cardRow(
                            title: 'سبب الإنسحاب',
                            value: data.reasonBack.toString()),
                      ),
                      SliverToBoxAdapter(
                        child: cardRow(
                            title: 'وصف سبب الإنسحاب',
                            value: data.descReasonBack.toString()),
                      ),
                      SliverToBoxAdapter(
                        child: cardRow(
                            title: 'المبلغ المسترجع',
                            value: data.valueBack.toString()),
                      ),
                      SliverToBoxAdapter(
                        child: cardRow(
                            title: 'تاريخ الإنسحاب',
                            value:
                                "${intl.DateFormat("dd").format(DateTime.parse(data.dateChangeBack!))} ${intl.DateFormat("MMMM").format(DateTime.parse(data.dateChangeBack!))} ${intl.DateFormat(" yyyy").format(DateTime.parse(data.dateChangeBack!))}"),
                      ),
                      SliverToBoxAdapter(
                        child: cardRow(
                            title: 'الحالة',
                            value: WithdrawalStatus
                                .values[int.parse(data.approveBackDone!)].text),
                      ),
                      SliverToBoxAdapter(
                        child: cardRow(
                            title: 'تاريخ طلب انسحاب العميل',
                            value: data.dateBackNow,
                            withDivider: false),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            if (context
                                    .read<PrivilegeCubit>()
                                    .checkPrivilege('145') &&
                                state.currentInvoice?.approveBackDone ==
                                    '0') ...{
                              if (state.deleteWithdrawnRequestStatus
                                  .isLoading())
                                Center(
                                    child: CircularProgressIndicator.adaptive())
                              else
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () async {
                                    _manageWithdrawalsCubit
                                        .deleteWithdrawalRequest(
                                      widget.invoice.idInvoice!,
                                      data.fileReject!,
                                      onSuccess: () {
                                        Navigator.of(context)
                                          ..pop()
                                          ..pop();
                                      },
                                    );
                                  },
                                  child: Text('حذف الطلب'),
                                ),
                            }
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                child: IconButton(
                  onPressed: () => _manageWithdrawalsCubit
                      .getWithdrawnDetails(widget.invoice.idInvoice!),
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

  openFile(String attachFile) async {
    try {
      if (attachFile != null) {
        // final check = await Permission.manageExternalStorage.request();
        // if (check == PermissionStatus.denied) {
        //   return;
        // }

        final checkFile = await Api().checkExist(pp.basename(attachFile));
        if (checkFile != null) {
          final result = await OpenFile.open(checkFile.path);
          return;
        }

        File file;
        file = await Api().downloadFile(
            EndPoints.baseUrls.urlfile + attachFile, pp.basename(attachFile));
        if (file.existsSync()) {
          final result = await OpenFile.open(file.path);

          return;
        }
      }
    } catch (e) {}
  }
}
