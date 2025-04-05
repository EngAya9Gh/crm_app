import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/curd_task_files_usecase.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/get_task_by_id_usecase.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/changes_tab_view.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/comment_tab_view.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/image_widget_attachement.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/widgets/pick_image_bottom_sheet.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../manager/task_cubit.dart';

class DialogTaskDetail extends StatefulWidget {
  const DialogTaskDetail(
      {super.key,
      required this.task,
      required this.status,
      required this.cubit,
      this.canDrag = false});

  final TaskModel task;
  final TaskStatusType status;
  final TaskCubit cubit;
  final bool canDrag;

  @override
  State<DialogTaskDetail> createState() => _DialogTaskDetailState();
}

class _DialogTaskDetailState extends State<DialogTaskDetail> {
  late ValueNotifier<TaskStatusType> selectedType;
  ValueNotifier<int> activeTab = ValueNotifier(0);
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
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        title: null,
        content: SizedBox(
          width: 500.scaleWidth,
          height: 700.scaleHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryMain.withOpacity(0.05),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.primaryMain.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.task_alt_rounded,
                              color: AppColors.primaryMain,
                              size: 20,
                            ),
                          ),
                          16.width,
                          Expanded(
                            child: AppText(
                              widget.task.title ?? '',
                              fontSize: 18.scaleFontSize,
                              fontWeight: FontWeight.bold,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.close,
                          color: AppColors.outlineBorder,
                          size: 18,
                        ),
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<TaskCubit, TaskState>(
                        builder: (context, state) {
                          return ValueListenableBuilder(
                            valueListenable: selectedType,
                            builder: (context, value, child) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      'الحالة:',
                                      fontSize: 15.scaleFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700,
                                    ),
                                    12.width,
                                    if (!widget.canDrag)
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  value.color.withOpacity(0.1),
                                              blurRadius: 8,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: SizedBox(
                                          width: 200.scaleWidth,
                                          child: AppDropdownButtonFormField<
                                              TaskStatusType, TaskStatusType>(
                                            borderColor: value.color,
                                            iconColor: value.color,
                                            fillColor: value.color,
                                            isFilledColor: true,
                                            items:
                                                List.of(TaskStatusType.values)
                                                  ..removeWhere(
                                                    (element) =>
                                                        element.index <
                                                        widget.status.index,
                                                  ),
                                            onChange: (value) {
                                              selectedType.value = value!;
                                              if (widget.status ==
                                                      selectedType.value ||
                                                  state.changeTaskStatus
                                                      .isLoading() ||
                                                  (value.id == 11)) {
                                                return;
                                              }
                                              AppConstants.debounceFunction(
                                                () {
                                                  return widget.cubit
                                                      .onChangeTaskStatusStage(
                                                    widget.task,
                                                    selectedType.value,
                                                    () {},
                                                    context
                                                        .read<UserProvider>()
                                                        .currentUser
                                                        .idUser!,
                                                    false,
                                                    rate,
                                                  );
                                                },
                                                tag: "change-status",
                                                isDebounced: true,
                                              );
                                            },
                                            hint: "القسم",
                                            itemAsValue:
                                                (TaskStatusType? item) => item,
                                            itemBuilder: (item) => AppText(
                                              item?.text ?? '',
                                              color: item!.color,
                                              fontSize: 15,
                                            ),
                                            itemBuilderSelected: (item) =>
                                                AppText(
                                              item?.text ?? '',
                                              color: AppColors.white,
                                              fontSize: 15,
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
                                      ),
                                    10.width,
                                    (state.changeTaskStatus.isLoading())
                                        ? AppLoader(size: 20)
                                        : SizedBox.shrink(),
                                  ],
                                ),
                                if (value.id == 11) ...{
                                  20.height,
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.amber.withOpacity(0.2)),
                                    ),
                                    child: Row(
                                      children: [
                                        AppText(
                                          'التقييم:',
                                          fontSize: 15.scaleFontSize,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.amber.shade700,
                                        ),
                                        16.width,
                                        RatingBar.builder(
                                          initialRating:
                                              widget.task.rate?.toDouble() ?? 0,
                                          minRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          itemSize: 24,
                                          unratedColor:
                                              Colors.amber.withOpacity(0.3),
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            if (widget.status ==
                                                selectedType.value) {
                                              return;
                                            }
                                            AppConstants.debounceFunction(
                                              () {
                                                return widget.cubit
                                                    .onChangeTaskStatusStage(
                                                  widget.task,
                                                  selectedType.value,
                                                  () {},
                                                  context
                                                      .read<UserProvider>()
                                                      .currentUser
                                                      .idUser!,
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
                                  ),
                                },
                              ],
                            ),
                          );
                        },
                      ),
                      20.height,
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.task.description?.isNotEmpty ??
                                false) ...{
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.description_outlined,
                                    size: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                  10.width,
                                  Expanded(
                                    child: AppText(
                                      widget.task.description ?? '',
                                      fontSize: 15.scaleFontSize,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.normal,
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                              16.height,
                            },
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  size: 16,
                                  color: Colors.grey.shade600,
                                ),
                                10.width,
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: AppText(
                                    Intl.DateFormat('dd MMM yyyy, hh:mm a')
                                        .format(widget.task.startDate ??
                                            DateTime.now()),
                                    color: Colors.grey.shade700,
                                    fontSize: 14.scaleFontSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            if ((widget.task.collaborators ?? [])
                                .isNotEmpty) ...{
                              16.height,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.people_outline_rounded,
                                    size: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                  10.width,
                                  Expanded(
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: (widget.task.collaborators ??
                                              [])
                                          .map((e) => Tooltip(
                                                message: e.nameUser,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 6),
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .primaryAltLight
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor:
                                                            AppColors
                                                                .primaryMain
                                                                .withOpacity(
                                                                    0.2),
                                                        child: AppText(
                                                          e.nameUser
                                                                  ?.substring(
                                                                      0, 1)
                                                                  .toUpperCase() ??
                                                              '',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .primaryMain,
                                                        ),
                                                      ),
                                                      8.width,
                                                      AppText(
                                                        e.nameUser ?? '',
                                                        fontSize:
                                                            14.scaleFontSize,
                                                        color: AppColors
                                                            .primaryMain,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                            },
                          ],
                        ),
                      ),
                      20.height,
                      AppText(
                        'المرفقات',
                        fontSize: 16.scaleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryMain,
                      ),
                      12.height,
                      BlocBuilder<TaskCubit, TaskState>(
                        builder: (context, state) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: 150.scaleHeight,
                                child: ListView.separated(
                                  padding: EdgeInsets.all(12),
                                  separatorBuilder: (context, index) =>
                                      12.width,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: (state.getCurrentTask.data
                                              ?.attachments?.length ??
                                          0) +
                                      1,
                                  itemBuilder: (context, index) {
                                    if (index ==
                                        (state.getCurrentTask.data?.attachments
                                                ?.length ??
                                            0)) {
                                      return InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            15))),
                                            builder: (context) =>
                                                PickImageBottomSheet(
                                              onPickFile: (context, file) {
                                                widget.cubit.curdTaskFiles(
                                                    params: CurdFilesTaskParams(
                                                        taskId: widget.task.id!,
                                                        files: [file]));
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 120.scaleWidth,
                                          height: 150.scaleHeight,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey.shade100,
                                            border: Border.all(
                                                color: Colors.grey.shade300,
                                                width: 1),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.primaryAltLight,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.add_rounded,
                                                  color: AppColors.primaryMain,
                                                ),
                                              ),
                                              8.height,
                                              AppText(
                                                'إضافة ملف',
                                                fontSize: 13.scaleFontSize,
                                                color: Colors.grey.shade700,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                    var file = state.getCurrentTask.data!
                                        .attachments![index];
                                    if ((file.filePath ?? file.xFile?.path)!
                                            .endsWith('.pdf') ||
                                        (file.filePath ?? file.xFile?.path)!
                                            .endsWith('.PDF')) {
                                      return fileWidgetAttachement(
                                        cubit: widget.cubit,
                                        file: file,
                                        task: widget.task,
                                        isLoading: state
                                            .fileAddedOrEdtiableIndex
                                            .contains(index),
                                      );
                                    }
                                    return ImageWidgetAttachement(
                                      file: file,
                                      isLoading: state.fileAddedOrEdtiableIndex
                                          .contains(index),
                                      cubit: widget.cubit,
                                      task: widget.task,
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      20.height,
                      DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.all(4),
                              child: TabBar(
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                labelColor: AppColors.primaryMain,
                                unselectedLabelColor: Colors.grey.shade600,
                                dividerColor: Colors.transparent,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.scaleFontSize,
                                ),
                                onTap: (value) {
                                  activeTab.value = value;
                                  value == 0
                                      ? widget.cubit
                                          .onGetTaskComments(widget.task.id!)
                                      : widget.cubit.getTaskLog(
                                          params: GetTaskByIdParams(
                                              idTask: widget.task.id!));
                                },
                                tabs: [
                                  Tab(
                                    text: 'التعليقات',
                                    icon:
                                        Icon(Icons.comment_outlined, size: 18),
                                    iconMargin: EdgeInsets.only(bottom: 4),
                                    height: 56,
                                  ),
                                  Tab(
                                    text: 'التغييرات',
                                    icon: Icon(Icons.history_rounded, size: 18),
                                    iconMargin: EdgeInsets.only(bottom: 4),
                                    height: 56,
                                  ),
                                ],
                              ),
                            ),
                            16.height,
                            SizedBox(
                              height: 200,
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  CommentTabView(
                                      textController: textController,
                                      widget: widget),
                                  ChangesTabView(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget fileWidgetAttachement(
    {required TaskCubit cubit,
    required FileAttachmentTaskModel file,
    required TaskModel task,
    bool? isLoading}) {
  bool isLoadingOpen = false;
  return StatefulBuilder(
    builder: (context, refresh) {
      return Container(
        width: 120.scaleWidth,
        height: 150.scaleHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                isLoadingOpen = true;
                refresh(() {});
                await InvoiceVm().openFile(
                  attachFile:
                      FileAttach(fileAttach: file.filePath, file: file.xFile),
                  baseUrl: EndPoints.baseUrls.laravelFilesUrl,
                  context: context,
                );
                isLoadingOpen = false;
                refresh(() {});
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isLoadingOpen
                      ? AppLoader(padding: 12)
                      : Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.red.shade400,
                            size: 32,
                          ),
                        ),
                  12.height,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: AppText(
                      file.filePath?.split('/').last ?? 'PDF File',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13.scaleFontSize,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            if (!(isLoading ?? false))
              Positioned(
                top: 6,
                right: 6,
                child: InkWell(
                  onTap: () {
                    cubit.curdTaskFiles(
                        params: CurdFilesTaskParams(
                            taskId: task.id!, filesId: [file.id!]));
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                ),
              ),
            if (isLoading ?? false)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppLoader(),
                ),
              ),
          ],
        ),
      );
    },
  );
}

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          color: AppColors.background.withOpacity(.1),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: AppLoader(
                color: AppColors.primaryMain,
              ),
            ),
          ),
        );
      },
    );
  }
}
