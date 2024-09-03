import 'package:flutter/material.dart';

import '../../core/common/models/file_model.dart';
import '../../core/common/models/support_attachment_entity.dart';
import '../../core/common/widgets/app_platform_image.dart';
import '../../core/utils/app_colors.dart';
import '../../model/invoiceModel.dart';
import '../../view_model/invoice_vm.dart';
import '../screen/invoice/invoice_images_file.dart';

class CustomFileWidget extends StatelessWidget {
  const CustomFileWidget({
    super.key,
    this.onDelete,
    required this.fileModel,
  });

  final SupportAttachmentEntity fileModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 110,
      child: Stack(
        children: [
          Positioned.fill(
            child: InkWell(
              onTap: () => InvoiceVm().openFile(
                attachFile: FileAttach(fileAttach: fileModel.filePath),
                context: context,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: fileModel.file!.path.mimeType?.contains("image") == true
                    ? AppPlatformImage(
                        fileModel: FileModel(file: fileModel.file!),
                        fit: BoxFit.cover,
                        width: 110,
                      )
                    : Container(
                        width: 110,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1)),
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

  final VoidCallback? onDelete;
}
