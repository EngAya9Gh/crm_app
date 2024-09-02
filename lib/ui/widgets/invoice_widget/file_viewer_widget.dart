import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../fancy_image_shimmer_viewer.dart';
import '../pdf_with_zoom_icon.dart';

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
        ? PdfWithZoomIcon(
            file: File(file!.path),
            fileUrl: fileUrl,
          )
        : file != null
            ? Image.file(
                File(file!.path),
                fit: BoxFit.cover,
              )
            : FancyImageShimmerViewer(
                imageUrl: fileUrl!,
                fit: BoxFit.cover,
              );
  }

  _isPdfFile() {
    return file != null && file!.path.endsWith('.pdf') ||
        fileUrl != null && fileUrl!.endsWith('.pdf');
  }
}
