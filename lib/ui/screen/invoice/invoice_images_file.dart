import 'dart:io';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
                height: 100,
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
      height: 100,
      width: 100,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(File(fileAttach.file!.path), fit: BoxFit.cover),
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
              child: FancyImageShimmerViewer(
                imageUrl: urlfile + fileAttach.fileAttach!,
                fit: BoxFit.cover,
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
                  height: 40,
                  width: 40,
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
    ImagePicker imagePicker = ImagePicker();
    final images = await imagePicker.pickMultiImage();
    if (images.isEmpty) {
      return;
    }

    invoiceVm.addOnFilesAttach(
      images.map((e) => FileAttach(file: e)).toList(),
      () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("أكثر عدد مسموح به هو 20 صورة."))),
    );
  }
}
