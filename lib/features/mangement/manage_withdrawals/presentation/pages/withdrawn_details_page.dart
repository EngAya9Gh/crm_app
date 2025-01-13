import 'dart:io';

import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/presentation/widgets/cancel_withdrawal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as pp;

import '../../../../../api/api.dart';
import '../../../../../core/common/enums/withdrawal_status_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/models/page_state/result_builder.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../../ui/screen/invoice/invoiceView.dart';
import '../../../../../ui/screen/invoice/invoice_images_file.dart';
import '../../../../../ui/widgets/app_file_viewer.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../../../ui/widgets/fancy_image_shimmer_viewer.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../data/models/withdrawn_details_model.dart';
import '../manager/manage_withdrawals_cubit.dart';
import 'withdrawal_actions_page.dart';

class WithdrawnDetailsPage extends StatefulWidget {
  const WithdrawnDetailsPage({Key? key, required this.invoice})
      : super(key: key);

  final InvoiceModel invoice;

  @override
  State<WithdrawnDetailsPage> createState() => _WithdrawnDetailsPageState();
}

class WithdrawalPopupMenuItemModel {
  final int value;
  final String title;
  final IconData icon;
  final void Function(int) onSelected;

  const WithdrawalPopupMenuItemModel({
    required this.value,
    required this.title,
    required this.icon,
    required this.onSelected,
  });
}

class _WithdrawnDetailsPageState extends State<WithdrawnDetailsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late UserModel currentUser;

  List<WithdrawalPopupMenuItemModel> popupMenuItem = [];

  @override
  void initState() {
    _manageWithdrawalsCubit = context.read<ManageWithdrawalsCubit>()
      ..setCurrentInvoice(widget.invoice)
      ..getWithdrawnDetails(widget.invoice.idInvoice!);
    currentUser = context.read<UserProvider>().currentUser;

    popupMenuItem = [
      WithdrawalPopupMenuItemModel(
          value: 0,
          title: 'تفاصيل الفاتورة',
          icon: Icons.receipt_rounded,
          onSelected: (value) => AppNavigator.go(
                InvoiceView(
                  invoice: widget.invoice,
                  invoiceId: widget.invoice.idInvoice!,
                  showActions: false,
                ),
                isNew: false,
              )),
      WithdrawalPopupMenuItemModel(
          value: 1,
          title: 'بروفايل العميل',
          icon: Icons.person_2_rounded,
          onSelected: (value) => AppNavigator.go(
                ClientProfile(idClient: widget.invoice.fkIdClient),
                isNew: false,
              )),
      WithdrawalPopupMenuItemModel(
          value: 2,
          title: 'معالجة الطلب',
          icon: Icons.settings_rounded,
          onSelected: (value) => AppNavigator.go(
                WithdrawalActionsPage(invoice: widget.invoice),
                isNew: false,
              )),
      if (_showCancelWithdrawal()) ...[
        WithdrawalPopupMenuItemModel(
          value: 3,
          title: 'إلغاء الانسحاب',
          icon: Icons.cancel_rounded,
          onSelected: (value) => showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => CancelWithdrawalDialog(
              invoice: widget.invoice,
            ),
          ),
        ),
      ],
    ];
    super.initState();
  }

  bool _showCancelWithdrawal() {
    return context.read<PrivilegesCubit>().checkPrivilege('281') &&
        (widget.invoice.approveBackDone == '1' ||
            widget.invoice.approveBackDone == '0');
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: "تفاصيل الانسحاب",
        showBackButton: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) => popupMenuItem
                .firstWhere((element) => element.value == value)
                .onSelected(value),
            itemBuilder: (context) => [
              for (var item in popupMenuItem) ...[
                PopupMenuItem(
                  value: item.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: [
                      AppIcon(item.icon, color: AppColors.primaryMain),
                      AppText(item.title),
                    ],
                  ),
                )
              ],
            ],
          )
        ],
      ),
      body: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
        builder: (context, state) {
          return PageStateBuilder<WithdrawnDetailsModel>(
            init: AppLoader(),
            success: (data) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: 20.height),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 180.scaleHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: data.fileReject?.mimeType?.contains("image") ==
                                  true
                              ? InkWell(
                                  onTap: () => AppFileViewer(
                                    imageSource: ImageSourceViewer.network,
                                    urls: [
                                      EndPoints.baseUrls.laravelFilesUrl +
                                          data.fileReject!
                                    ],
                                  ).show(context),
                                  child: FancyImageShimmerViewer(
                                    imageUrl: EndPoints.baseUrls.laravelFilesUrl +
                                        data.fileReject!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : InkWell(
                                  onTap: () => openFile(data.fileReject!),
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryMain
                                              .withOpacity(0.1)),
                                      child: AppIcon(
                                          Icons.picture_as_pdf_rounded,
                                          color: Colors.grey,
                                          size: 30)),
                                ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: 20.verticalSpacingRadius),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'اسم الموظف الذي قام بالانسحاب',
                          value: data.nameUser.toString()),
                    ),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'سبب الإنسحاب',
                          value: data.reasonBack.toString()),
                    ),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'وصف سبب الإنسحاب',
                          value: data.descReasonBack.toString()),
                    ),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'المبلغ المسترجع',
                          value: data.valueBack.toString()),
                    ),
                    if (data.dateChangeBack != null) ...[
                      SliverToBoxAdapter(
                        child: CardRow(
                          title: 'تاريخ الإنسحاب',
                          value: intl.DateFormat("dd MMMM yyyy").format(
                            DateTime.parse(data.dateChangeBack!),
                          ),
                        ),
                      ),
                    ],
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'الحالة',
                          value: data.approveBackDone == null
                              ? WithdrawalStatus.cancelled.text
                              : WithdrawalStatus
                                  .values[int.parse(data.approveBackDone!)]
                                  .text),
                    ),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'تاريخ طلب انسحاب العميل',
                          value: data.dateBackNow,
                          withDivider: false),
                    ),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'جودة المنتج', value: "${data.rateProduct}"),
                    ),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'جودة الخدمة المقدمة من المبيعات',
                          value: "${data.rateSales}"),
                    ),
                    SliverToBoxAdapter(
                      child: CardRow(
                          title: 'جودة الخدمة المقدمة من الدعم الفني (الشات)',
                          value: "${data.rateSupport}"),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          if (context
                                  .read<PrivilegesCubit>()
                                  .checkPrivilege('145') &&
                              state.currentInvoice?.approveBackDone == '0') ...{
                            if (state.deleteWithdrawnRequestStatus.isLoading())
                              Center(
                                  child: CircularProgressIndicator.adaptive())
                            else
                              AppElevatedButton(
                                text: 'حذف الطلب',
                                backgroundColor: Colors.red,
                                onPressed: () async {
                                  _manageWithdrawalsCubit
                                      .deleteWithdrawalRequest(
                                    widget.invoice.idInvoice!,
                                    data.fileReject!,
                                    idRequest: data.idRequest,
                                    onSuccess: () {
                                      Navigator.of(context)
                                        ..pop()
                                        ..pop();
                                    },
                                  );
                                },
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
                icon: AppIcon(Icons.refresh_rounded),
              ),
            ),
            result: state.withdrawnDetailsState,
            empty: AppErrorWidget(
              message: 'لا يوجد بيانات',
              onPressed: () => _manageWithdrawalsCubit
                  .getWithdrawnDetails(widget.invoice.idInvoice!),
            ),
          );
        },
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
          final result = await OpenFilex.open(checkFile.path);
          return;
        }

        File file;
        file = await Api().downloadFile(
            EndPoints.baseUrls.urlFile + attachFile, pp.basename(attachFile));
        if (file.existsSync()) {
          final result = await OpenFilex.open(file.path);

          return;
        }
      }
    } catch (e) {}
  }
}
