import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_grid.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../api/api.dart';
import '../../../core/common/enums/client/type_client_enum.dart';
import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/helpers/check_sorage_permission.dart';
import '../../../core/common/models/file_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/common/widgets/files/app_platform_image.dart';
import '../../../core/common/widgets/files/file_viewer_widget.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_file_handler.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/end_points.dart';
import '../../../features/app/presentation/widgets/app_drop_down.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/app/presentation/widgets/app_text_button.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../widgets/app_file_viewer.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/pick_image_bottom_sheet.dart';
import 'invoice_images_file.dart';

class InvoiceFileGalleryPage extends StatefulWidget {
  const InvoiceFileGalleryPage({super.key});

  @override
  State<InvoiceFileGalleryPage> createState() => _InvoiceFileGalleryPageState();
}

class _InvoiceFileGalleryPageState extends State<InvoiceFileGalleryPage> {
  late InvoiceVm invoiceVm;
  XFile? recordCommercialImage;
  String? imageRecord;
  bool isDeleteRecordCommercialImageNetworkImage = false;
  late List<FileAttach> filesAttach;
  List<FileAttach> addNewFilesAttached=[];
  List<String> deletedFiles = [];
  late InvoiceModel currentInvoice;

  final List<String> allowedExtensions = ["pdf", "PDF"];

  @override
  void initState() {
    invoiceVm = context.read<InvoiceVm>();

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
    Widget remindButton = AppTextButton(
      child: AppText("cancel"),
      onPressed: () {
        invoiceVm = context.read<InvoiceVm>();

        currentInvoice = invoiceVm.currentInvoice!;
        imageRecord = currentInvoice.imageRecord;
        filesAttach = currentInvoice.filesAttach ?? [];
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: AppText("Error"),
      content: AppText(mess),
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
    return Consumer<InvoiceVm>(
      builder: (context, value, child) {
        return AppScaffold(
          appBar: CustomAppBar(
            title: "مرفقات الفاتورة",
            actions: [
              if (value.isLoadingCrudFiles)
                Center(
                  child: SizedBox(
                    height: 25.scaleIconsSize,
                    width: 25.scaleIconsSize,
                    child: AppLoader(color: AppColors.white),
                  ),
                )
              else
                AppTextButton(
                  text: "حفظ",
                  onPressed: () => _onSave(),
                  textStyle: AppStyles.textStyle.copyWith(color: Colors.white),
                ),
              10.horizontalSpaceRadius,
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                10.height,
                AppText(AppStrings.labelImage),
                5.height,
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: 230.scaleHeight,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => pickImage((context, file) => onPickCommercialRecordImage(file)),
                                        borderRadius: BorderRadius.circular(90),
                                        child: Container(
                                          height: 40.scaleIconsSize,
                                          width: 40.scaleIconsSize,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade50,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: AppIcon(
                                            Icons.attachment_rounded,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => onDeleteCommercialRecordImage(),
                                        borderRadius: BorderRadius.circular(90),
                                        child: Container(
                                          height: 40.scaleIconsSize,
                                          width: 40.scaleIconsSize,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade50,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: AppIcon(
                                            Icons.delete_rounded,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ((imageRecord?.isNotEmpty ?? false) && !isDeleteRecordCommercialImageNetworkImage)
                            ? InkWell(
                                onTap: () => AppFileViewer(urls: [imageRecord!]).show(context),
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
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (context.read<PrivilegesCubit>().checkPrivilege('300'))
                                                  pickImage((context, file) => onPickCommercialRecordImage(file));
                                              },
                                              borderRadius: BorderRadius.circular(90),
                                              child: Container(
                                                height: 40.scaleIconsSize,
                                                width: 40.scaleIconsSize,
                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: AppIcon(Icons.attachment_rounded, color: Colors.grey.shade700, size: 20),
                                              ),
                                            ),
                                            if (context.read<PrivilegesCubit>().checkPrivilege('146'))
                                              InkWell(
                                                onTap: () => onDeleteCommercialRecordImage(),
                                                borderRadius: BorderRadius.circular(90),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  margin: EdgeInsets.only(top: 10, right: 15),
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
                                onTap: () => pickImage((context, file) => onPickCommercialRecordImage(file)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppIcon(
                                      Icons.attachment_rounded,
                                      color: Colors.grey.shade700,
                                      size: 35,
                                    ),
                                    SizedBox(height: 0),
                                    AppText(
                                      'Attach image',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade600,
                                    )
                                  ],
                                ),
                              ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        10.horizontalSpaceRadius,
                        AppText(
                          'مرفقات الفاتورة',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    if (context.read<PrivilegesCubit>().checkPrivilege('146'))
                      AppTextButton(
                        text: "إضافة",
                        onPressed: () {
                          final ValueNotifier<FileAttach?> selectedFile = ValueNotifier(FileAttach(type: 'all'));
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              insetPadding: EdgeInsets.zero,
                              title: AppText('اضافة صورة'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      pickImage(
                                        (context, file) {
                                          selectedFile.value = selectedFile.value?.copyWith(file: file);
                                        },
                                      );
                                    },
                                    behavior: HitTestBehavior.opaque,
                                    child: Container(
                                      height: 250.scaleIconsSize,
                                      width: .9.sw,
                                      margin: EdgeInsetsDirectional.only(bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.circular(12.r), border: Border.all(color: AppColors.primaryMain)),
                                      child: ValueListenableBuilder(
                                        valueListenable: selectedFile,
                                        builder: (context, value, child) {
                                          if (value?.file != null) {
                                            return SizedBox(height: 250.scaleIconsSize, child: fileImage(value!, filesAttach.length - 1, true));
                                          }
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.attachment),
                                              AppText('choose image'),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: selectedFile,
                                    builder: (context, value, child) {
                                      return AppDropdownButtonFormField<TypeSubClientEnum, dynamic>(
                                        items: TypeSubClientEnum.values,
                                        onChange: (value) {
                                          selectedFile.value = selectedFile.value?.copyWith(type: value);
                                        },
                                        hint: "النوع",
                                        itemAsValue: (TypeSubClientEnum? item) => item!.id,
                                        itemAsString: (item) => item!.text,
                                        value: value?.type ?? 'all',
                                        validator: (value) {
                                          if (value == null) {
                                            return 'هذا الحقل مطلوب.';
                                          }
                                          return null;
                                        },
                                      );
                                    },
                                  ),
                                  10.height,
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: AppElevatedButton(
                                            text: 'add',
                                            onPressed: () {
                                              if (selectedFile.value != null) {
                                                if (selectedFile.value?.file != null) {
                                                  addNewFilesAttached=List.of(addNewFilesAttached)..add(selectedFile.value!);
                                                  addOnFilesAttach(
                                                    [selectedFile.value!],
                                                    () => AppSnackbar.showSnakeBar("أكثر عدد مسموح به هو 20 ملف."),
                                                  );
                                                  context.pop();
                                                }
                                                else if(selectedFile.value?.file==null){
                                                  AppSnackbar.showSnakeBar('الحقل الصورة مطلوب',
                                                      color: ToastColorsEnum.warning);
                                                }
                                              }
                                            },
                                          )),
                                      Spacer(),
                                      Expanded(
                                          flex: 2,
                                          child: AppElevatedButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            text: 'cancel',
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                  ],
                ),
                if (filesAttach.isNotEmpty)
                  Expanded(
                    child: AppPaginatedGridView(
                      shrinkWrap: true,
                      items: filesAttach,
                      itemBuilder: (context, index) {
                        Container(
                          width: 200,
                          height: 200,
                          color: Colors.red,
                        );
                        final attachFile = filesAttach[index];
                        if (attachFile.file != null || (attachFile.fileAttach?.endsWith('.pdf') ?? false)) {
                          return SizedBox(height: 250.scaleIconsSize, child: fileImage(attachFile, index));
                        } else {
                          return SizedBox(height: 250.scaleIconsSize, child: networkImage(attachFile, index));
                        }
                      },
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }

  void _onSave() {
    Map<String, String> deleteFilesMap = {};
    Map<String, dynamic> attachFilesMap = {};

    deletedFiles.forEachIndexed((index, id) {
      deleteFilesMap["id_files[$index]"] = id;
    });
    addNewFilesAttached.forEachIndexed((index, fileAttached) {
      if(fileAttached.file!=null){
      attachFilesMap["uploadfiles[$index][file]"] = fileAttached.file!;
      attachFilesMap["uploadfiles[$index][file_type]"] = fileAttached.type;

      }
    });

    final body = {
      ...deleteFilesMap,
      ...attachFilesMap,
    };

    final invoiceId = currentInvoice.idInvoice!;
    final files = filesAttach.where((element) => element.file != null).map((e) => e.file!).toList();

    invoiceVm.curdInvoiceFiles(
      body: body,
      invoiceId: invoiceId,
      file: recordCommercialImage,
      files: files,
      isDeleteFile: isDeleteRecordCommercialImageNetworkImage,
      onSucess: () => AppNavigator.pop(),
      onFail: (errorMessage) => showAlertDialog(context, errorMessage),
    );
  }

  Widget fileImage(FileAttach fileAttach, int index, [bool isAdd = false]) {
    bool isLoading = false;
    var type = TypeSubClientEnum.values.firstWhereOrNull((element) => (element.id == fileAttach.type));
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(12.r),
        boxShadow: <BoxShadow>[
          BoxShadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.white24 //.withOpacity(0.2),
              ),
        ],
      ),
      margin: EdgeInsetsDirectional.only(bottom: (!isAdd) ? 10 : 0, end: 4, start: 4),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: allowedExtensions.any((ext) => fileAttach.file?.name.ext == '.$ext') ||
                            ((fileAttach.file?.name.ext == '.pdf' || fileAttach.file?.name.ext == '.PDF') ||
                                (fileAttach.fileAttach == null
                                    ? false
                                    : (fileAttach.fileAttach!.endsWith('.pdf') || fileAttach.fileAttach!.endsWith('.PDF'))))
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
                                    width: 110,
                                    decoration: BoxDecoration(color: AppColors.primaryMain.withOpacity(0.1)),
                                    child: isLoading
                                        ? AppLoader(padding: 12)
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
                              width: 110,
                            )),

                    // _getFile(fileAttach),
                  ),
                ),
                if (!isAdd)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          if (fileAttach.id == null) {
                            deleteFileAttach(index);
                            return;
                          }
                          deletedFiles.add(fileAttach.id!);
                          deleteFileAttach(index);
                        },
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
                          child: AppIcon(Icons.delete_rounded, color: Colors.red, size: 17),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (!isAdd) 5.verticalSpacingRadius,
          if (!isAdd)
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: TextScroll(
                    "${type?.text ?? fileAttach.type}",
                    mode: TextScrollMode.endless,
                    velocity: Velocity(pixelsPerSecond: Offset(45, 0)),
                    delayBefore: Duration(milliseconds: 2000),
                    pauseBetween: Duration(milliseconds: 1000),
                    style: AppStyles.textStyle,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ),
                ))
        ],
      ),
    );
  }

  Widget networkImage(FileAttach fileAttach, int index) {
    var type = TypeSubClientEnum.values.firstWhereOrNull((element) => (element.text == fileAttach.type));
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
                      urls: [EndPoints.baseUrls.laravelFilesUrl + fileAttach.fileAttach!],
                    ).show(context),
                    child: FancyImageShimmerViewer(
                      imageUrl: EndPoints.baseUrls.laravelFilesUrl + (fileAttach.fileAttach ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (context.read<PrivilegesCubit>().checkPrivilege('146'))
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
                        height: 30.scaleIconsSize,
                        width: 30.scaleIconsSize,
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
        ),
        5.verticalSpacingRadius,
        Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: TextScroll(
                "${type?.text ?? fileAttach.type}",
                mode: TextScrollMode.endless,
                velocity: Velocity(pixelsPerSecond: Offset(45, 0)),
                delayBefore: Duration(milliseconds: 2000),
                pauseBetween: Duration(milliseconds: 1000),
                style: AppStyles.textStyle,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ))
      ],
    );
  }

  pickImage(PickFileCallback onPickFile) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(onPickFile: onPickFile),
    );
  }

  void onPickCommercialRecordImage(XFile file) {
    recordCommercialImage = file;
    setState(() {});
  }

  void onDeleteCommercialRecordImage() {
    if ((imageRecord?.isNotEmpty ?? false) && !isDeleteRecordCommercialImageNetworkImage) {
      isDeleteRecordCommercialImageNetworkImage = true;
      setState(() {});
      return;
    }

    recordCommercialImage = null;
    setState(() {});
  }

  pickImages() async {
    if (!(await checkStoragePermission())) return;
    final selectedFile = await AppFileHandler.pickMultiple(
      type: FileType.custom,
    );

    if (selectedFile == null) return;

    addOnFilesAttach(
      List<FileAttach>.from(selectedFile.map((e) => FileAttach(file: e.file))),
      () => AppSnackbar.showSnakeBar("أكثر عدد مسموح به هو 20 ملف."),
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

  final int maxFilesAttach = 20;
}
