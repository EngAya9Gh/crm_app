import 'package:crm_smart/core/common/widgets/app_platform_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/common/models/file_model.dart';
import '../app_platform_pdf.dart';
import '../fancy_image_shimmer_viewer.dart';

class FileViewerWidget extends StatelessWidget {
  const FileViewerWidget({Key? key, this.fileUrl, this.file});

  final String? fileUrl;
  final XFile? file;

  @override
  Widget build(BuildContext context) {
    if (file == null && fileUrl == null) {
      throw ArgumentError('file and fileUrl cannot be null at the same time');
    }

    return _isPdfFile()
        ? AppPlatformPdf(
            file: file,
            fileUrl: fileUrl,
          )
        : file != null
            ? AppPlatformImage(
                fileModel: FileModel(file: file),
                fit: BoxFit.cover,
              )
            : FancyImageShimmerViewer(
                imageUrl: fileUrl!,
                fit: BoxFit.cover,
              );
  }

  _isPdfFile() {
    return file != null && file!.path.endsWith('.pdf') ||
        file != null && file!.name.endsWith('.pdf') ||
        fileUrl != null && fileUrl!.endsWith('.pdf');
  }
}
