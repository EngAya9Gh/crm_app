import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../manager/task_cubit.dart';

class DialogTaskDetail extends StatefulWidget {
  const DialogTaskDetail({super.key, required this.task, required this.status, required this.cubit});

  final TaskModel task;
  final TaskStatusType status;
  final TaskCubit cubit;

  @override
  State<DialogTaskDetail> createState() => _DialogTaskDetailState();
}

class _DialogTaskDetailState extends State<DialogTaskDetail> {
  late ValueNotifier<TaskStatusType> selectedType;
  TextEditingController textController = TextEditingController();

  double? rate;

  @override
  void initState() {
    selectedType = ValueNotifier(widget.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: AppText(widget.task.title ?? '')),
          IconButton(
            icon: Icon(
              Icons.close,
              color: AppColors.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: selectedType,
              builder: (context, value, child) => Column(
                children: [
                  AppDropdownButtonFormField<TaskStatusType, TaskStatusType>(
                    borderColor: value.color,
                    iconColor: value.color,
                    items: List.of(TaskStatusType.values)
                      ..removeWhere(
                        (element) => element.index < widget.status.index,
                      ),
                    onChange: (value) {
                      selectedType.value = value!;
                    },
                    hint: "القسم",
                    itemAsValue: (TaskStatusType? item) => item,
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
                  if ((widget.status == TaskStatusType.Completed || widget.task.rate != null) && value.id == 11) ...{
                    10.height,
                    Row(
                      children: [
                        Text('التقييم 1/5'),
                        RatingBar.builder(
                          initialRating: widget.task.rate?.toDouble() ?? 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            rate = rating;
                          },
                        ),
                      ],
                    ),
                  }
                ],
              ),
            ),
            10.height,
            if (widget.task.description?.isNotEmpty ?? false) ...{
              AppText(
                widget.task.description ?? '',
                fontSize: 15.scaleFontSize,
                color: context.colorScheme.grey600,
              ),
            },
            10.height,
            Wrap(
                spacing: 5,
                runSpacing: 5,
                children: (widget.task.collaborators ?? [])
                    .map((e) => Tooltip(
                          message: e.nameUser,
                          child: CircleAvatar(
                              radius: 20, backgroundColor: AppColors.primaryAltLight, child: AppText(e.nameUser?.substring(0, 2).toUpperCase())),
                        ))
                    .toList()),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppIcon(Icons.date_range_rounded, color: context.colorScheme.grey600),
                5.width,
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: AppText(
                    Intl.DateFormat('dd MMM hh:mm a').format(widget.task.startDate ?? DateTime.now()),
                    color: context.colorScheme.grey600,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            10.height,
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
                    )
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   height: 200,
            //   width: 500.scaleWidth,
            //   child: ListView.builder(
            //     itemCount: 5,
            //     itemBuilder: (context, index) => Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         CircleAvatar(
            //             radius: 15,
            //             backgroundColor: AppColors.primaryMain,
            //             child: AppText(
            //               'HH',
            //               fontSize: 12,
            //             )),
            //         5.width,
            //         Expanded(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               AppText('title'),
            //               5.height,
            //               AppText('description'*20),
            //               5.height,
            //               AppText(
            //                 Intl.DateFormat('dd MMM hh:mm a').format(DateTime.now()),
            //                 color: context.colorScheme.grey600,
            //                 overflow: TextOverflow.ellipsis,
            //                 maxLines: 1,
            //               )
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
// ,
            10.height,
          ],
        ),
      ),
      actions: [
        BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppElevatedButton(
                  isLoading: state.changeTaskStatus.isLoading(),
                  appButtonStyle: AppButtonStyle.secondary,
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all(AppColors.primaryMain),
                  // ),
                  onPressed: () async {
                    if (widget.status == selectedType.value) {
                      return;
                    }
                    widget.cubit.onChangeTaskStatusStage(
                      widget.task,
                      widget.status,
                      Navigator.of(context).pop,
                      context.read<UserProvider>().currentUser.idUser!,
                      true,
                      rate,
                    );
                  },
                  text: 'حفظ التغييرات',
                ),
                10.height,
                AppElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.primaryMain),
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                  text: 'رجوع',
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
