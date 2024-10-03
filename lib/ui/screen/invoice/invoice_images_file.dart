import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/files/app_platform_image.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' hide context;
import 'package:provider/provider.dart';

import '../../../core/common/helpers/check_sorage_permission.dart';
import '../../../core/common/models/file_model.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/end_points.dart';
import '../../../features/app/presentation/widgets/app_text_button.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../widgets/app_file_viewer.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';

class InvoiceImagesFiles extends StatefulWidget {
  const InvoiceImagesFiles({Key? key, required this.onDeleteFileAttach});

  final ValueChanged<FileAttach> onDeleteFileAttach;

  @override
  State<InvoiceImagesFiles> createState() => _InvoiceImagesFilesState();
}

class _InvoiceImagesFilesState extends State<InvoiceImagesFiles> {
  late InvoiceVm invoiceVm;

  @override
  void initState() {
    invoiceVm = context.read<InvoiceVm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceVm>(
      builder: (context, value, child) {
        final files = value.filesAttach;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('مرفقات الفاتورة:'),
                AppTextButton(
                  text: "إضافة",
                  onPressed: pickImages,
                )
              ],
            ),
            if (files.isNotEmpty)
              SizedBox(
                height: 125.scaleIconsSize,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final attachFile = files[index];
                    if (attachFile.file != null ||
                        (attachFile.fileAttach?.endsWith('.pdf') ?? false)) {
                      return fileImage(
                        attachFile,
                        () {
                          invoiceVm.deleteFileAttach(index);
                          widget.onDeleteFileAttach(attachFile);
                        },
                      );
                    } else {
                      return networkImage(
                        attachFile,
                        () {
                          invoiceVm.deleteFileAttach(index);
                          widget.onDeleteFileAttach(attachFile);
                        },
                      );
                    }
                  },
                  separatorBuilder: (context, index) => 10.horizontalSpace,
                  itemCount: files.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget fileImage(FileAttach fileAttach, VoidCallback onDelete) {
    bool isLoading = false;
    return SizedBox(
      height: 125.scaleIconsSize,
      width: 110.scaleIconsSize,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: (fileAttach.file?.name.ext == '.pdf' ||
                      (fileAttach.fileAttach?.endsWith('.pdf') ?? false))
                  ? StatefulBuilder(
                      builder: (context, refresh) {
                        return InkWell(
                          onTap: () async {
                            isLoading = true;
                            refresh(() {});
                            await InvoiceVm().openFile(
                              attachFile: fileAttach,
                              baseUrl: EndPoints.baseUrls.laravelFilesUrl,
                              context: context,
                            );
                            isLoading = false;
                            refresh(() {});
                          },
                          child: Container(
                              width: 110.scaleIconsSize,
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.primaryMain.withOpacity(0.1)),
                              child: isLoading
                                  ? AppLoader()
                                  : AppIcon(
                                      Icons.picture_as_pdf_rounded,
                                      color: Colors.grey,
                                    )),
                        );
                      },
                    )
                  : InkWell(
                      onTap: () => AppFileViewer(
                        imageSource: ImageSourceViewer.file,
                        files: [fileAttach.file!],
                      ).show(context),
                      child: AppPlatformImage(
                        fileModel: FileModel(file: fileAttach.file!),
                        fit: BoxFit.cover,
                        width: 110.scaleIconsSize,
                      ),
                    ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(90),
                child: Container(
                  height: 25.scaleIconsSize,
                  width: 25.scaleIconsSize,
                  margin: EdgeInsets.only(top: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: AppIcon(Icons.delete_rounded, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget networkImage(FileAttach fileAttach, VoidCallback onDelete) {
    return SizedBox(
      width: 100.scaleIconsSize,
      height: 100.scaleIconsSize,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () => AppFileViewer(
                  imageSource: ImageSourceViewer.network,
                  urls: [
                    EndPoints.baseUrls.laravelFilesUrl + fileAttach.fileAttach!
                  ],
                ).show(context),
                child: FancyImageShimmerViewer(
                  imageUrl: EndPoints.baseUrls.laravelFilesUrl +
                      (fileAttach.fileAttach ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (fileAttach.fileStatus == DownloadFileStatus.loading)
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onDelete,
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    height: 30.scaleIconsSize,
                    width: 30.scaleIconsSize,
                    margin: EdgeInsets.only(top: 5, right: 60),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          if (context.read<PrivilegesCubit>().checkPrivilege('146') == true)
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onDelete,
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    height: 30.scaleIconsSize,
                    width: 30.scaleIconsSize,
                    margin: EdgeInsets.only(top: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: AppIcon(Icons.delete_rounded, color: Colors.red),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  pickImages() async {
    if (!(await checkStoragePermission())) return;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'webp', 'dng', 'heic', 'pdf'],
      type: FileType.custom,
    );
    if (result == null) {
      return;
    }

    invoiceVm.addOnFilesAttach(
      result.files.map((e) => FileAttach(file: XFile(e.path!))).toList(),
      () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("أكثر عدد مسموح به هو 20 ملف."))),
    );
  }
}

extension FileExt on String {
  String get ext => extension(this);

  String get name => basename(this);

  String get nameWithoutExtension => basename(this).split('.').first;

  String? get mimeType => lookupMimeType(this);
}
