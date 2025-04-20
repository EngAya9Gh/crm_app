import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/file_model.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/files/app_platform_image.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/curd_task_files_usecase.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:crm_smart/ui/widgets/app_file_viewer.dart';
import 'package:crm_smart/ui/widgets/fancy_image_shimmer_viewer.dart';
import 'package:flutter/material.dart';

class ImageWidgetAttachement extends StatelessWidget {
  const ImageWidgetAttachement({
    super.key,
    required this.file,
    this.isLoading = false,
    required this.cubit,
    required this.task,
  });
  final bool isLoading;
  final FileAttachmentTaskModel file;
  final TaskCubit cubit;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => AppFileViewer(
              imageSource: file.xFile != null ? ImageSourceViewer.file : ImageSourceViewer.network,
              files: file.xFile != null ? [file.xFile!] : [],
              urls: [EndPoints.baseUrls.laravelFilesUrl + (file.filePath ?? '')],
            ).show(context),
        child: Stack(
          children: [
            file.xFile != null
                ? AppPlatformImage(
                    fileModel: FileModel(file: file.xFile),
                    fit: BoxFit.cover,
                    width: 200.scaleWidth,
                    height: 150.scaleHeight,
                  )
                : FancyImageShimmerViewer(
                    width: 200.scaleWidth,
                    height: 150.scaleHeight,
                    imageUrl: EndPoints.baseUrls.laravelFilesUrl + (file.filePath ?? ''),
                    fit: BoxFit.cover,
                  ),
         if (!isLoading)   Positioned.fill(
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
            if (isLoading) Positioned.fill(child: AppLoader()),
          ],
        ));
  }
}
