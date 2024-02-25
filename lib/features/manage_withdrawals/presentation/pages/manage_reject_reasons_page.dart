import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_scaffold.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/reject_reason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../manager/manage_withdrawals_cubit.dart';

class ManageRejectReasonsPage extends StatefulWidget {
  const ManageRejectReasonsPage({Key? key}) : super(key: key);

  @override
  State<ManageRejectReasonsPage> createState() =>
      _ManageRejectReasonsPageState();
}

class _ManageRejectReasonsPageState extends State<ManageRejectReasonsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;

  @override
  void initState() {
    _manageWithdrawalsCubit = getIt<ManageWithdrawalsCubit>()
      ..getReasonReject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _manageWithdrawalsCubit,
      child: AppScaffold(
        appBar: SmartCrmAppBar(
            appBarParams: AppBarParams(title: "إدارة أسباب الاستبعاد", action: [
          AppTextButton(
            text: "إضافة",
            onPressed: () => showBottomSheet(),
            appButtonStyle: AppButtonStyle.secondary,
          ),
        ])),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
            builder: (context, state) {
              return state.rejectReasonsStat.when(
                init: () => Center(child: AppLoader()),
                loading: () => Center(child: AppLoader()),
                loaded: (data) => ListView.separated(
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
                    child: Card(
                      child: ListTile(
                        title: AppText(data[index].nameReasonReject!),
                      ),
                    ),
                  ),
                  itemCount: data.length,
                  separatorBuilder: (context, index) => 5.verticalSpace,
                ),
                empty: () => Center(child: AppText("Reasons isEmpty!!")),
                error: (exception) => Center(
                  child: IconButton(
                    onPressed: () => _manageWithdrawalsCubit.getReasonReject(),
                    icon: Icon(Icons.refresh),
                  ),
                ),
              );
            },
          ),
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
      child: BlocProvider.value(
        value: _manageWithdrawalsCubit,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: HWEdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    (() {
                      if (isEdit())
                        return "تعديل";
                      else
                        return "إضافة";
                    }()),
                    style: context.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  20.verticalSpace,
                  AppTextField(
                    labelText: "سبب الاستبعاد*",
                    hintText: "مثال: يوجد مشاكل مع العميل",
                    maxLines: 1,
                    controller: controller,
                    validator: HelperFunctions.instance.requiredFiled,
                  ),
                  20.verticalSpace,
                  BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
                    builder: (context, state) {
                      return AppElevatedButton(
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
                      );
                    },
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
