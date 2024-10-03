import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:flutter/material.dart';

import '../../core/common/models/support_attachment_entity.dart';
import '../../core/common/widgets/app_icon.dart';
import '../../core/common/widgets/files/file_viewer_widget.dart';
import '../../model/invoiceModel.dart';
import '../../view_model/invoice_vm.dart';

class CardAttachment extends StatefulWidget {
  const CardAttachment({
    super.key,
    this.onDelete,
    required this.fileModel,
  });

  final SupportAttachmentEntity fileModel;

  @override
  State<CardAttachment> createState() => _CardAttachmentState();

  final VoidCallback? onDelete;
}

class _CardAttachmentState extends State<CardAttachment> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 110,
      child: Stack(
        children: [
          if (isLoading) ...[
            Positioned.fill(child: AppLoader()),
          ],
          Positioned.fill(
            child: InkWell(
              onTap: () async {
                isLoading = true;
                setState(() {});
                await InvoiceVm().openFile(
                  attachFile: FileAttach(
                    fileAttach: widget.fileModel.filePath,
                    file: widget.fileModel.file,
                  ),
                  context: context,
                );
                isLoading = false;
                setState(() {});
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FileViewerWidget(
                  file: widget.fileModel.file,
                  fileUrl: widget.fileModel.file?.path,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: widget.onDelete,
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
        ],
      ),
    );
  }
}
