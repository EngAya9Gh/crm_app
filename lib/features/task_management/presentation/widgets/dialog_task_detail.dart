import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/add_comment_task_usecase.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../ui/widgets/app_file_viewer.dart';
import '../../../../ui/widgets/fancy_image_shimmer_viewer.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../manager/task_cubit.dart';

class DialogTaskDetail extends StatefulWidget {
  const DialogTaskDetail({super.key, required this.task, required this.status, required this.cubit, this.canDrag = false});

  final TaskModel task;
  final TaskStatusType status;
  final TaskCubit cubit;
  final bool canDrag;

  @override
  State<DialogTaskDetail> createState() => _DialogTaskDetailState();
}

class _DialogTaskDetailState extends State<DialogTaskDetail> {
  late ValueNotifier<TaskStatusType> selectedType;
  TextEditingController textController = TextEditingController();
  bool isLoading = false;
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
            Expanded(child: AppText(widget.task.title ?? '')),
          ],
        ),
        content: SizedBox(
          width: 500.scaleWidth,
          height: 500.scaleHeight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    return ValueListenableBuilder(
                      valueListenable: selectedType,
                      builder: (context, value, child) => Column(
                        children: [
                          if (!widget.canDrag)
                            Row(
                              children: [
                                SizedBox(
                                  width: 200.scaleWidth,
                                  child: AppDropdownButtonFormField<TaskStatusType, TaskStatusType>(
                                    borderColor: value.color,
                                    iconColor: value.color,
                                    fillColor: value.color,
                                    isFilledColor: true,
                                    items: List.of(TaskStatusType.values)
                                      ..removeWhere(
                                        (element) => element.index < widget.status.index,
                                      ),
                                    onChange: (value) {
                                      selectedType.value = value!;
                                      if (widget.status == selectedType.value || state.changeTaskStatus.isLoading() || (value.id == 11)) {
                                        return;
                                      }
                                      AppConstants.debounceFunction(
                                        () {
                                          return widget.cubit.onChangeTaskStatusStage(
                                            widget.task,
                                            selectedType.value,
                                            () {},
                                            // Navigator.of(context).pop,
                                            context.read<UserProvider>().currentUser.idUser!, false,
                                            rate,
                                          );
                                        },
                                        tag: "change-status",
                                        isDebounced: true,
                                      );
                                    },
                                    hint: "القسم",
                                    itemAsValue: (TaskStatusType? item) => item,
                                    itemBuilder: (item) => AppText(
                                      item?.text ?? '',
                                      color: item!.color,
                                      fontSize: 18,
                                    ),
                                    itemBuilderSelected: (item) => AppText(
                                      item?.text ?? '',
                                      color: AppColors.white,
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
                                5.width,
                                (state.changeTaskStatus.isLoading()) ? Center(child: AppLoader()) : SizedBox.shrink(),
                              ],
                            ),
                          if (value.id == 11) ...{
                            10.height,
                            Row(
                              children: [
                                AppText('التقييم 1/5'),
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
                                    if (widget.status == selectedType.value) {
                                      return;
                                    }
                                    AppConstants.debounceFunction(
                                      () {
                                        return widget.cubit.onChangeTaskStatusStage(
                                          widget.task,
                                          selectedType.value,
                                          () {},
                                          // Navigator.of(context).pop,
                                          context.read<UserProvider>().currentUser.idUser!,
                                          false,
                                          rating,
                                        );
                                      },
                                      tag: "change-rate",
                                      isDebounced: true,
                                    );
                                  },
                                ),
                              ],
                            ),
                          },
                        ],
                      ),
                    );
                  },
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 150.scaleHeight,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => 10.width,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.task.attachments?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (widget.task.attachments![index].filePath!.endsWith('.pdf') ||
                              widget.task.attachments![index].filePath!.endsWith('.PDF')) {
                            return StatefulBuilder(
                              builder: (context, refresh) {
                                return InkWell(
                                  onTap: () async {
                                    isLoading = true;
                                    refresh(() {});
                                    await InvoiceVm().openFile(
                                      attachFile: FileAttach(fileAttach: widget.task.attachments?[index].filePath),
                                      baseUrl: EndPoints.baseUrls.laravelFilesUrl,
                                      context: context,
                                    );
                                    isLoading = false;
                                    refresh(() {});
                                  },
                                  child: Container(
                                      width: 200.scaleWidth,
                                      height: 150.scaleHeight,
                                      decoration: BoxDecoration(color: AppColors.primaryMain.withOpacity(0.1)),
                                      child: isLoading
                                          ? AppLoader(padding: 12)
                                          : AppIcon(
                                              Icons.picture_as_pdf_rounded,
                                              color: Colors.grey,
                                            )),
                                );
                              },
                            );
                          }
                          return InkWell(
                            onTap: () => AppFileViewer(
                              imageSource: ImageSourceViewer.network,
                              urls: [EndPoints.baseUrls.laravelFilesUrl + (widget.task.attachments?[index].filePath ?? '')],
                            ).show(context),
                            child: FancyImageShimmerViewer(
                              width: 200.scaleWidth,
                              height: 150.scaleHeight,
                              imageUrl: EndPoints.baseUrls.laravelFilesUrl + (widget.task.attachments?[index].filePath ?? ''),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )),
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
                        ),
                        10.width,
                        InkWell(
                          onTap: () {
                            widget.cubit.onAddTaskComment(
                              AddTaskCommentParams(taskId: widget.task.id!, content: textController.text),
                              () {
                                textController.clear();
                              },
                            );
                          },
                          child: BlocSelector<TaskCubit, TaskState, BlocStatus>(
                            selector: (state) => state.addComment,
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
                BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    return state.getTaskComment.when(
                      empty: () => AppErrorWidget(message: 'لا يوجد تعليقات بعد'),
                      success: (data) => SizedBox(
                        height: 200,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
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
                                      data?[index].commentedBy?.nameUser?.substring(0, 2).toUpperCase(),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )),
                                10.width,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        data?[index].commentedBy?.nameUser,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      5.height,
                                      AppText(data?[index].content),
                                      5.height,
                                      AppText(
                                        Intl.DateFormat('dd MMM hh:mm a')
                                            .format(DateTime.tryParse(data?[index].date_comment ?? '') ?? DateTime.now()),
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
                10.height,
              ],
            ),
          ),
        ),
        // actions: [
        //   BlocBuilder<TaskCubit, TaskState>(
        //     builder: (context, state) {
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.stretch,
        //         children: [
        //           AppElevatedButton(
        //             isLoading: state.changeTaskStatus.isLoading(),
        //             appButtonStyle: AppButtonStyle.secondary,
        //             // style: ButtonStyle(
        //             //   backgroundColor: MaterialStateProperty.all(AppColors.primaryMain),
        //             // ),
        //             onPressed: () async {
        //               if (widget.status == selectedType.value) {
        //                 return;
        //               }
        //               widget.cubit.onChangeTaskStatusStage(
        //                 widget.task,
        //                 widget.status,
        //                 Navigator.of(context).pop,
        //                 context.read<UserProvider>().currentUser.idUser!,
        //                 true,
        //                 rate,
        //               );
        //             },
        //             text: 'حفظ التغييرات',
        //           ),
        //           10.height,
        //           AppElevatedButton(
        //             style: ButtonStyle(
        //               backgroundColor: MaterialStateProperty.all(AppColors.primaryMain),
        //             ),
        //             onPressed: () async {
        //               context.pop();
        //             },
        //             text: 'رجوع',
        //           ),
        //         ],
        //       );
        //     },
        //   )
        // ],
      ),
    );
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return Container(
          color: AppColors.background.withOpacity(.1), // Black transparent background
          child: Center(
            child: AppLoader(
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
