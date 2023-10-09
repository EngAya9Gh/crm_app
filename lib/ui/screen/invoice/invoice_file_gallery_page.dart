import 'dart:io';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:crm_smart/ui/widgets/app_photo_viewer.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../constants.dart';
import '../../../labeltext.dart';
import '../../../model/invoiceModel.dart';
import '../../widgets/custom_widget/row_edit.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';

class InvoiceFileGalleryPage extends StatefulWidget {
  const InvoiceFileGalleryPage({Key? key}) : super(key: key);

  @override
  State<InvoiceFileGalleryPage> createState() => _InvoiceFileGalleryPageState();
}

class _InvoiceFileGalleryPageState extends State<InvoiceFileGalleryPage> {
  late invoice_vm invoiceVm;

  @override
  Widget build(BuildContext context) {
    return Consumer<invoice_vm>(
      builder: (context, value, child) {
        invoiceVm = value;
        final files = value.currentInvoice?.filesAttach ?? [];
        final imageRecord = value.currentInvoice?.imageRecord;
        return Scaffold(
          appBar: AppBar(
            title: Text("مرفقات الفاتورة"),
            centerTitle: true,
            backgroundColor: kMainColor,
          ),
          body: Column(
            children: [
              if (imageRecord?.isNotEmpty ?? false) ...{
                SizedBox(height: 10),
                Directionality(
                  child: Padding(
                    padding: REdgeInsetsDirectional.only(start: 10.0),
                    child: RowEdit(name: label_image, des: ''),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  margin: REdgeInsetsDirectional.only(end: 10.0,start: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  alignment: AlignmentDirectional.centerEnd,
                  child: InkWell(
                    onTap: () => AppPhotoViewer(urls: [imageRecord!]).show(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FancyImageShimmerViewer(
                        imageUrl: imageRecord!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              },
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                    crossAxisSpacing: 15.r,
                    mainAxisSpacing: 10.r,
                  ),
                  padding: REdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  itemBuilder: (context, index) {
                    final attachFile = files[index];
                    if (attachFile.file != null) {
                      return fileImage(attachFile);
                    } else {
                      return networkImage(attachFile);
                    }
                  },
                  itemCount: files.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget fileImage(FileAttach fileAttach) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: fileAttach.file!.path.mimeType?.contains("image") == true
                ? InkWell(
                    onTap: () => AppPhotoViewer(
                      imageSource: ImageSourceViewer.file,
                      files: [File(fileAttach.file!.path)],
                    ).show(context),
                    child: Image.file(
                      File(fileAttach.file!.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                : InkWell(
                    onTap: () => invoiceVm.openFile(fileAttach),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                        child: Icon(Icons.picture_as_pdf_rounded, color: Colors.grey)),
                  ),
          ),
        ),
        5.verticalSpacingRadius,
        TextScroll(
          fileAttach.file!.path.name + "   ",
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

  Widget networkImage(FileAttach fileAttach) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: fileAttach.fileAttach!.mimeType?.contains("image") == true
                ? InkWell(
                    onTap: () => AppPhotoViewer(
                      imageSource: ImageSourceViewer.network,
                      urls: [urlfile + fileAttach.fileAttach!],
                    ).show(context),
                    child: FancyImageShimmerViewer(
                      imageUrl: urlfile + fileAttach.fileAttach!,
                      fit: BoxFit.cover,
                    ),
                  )
                : InkWell(
                    onTap: () => invoiceVm.openFile(fileAttach),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: kMainColor.withOpacity(0.1)),
                        child: Icon(Icons.picture_as_pdf_rounded, color: Colors.grey, size: 30)),
                  ),
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
}
