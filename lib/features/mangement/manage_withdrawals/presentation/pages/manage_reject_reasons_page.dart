import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../core/common/extensions/build_context.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../data/models/reject_reason.dart';
import '../manager/manage_withdrawals_cubit.dart';

class ManageRejectReasonsPage extends StatefulWidget {
  const ManageRejectReasonsPage({super.key});

  @override
  State<ManageRejectReasonsPage> createState() =>
      _ManageRejectReasonsPageState();
}

class _ManageRejectReasonsPageState extends State<ManageRejectReasonsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;

  @override
  void initState() {
    _manageWithdrawalsCubit = context.read<ManageWithdrawalsCubit>()
      ..getReasonReject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: "إدارة أسباب الاستبعاد",
        actions: [
          AppTextButton(
            text: "إضافة",
            onPressed: () => showBottomSheet(),
            textStyle: AppStyles.textStyle.copyWith(
              color: AppColors.paperCard,
            ),
            appButtonStyle: AppButtonStyle.secondary,
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
          builder: (context, state) {
            return state.rejectReasonsStat.when(
              init: () => const AppLoader(),
              loading: () => const AppLoader(),
              loaded: (data) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.separated(
                  itemBuilder: (context, index) => Slidable(
                    key: ValueKey(data[index].idRejectClient),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.35,
                      children: [
                        SlidableAction(
                          onPressed: (actionContext) async =>
                              showBottomSheet(rejectReason: data[index]),
                          backgroundColor: context.colorScheme.primaryContainer,
                          foregroundColor: Colors.white,
                          icon: Icons.edit_rounded,
                          label: 'تعديل',
                        ),
                      ],
                    ),
                    child: AppCardContainer(
                      child: ListTile(
                        title: AppText(data[index].nameReasonReject!),
                      ),
                    ),
                  ),
                  itemCount: data.length,
                  separatorBuilder: (context, index) => 5.verticalSpace,
                ),
              ),
              empty: () => Center(child: AppText("Reasons isEmpty!!")),
              error: (exception) => AppErrorWidget(
                message: exception.toString(),
                onPressed: () => _manageWithdrawalsCubit.getReasonReject(),
              ),
            );
          },
        ),
      ),
    );
  }

  showBottomSheet({RejectReason? rejectReason}) {
    bool isEdit() => rejectReason != null;
    final controller =
        TextEditingController(text: rejectReason?.nameReasonReject);
    final _fromKey = GlobalKey<FormState>();
    AppBottomSheet.show(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.height,
                Center(
                  child: AppText(
                    "${isEdit() ? "تعديل" : "إضافة"} سبب الاستبعاد",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.height,
                AppTextField(
                  labelText: "سبب الاستبعاد*",
                  hintText: "مثال: يوجد مشاكل مع العميل",
                  maxLines: 1,
                  controller: controller,
                  validator: InputValidator.requiredFiled,
                ),
                20.height,
                BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
                  builder: (context, state) {
                    return Center(
                      child: AppElevatedButton(
                        isLoading: state.actionRejectReason.isLoading(),
                        text: isEdit() ? "تعديل" : "إضافة",
                        onPressed: () {
                          if (!_fromKey.currentState!.validate()) {
                            return;
                          }
                          _manageWithdrawalsCubit.actionReasonReject(
                            controller.text,
                            rejectReasonId: rejectReason?.idRejectClient,
                            onSuccess: () => Navigator.pop(context),
                          );
                        },
                      ),
                    );
                  },
                ),
                20.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
