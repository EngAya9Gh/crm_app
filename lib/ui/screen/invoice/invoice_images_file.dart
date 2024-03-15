import 'dart:io';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' hide context;
import 'package:provider/provider.dart';

import '../../../core/common/helpers/check_sorage_permission.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../widgets/app_photo_viewer.dart';
import '../../widgets/custom_widget/text_uitil.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';

class InvoiceImagesFiles extends StatefulWidget {
  const InvoiceImagesFiles({Key? key, required this.onDeleteFileAttach});

  final ValueChanged<FileAttach> onDeleteFileAttach;

  @override
  State<InvoiceImagesFiles> createState() => _InvoiceImagesFilesState();
}

class _InvoiceImagesFilesState extends State<InvoiceImagesFiles> {
  late invoice_vm invoiceVm;

  @override
  void initState() {
    invoiceVm = context.read<invoice_vm>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<invoice_vm>(
      builder: (context, value, child) {
        final files = value.filesAttach;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtilis(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  textstring: 'مرفقات الفاتورة:',
                  underline: TextDecoration.none,
                ),
                TextButton(onPressed: pickImages, child: Text("إضافة"))
              ],
            ),
            if (files.isNotEmpty)
              SizedBox(
                height: 125,
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
    return SizedBox(
      height: 125,
      width: 110,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: (fileAttach.file?.name.ext == '.pdf' ||
                      (fileAttach.fileAttach?.endsWith('.pdf') ?? false))
                  ? InkWell(
                      onTap: () => invoice_vm()
                          .openFile(attachFile: fileAttach, baseUrl: urlfile),
                      child: Container(
                          width: 110,
                          decoration:
                              BoxDecoration(color: kMainColor.withOpacity(0.1)),
                          child: Icon(
                            Icons.picture_as_pdf_rounded,
                            color: Colors.grey,
                          )),
                    )
                  : InkWell(
                      onTap: () => AppFileViewer(
                        imageSource: ImageSourceViewer.file,
                        files: [File(fileAttach.file!.path)],
                      ).show(context),
                      child: Image.file(
                        File(fileAttach.file!.path),
                        fit: BoxFit.cover,
                        width: 110,
                      ),
                    ),

              // Image.file(File(fileAttach.file!.path),
              //         fit: BoxFit.cover, width: 110),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: onDelete,
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
                  child:
                      Icon(Icons.delete_rounded, color: Colors.red, size: 17),
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
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () => AppFileViewer(
                  imageSource: ImageSourceViewer.network,
                  urls: [urlfile + fileAttach.fileAttach!],
                ).show(context),
                child: FancyImageShimmerViewer(
                  imageUrl: urlfile + (fileAttach.fileAttach ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
              // download image first then open it using gallery
              // InkWell(
              //     onTap: () => invoiceVm.openFile(
              //         attachFile: fileAttach, baseUrl: urlfile),
              //     child: FancyImageShimmerViewer(
              //       imageUrl: urlfile + (fileAttach.fileAttach ?? ""),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
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
                    height: 30,
                    width: 30,
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
          if (context.read<PrivilegeCubit>().checkPrivilege('146') == true)
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onDelete,
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.only(top: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child:
                        Icon(Icons.delete_rounded, color: Colors.red, size: 17),
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
