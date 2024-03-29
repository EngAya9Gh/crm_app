import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:crm_smart/ui/widgets/app_photo_viewer.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../api/api.dart';
import '../../../constants.dart';
import '../../../core/common/helpers/check_sorage_permission.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/end_points.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../model/invoiceModel.dart';
import '../../widgets/custom_widget/row_edit.dart';
import '../../widgets/custom_widget/text_uitil.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/invoice_widget/file_viewer_widget.dart';
import '../../widgets/pick_image_bottom_sheet.dart';

class InvoiceFileGalleryPage extends StatefulWidget {
  const InvoiceFileGalleryPage({Key? key}) : super(key: key);

  @override
  State<InvoiceFileGalleryPage> createState() => _InvoiceFileGalleryPageState();
}

class _InvoiceFileGalleryPageState extends State<InvoiceFileGalleryPage> {
  late invoice_vm invoiceVm;
  File? recordCommercialImage;
  String? imageRecord;
  bool isDeleteRecordCommercialImageNetworkImage = false;
  late List<FileAttach> filesAttach;
  List<String> deletedFiles = [];
  late InvoiceModel currentInvoice;

  @override
  void initState() {
    invoiceVm = context.read<invoice_vm>();

    currentInvoice = invoiceVm.currentInvoice!;
    imageRecord = currentInvoice.imageRecord;
    filesAttach = currentInvoice.filesAttach ?? [];
    super.initState();
  }

  @override
  void deactivate() {
    invoiceVm.isLoadingCrudFiles = false;
    super.deactivate();
  }

  showAlertDialog(BuildContext context, String mess) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("cancel"),
      onPressed: () {
        invoiceVm = context.read<invoice_vm>();

        currentInvoice = invoiceVm.currentInvoice!;
        imageRecord = currentInvoice.imageRecord;
        filesAttach = currentInvoice.filesAttach ?? [];
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text(mess),
      actions: [remindButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<File> createFileOfPdfUrl(String url) async {
    Completer<File> completer = Completer();
    try {
      final response = await Api().get(url: url);
      final bytes = response.bodyBytes;
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/pdf.pdf");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<invoice_vm>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("مرفقات الفاتورة"),
            centerTitle: true,
            backgroundColor: kMainColor,
            actions: [
              if (value.isLoadingCrudFiles)
                Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
              else
                TextButton(
                  onPressed: () => _onSave(),
                  child: Text("حفظ",
                      style: TextStyle(
                          fontFamily: kfontfamily2,
                          fontWeight: FontWeight.w600)),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                ),
              10.horizontalSpaceRadius,
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: REdgeInsetsDirectional.only(start: 10.0),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: RowEdit(name: AppStrings.labelImage, des: '')),
              ),
              SizedBox(height: 10),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: REdgeInsetsDirectional.only(end: 10.0, start: 10),
                  alignment: Alignment.center,
                  child: recordCommercialImage != null
                      ? Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: FileViewerWidget(
                                  file: recordCommercialImage,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => pickImage((context, file) =>
                                          onPickCommercialRecordImage(file)),
                                      borderRadius: BorderRadius.circular(90),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        margin:
                                            EdgeInsets.only(top: 10, right: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(Icons.attachment_rounded,
                                            color: Colors.grey.shade700,
                                            size: 20),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          onDeleteCommercialRecordImage(),
                                      borderRadius: BorderRadius.circular(90),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        margin:
                                            EdgeInsets.only(top: 10, left: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.delete_rounded,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : ((imageRecord?.isNotEmpty ?? false) &&
                              !isDeleteRecordCommercialImageNetworkImage)
                          ? InkWell(
                              onTap: () => AppFileViewer(urls: [imageRecord!])
                                  .show(context),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: FileViewerWidget(
                                        fileUrl: imageRecord,
                                      ),
                                    ),
                                  ),
                                  if (context
                                      .read<PrivilegeCubit>()
                                      .checkPrivilege('146'))
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () => pickImage((context,
                                                      file) =>
                                                  onPickCommercialRecordImage(
                                                      file)),
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(
                                                    top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                    Icons.attachment_rounded,
                                                    color: Colors.grey.shade700,
                                                    size: 20),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () =>
                                                  onDeleteCommercialRecordImage(),
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(
                                                    top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.delete_rounded,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            )
                          : InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () => pickImage((context, file) =>
                                  onPickCommercialRecordImage(file)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.attachment_rounded,
                                      color: Colors.grey.shade700, size: 35),
                                  SizedBox(height: 0),
                                  Text(
                                    'Attach image',
                                    style: context.textTheme.titleMedium
                                        ?.copyWith(
                                            fontFamily: kfontfamily2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade600),
                                  )
                                ],
                              ),
                            ),
                ),
              ),
              // if (imageRecord?.isNotEmpty ?? false) ...{
              //   SizedBox(height: 10),
              //   Directionality(
              //     child: Padding(
              //       padding: REdgeInsetsDirectional.only(start: 10.0),
              //       child: RowEdit(name: label_image, des: ''),
              //     ),
              //     textDirection: TextDirection.rtl,
              //   ),
              //   SizedBox(height: 10),
              //   Container(
              //     height: 200,
              //     margin: REdgeInsetsDirectional.only(end: 10.0, start: 10),
              //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              //     alignment: AlignmentDirectional.centerEnd,
              //     child: InkWell(
              //       onTap: () => AppPhotoViewer(urls: [imageRecord!]).show(context),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(15),
              //         child: FancyImageShimmerViewer(
              //           imageUrl: imageRecord!,
              //           fit: BoxFit.cover,
              //           width: double.infinity,
              //         ),
              //       ),
              //     ),
              //   ),
              // },

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.rtl,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      10.horizontalSpaceRadius,
                      TextUtilis(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        textstring: ':مرفقات الفاتورة',
                        underline: TextDecoration.none,
                      ),
                    ],
                  ),
                  TextButton(onPressed: pickImages, child: Text("إضافة"))
                ],
              ),
              if (filesAttach.isNotEmpty)
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      crossAxisSpacing: 15.r,
                      mainAxisSpacing: 10.r,
                    ),
                    padding: REdgeInsets.only(bottom: 20, left: 10, right: 10),
                    itemBuilder: (context, index) {
                      final attachFile = filesAttach[index];
                      if (attachFile.file != null ||
                          (attachFile.fileAttach?.endsWith('.pdf') ?? false)) {
                        return fileImage(attachFile, index);
                      } else {
                        return networkImage(attachFile, index);
                      }
                    },
                    itemCount: filesAttach.length,
                    scrollDirection: Axis.vertical,
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  void _onSave() {
    Map<String, String> deleteFilesMap = {};

    deletedFiles.forEachIndexed((i, e) {
      deleteFilesMap["id_files[$i]"] = e;
    });

    final body = {
      "image_record": isDeleteRecordCommercialImageNetworkImage
          ? ""
          : imageRecord?.split('/').last ?? "",
      ...deleteFilesMap,
    };

    final invoiceId = currentInvoice.idInvoice!;
    final files = filesAttach
        .where((element) => element.file != null)
        .map((e) => File(e.file!.path))
        .toList();

    invoiceVm.curdInvoiceFiles(
      body: body,
      invoiceId: invoiceId,
      file: recordCommercialImage,
      files: files,
      onSucess: () => AppNavigator.pop(),
      onFail: (value) => failError(value),
    );
  }

  Widget fileImage(FileAttach fileAttach, int index) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: (fileAttach.file?.name.ext == '.pdf' ||
                          (fileAttach.fileAttach?.endsWith('.pdf') ?? false))
                      ? InkWell(
                          onTap: () => invoice_vm().openFile(
                              attachFile: fileAttach,
                              baseUrl: EndPoints.baseUrls.urlfile),
                          child: Container(
                              width: 110,
                              decoration: BoxDecoration(
                                  color: kMainColor.withOpacity(0.1)),
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

                  // _getFile(fileAttach),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => deleteFileAttach(index),
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
                      child: Icon(Icons.delete_rounded,
                          color: Colors.red, size: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        5.verticalSpacingRadius,
        TextScroll(
          (fileAttach.file?.path.name ?? '') + "   ",
          mode: TextScrollMode.endless,
          velocity: Velocity(pixelsPerSecond: Offset(45, 0)),
          delayBefore: Duration(milliseconds: 2000),
          pauseBetween: Duration(milliseconds: 1000),
          style: TextStyle(fontFamily: kfontfamily2),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        )
      ],
    );
  }

  InkWell _getFile(FileAttach fileAttach) {
    if (fileAttach.file != null ||
        (fileAttach.fileAttach?.endsWith('.pdf') ?? false)) {
      return InkWell(
        onTap: () => invoiceVm.openFile(
            attachFile: fileAttach, baseUrl: EndPoints.baseUrls.urlfile),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
            child: Icon(Icons.picture_as_pdf_rounded, color: Colors.grey)),
      );
    } else {
      return InkWell(
        onTap: () => AppFileViewer(
          imageSource: ImageSourceViewer.network,
          urls: [EndPoints.baseUrls.urlfile + fileAttach.fileAttach!],
        ).show(context),
        child: FancyImageShimmerViewer(
          imageUrl: EndPoints.baseUrls.urlfile + fileAttach.fileAttach!,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget networkImage(FileAttach fileAttach, int index) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () => AppFileViewer(
                      imageSource: ImageSourceViewer.network,
                      urls: [
                        EndPoints.baseUrls.urlfile + fileAttach.fileAttach!
                      ],
                    ).show(context),
                    child: FancyImageShimmerViewer(
                      imageUrl: EndPoints.baseUrls.urlfile +
                          (fileAttach.fileAttach ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (context.read<PrivilegeCubit>().checkPrivilege('146'))
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        deletedFiles.add(fileAttach.id!);
                        deleteFileAttach(index);
                      },
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
                        child: Icon(Icons.delete_rounded,
                            color: Colors.red, size: 17),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        5.verticalSpacingRadius,
        TextScroll(
          fileAttach.fileAttach!.name + "   ",
          mode: TextScrollMode.endless,
          velocity: Velocity(pixelsPerSecond: Offset(45, 0)),
          delayBefore: Duration(milliseconds: 2000),
          pauseBetween: Duration(milliseconds: 1000),
          style: TextStyle(fontFamily: kfontfamily2),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        )
      ],
    );
  }

  pickImage(PickFileCallback onPickFile) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(onPickFile: onPickFile),
    );
  }

  void onPickCommercialRecordImage(File file) {
    recordCommercialImage = file;
    setState(() {});
  }

  void onDeleteCommercialRecordImage() {
    if ((imageRecord?.isNotEmpty ?? false) &&
        !isDeleteRecordCommercialImageNetworkImage) {
      isDeleteRecordCommercialImageNetworkImage = true;
      setState(() {});
      return;
    }

    recordCommercialImage = null;
    setState(() {});
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

    addOnFilesAttach(
      result.files.map((e) => FileAttach(file: XFile(e.path!))).toList(),
      () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("أكثر عدد مسموح به هو 20 ملف."))),
    );
  }

  addOnFilesAttach(List<FileAttach> files, VoidCallback onLimitExceeded) {
    final count = maxFilesAttach - filesAttach.length;
    if (count <= 0) {
      onLimitExceeded();
      return;
    } else {
      final attaches = files.take(count);
      filesAttach.addAll(attaches);
      setState(() {});
    }
  }

  deleteFileAttach(int index) {
    filesAttach.removeAt(index);
    setState(() {});
  }

  failError(String messsageError) {
    print('in call');
    showAlertDialog(context, messsageError);
    // Navigator.pop(context);
  }

  final int maxFilesAttach = 20;
}
