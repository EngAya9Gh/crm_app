import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/domain/use_cases/change_demand_status_usecase.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text.dart';

class DemandChangeStatusAndSHowCommentDialog extends StatefulWidget {
  const DemandChangeStatusAndSHowCommentDialog(
      {super.key, required this.demandModel, required this.status, required this.bloc, this.canDrag = false});

  final DemandModel demandModel;
  final DemandVersionStatus status;
  final VersionsBloc bloc;
  final bool canDrag;

  @override
  State<DemandChangeStatusAndSHowCommentDialog> createState() => _DemandChangeStatusAndSHowCommentDialogState();
}

class _DemandChangeStatusAndSHowCommentDialogState extends State<DemandChangeStatusAndSHowCommentDialog> {
  late ValueNotifier<DemandVersionStatus> selectedType;
  TextEditingController textController = TextEditingController();

  double? rate;

  @override
  void initState() {
    selectedType = ValueNotifier(widget.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.black,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            Expanded(child: AppText(widget.demandModel.title ?? '')),
          ],
        ),
        content: SizedBox(
          width: 500.scaleWidth,
          height: ((widget.demandModel.notes?.isNotEmpty ?? false) ? 550 : 500).scaleHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<VersionsBloc, VersionsState>(
                builder: (context, state) {
                  return ValueListenableBuilder(
                    valueListenable: selectedType,
                    builder: (context, value, child) => Row(
                      children: [
                        if (!widget.canDrag)
                          SizedBox(
                            width: 200.scaleWidth,
                            child: AppDropdownButtonFormField<DemandVersionStatus, DemandVersionStatus>(
                              borderColor: value.color,
                              iconColor: value.color,
                              items: List.of(DemandVersionStatus.values)
                                ..removeWhere(
                                  (element) =>
                                      element.index <
                                      DemandVersionStatus.values
                                          .firstWhere(
                                            (e) => e.text == state.getDemands.data?.firstWhere((e) => e.id == widget.demandModel.id).status,
                                          )
                                          .index,
                                ),
                              onChange: (value) {
                                selectedType.value = value!;
                                AppConstants.debounceFunction(
                                  () {
                                    widget.bloc.add(ChangeDenmadStatusEvent(
                                        params: DemandChangeStatusOrCommentParams(
                                      idDemand: widget.demandModel.id!,
                                      status: value.text,
                                    )));
                                  },
                                  tag: "change-status-demand",
                                  isDebounced: true,
                                );
                              },
                              hint: "الحالة",
                              itemAsValue: (DemandVersionStatus? item) => item,
                              itemBuilder: (item) => AppText(
                                item?.text ?? '',
                                color: item?.color,
                                fontSize: 18,
                              ),
                              value: value,
                              validator: (value) {
                                if (value == null) {
                                  return 'هذا الحقل مطلوب.';
                                }
                                return null;
                              },
                            ),
                          ),
                        if (state.changeDemandStatus.isLoading()) ...{
                          AppLoader(),
                        }
                      ],
                    ),
                  );
                },
              ),
              7.height,
              AppText('الوصف', fontWeight: FontWeight.w600),
              3.height,
              if (widget.demandModel.description?.isNotEmpty ?? false) ...{
                AppText(
                  widget.demandModel.description ?? '',
                  fontSize: 15.scaleFontSize,
                  color: context.colorScheme.grey600,
                ),
              },
              if (widget.demandModel.notes?.isNotEmpty ?? false) ...{
                7.height,
                AppText('الملاحظات', fontWeight: FontWeight.w600),
                3.height,
                AppText(
                  widget.demandModel.notes ?? '',
                  fontSize: 15.scaleFontSize,
                  color: context.colorScheme.grey600,
                ),
              },
              7.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppIcon(Icons.date_range_rounded, color: context.colorScheme.grey600),
                  5.width,
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: AppText(
                      Intl.DateFormat('dd MMM hh:mm a').format(widget.demandModel.createdAt ?? DateTime.now()),
                      color: context.colorScheme.grey600,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              7.height,
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.primaryMain,
                          child: AppText(
                            context.read<UserProvider>().currentUser.nameUser?.substring(0, 2).toUpperCase(),
                            fontSize: 12,
                          )),
                      10.width,
                      Expanded(
                        child: AppTextField(
                          hintText: 'اكتب تعليقا',
                          controller: textController,
                        ),
                      ),
                      10.width,
                      InkWell(
                        onTap: () {
                          widget.bloc.add(AddCommentDemandEvent(
                            params: DemandChangeStatusOrCommentParams(
                              idDemand: widget.demandModel.id!,
                              comment: textController.text,
                            ),
                            onSuccess: () {
                              textController.clear();
                            },
                          ));
                        },
                        child: BlocSelector<VersionsBloc, VersionsState, BlocStatus>(
                          selector: (state) => state.addCommentDemand,
                          builder: (context, state) {
                            return CircleAvatar(
                                radius: 16,
                                backgroundColor: AppColors.primaryMain,
                                child: state.isLoading()
                                    ? AppLoader(
                                        color: AppColors.white,
                                      )
                                    : AppIcon(
                                        Icons.send,
                                        color: AppColors.white,
                                      ));
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              BlocBuilder<VersionsBloc, VersionsState>(
                builder: (context, state) {
                  return state.getCommentsDemand.when(
                    empty: () => AppErrorWidget(message: 'لا يوجد تعليقات بعد'),
                    initial: () => AppErrorWidget(message: 'لا يوجد تعليقات بعد'),
                    success: (data) => SizedBox(
                      height: (275).scaleHeight,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data?.length ?? 0,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsetsDirectional.only(top: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.primaryMain,
                                  child: AppText(
                                    data?[index].nameUser?.substring(0, 2).toUpperCase(),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),
                              10.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      data?[index].nameUser,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    5.height,
                                    AppText(data?[index].content),
                                    5.height,
                                    AppText(
                                      Intl.DateFormat('dd MMM hh:mm a').format(DateTime.tryParse(data?[index].date_comment ?? '') ?? DateTime.now()),
                                      color: context.colorScheme.grey600,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    failure: (error, data) => AppErrorWidget(message: error),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
