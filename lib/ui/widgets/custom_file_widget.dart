import 'dart:io';

import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../features/clients_list/data/models/client_support_file_model.dart';

class CustomFileWidget extends StatelessWidget {
  const CustomFileWidget({
    Key? key,
    this.onDelete,
    required this.fileModel,
  }) : super(key: key);

  final ClientSupportFileModel fileModel;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 110,
      child: Stack(
        children: [
          Positioned.fill(
            child: InkWell(
              onTap: () => invoice_vm().openFile(
                  attachFile: FileAttach(fileAttach: fileModel.fileUrl)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: fileModel.file!.path.mimeType?.contains("image") == true
                    ? Image.file(
                        File(fileModel.file!.path),
                        fit: BoxFit.cover,
                        width: 110,
                      )
                    : Container(
                        width: 110,
                        decoration:
                            BoxDecoration(color: kMainColor.withOpacity(0.1)),
                        child: Icon(
                          Icons.picture_as_pdf_rounded,
                          color: Colors.grey,
                        )),
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
}
