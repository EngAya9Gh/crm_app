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
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          height: 700.scaleHeight,
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
              if (widget.task.attachments?.isNotEmpty ?? false)
                BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          height: 150.scaleHeight,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => 10.width,
                            scrollDirection: Axis.horizontal,
                            itemCount: (state.getCurrentTask.data?.attachments?.length ?? 0) + 1,
                            itemBuilder: (context, index) {
                              print(state.fileAddedOrEdtiableIndex.contains(index));
                              if (index == (state.getCurrentTask.data?.attachments?.length ?? 0)) {
                                return InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                                      builder: (context) => PickImageBottomSheet(
                                        onPickFile: (context, file) {
                                          widget.cubit.curdTaskFiles(params: CurdFilesTaskParams(taskId: widget.task.id!, files: [file]));
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 200.scaleWidth,
                                    height: 150.scaleHeight,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.primaryAltLight),
                                    child: Center(child: Icon(Icons.add)),
                                  ),
                                );
                              }
                              var file = state.getCurrentTask.data!.attachments![index];
                              if ((file.filePath ?? file.xFile?.path)!.endsWith('.pdf') || (file.filePath ?? file.xFile?.path)!.endsWith('.PDF')) {
                                return fileWidgetAttachement(
                                    cubit: widget.cubit, file: file, task: widget.task, isLoading: state.fileAddedOrEdtiableIndex.contains(index));
                              }
                              return ImageWidgetAttachement(
                                file: file,
                                isLoading: state.fileAddedOrEdtiableIndex.contains(index),
                                cubit: widget.cubit,
                                task: widget.task,
                              );
                            },
                          ),
                        ));
                  },
                ),
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
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Colors.transparent,
                        overlayColor: WidgetStateColor.resolveWith(
                          (states) => Colors.transparent,
                        ),
                        dividerColor: Colors.transparent,
                        // indicator: BoxDecoration(
                        // color: AppColors.primaryAltLight,
                        // borderRadius: BorderRadius.circular(8),
                        // ),
                        onTap: (value) {
                          activeTab.value = value;
                          value == 0
                              ? widget.cubit.onGetTaskComments(widget.task.id!)
                              : widget.cubit.getTaskLog(params: GetTaskByIdParams(idTask: widget.task.id!));
                        },
                        tabs: [0, 1]
                            .map(
                              (e) => ValueListenableBuilder(
                                valueListenable: activeTab,
                                builder: (context, value, child) => Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: value == e ? AppColors.primaryAltLight.withValues(alpha: .3) : AppColors.outlineBorder,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: AppText(
                                    e == 0 ? 'التعليقات' : 'التغييرات',
                                    color: value == e ? AppColors.primaryMain : AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [CommentTabView(textController: textController, widget: widget), ChangesTabView()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}

Widget fileWidgetAttachement({required TaskCubit cubit, required FileAttachmentTaskModel file, required TaskModel task, bool? isLoading}) {
  bool isLoadingOpen = false;
  return StatefulBuilder(
    builder: (context, refresh) {
      return InkWell(
        onTap: () async {
          isLoadingOpen = true;
          refresh(() {});
          await InvoiceVm().openFile(
            attachFile: FileAttach(fileAttach: file.filePath, file: file.xFile),
            baseUrl: EndPoints.baseUrls.laravelFilesUrl,
            context: context,
          );
          isLoadingOpen = false;
          refresh(() {});
        },
        child: Stack(
          children: [
            Container(
                width: 200.scaleWidth,
                height: 150.scaleHeight,
                decoration: BoxDecoration(color: AppColors.primaryMain.withOpacity(0.1)),
                child: isLoadingOpen
                    ? AppLoader(padding: 12)
                    : AppIcon(
                        Icons.picture_as_pdf_rounded,
                        color: Colors.grey,
                      )),
            if (!(isLoading ?? false))
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      cubit.curdTaskFiles(params: CurdFilesTaskParams(taskId: task.id!, filesId: [file.id!]));
                    },
                    borderRadius: BorderRadius.circular(90),
                    child: Container(
                      height: 25,
                      width: 25,
                      margin: EdgeInsets.only(top: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: AppIcon(
                        Icons.delete_rounded,
                        color: Colors.red,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            if (isLoading ?? false) Positioned.fill(child: AppLoader())
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
