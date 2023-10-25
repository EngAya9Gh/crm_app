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
import '../../../view_model/privilge_vm.dart';
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
                    if (attachFile.file != null) {
                      return fileImage(
                        attachFile,
                        () {
                          invoiceVm.deleteFileAttach(index);
                        },
                      );
                    } else {
                      return
                        networkImage(
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
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: fileAttach.file!.path.mimeType?.contains("image") == true
                        ? Image.file(File(fileAttach.file!.path), fit: BoxFit.cover, width: 110)
                        : Container(
                            width: 110,
                            decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                            child: Icon(Icons.picture_as_pdf_rounded, color: Colors.grey)),
                  ),
                ),
                5.verticalSpacingRadius,
                // TextScroll(
                //   fileAttach.file!.path.name + "   ",
                //   mode: TextScrollMode.endless,
                //   velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                //   delayBefore: Duration(milliseconds: 2000),
                //   pauseBetween: Duration(milliseconds: 1000),
                //   style: TextStyle(fontFamily: kfontfamily2),
                //   textAlign: TextAlign.center,
                //   textDirection: TextDirection.ltr,
                // )
              ],
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
                  child: Icon(Icons.delete_rounded, color: Colors.red, size: 17),
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
              child: fileAttach.fileAttach!.mimeType?.contains("image") == true
                  ? FancyImageShimmerViewer(
                      imageUrl: urlfile + fileAttach.fileAttach!,
                      fit: BoxFit.cover,
                    )
                  : InkWell(
                      onTap: () => invoiceVm.openFile(fileAttach),
                      child: Container(
                          width: 110,
                          decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                          child: Icon(Icons.picture_as_pdf_rounded, color: Colors.grey)),
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
          if (Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('146') == true)
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
                    child: Icon(Icons.delete_rounded, color: Colors.red, size: 17),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'webp', 'dng', 'heic', 'pdf'],
      type: FileType.custom,
    );

    // ImagePicker imagePicker = ImagePicker();
    // final images = await imagePicker.pickMultiImage();
    if (result == null) {
      return;
    }

    invoiceVm.addOnFilesAttach(
      result.files.map((e) => FileAttach(file: XFile(e.path!))).toList(),
      () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("أكثر عدد مسموح به هو 20 ملف."))),
    );
  }
}

extension FileExt on String {
  String get ext => extension(this);

  String get name => basename(this);

  String get nameWithoutExtension => basename(this).split('.').first;

  String? get mimeType => lookupMimeType(this);
}
