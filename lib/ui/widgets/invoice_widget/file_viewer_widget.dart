import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../fancy_image_shimmer_viewer.dart';

class FileViewerWidget extends StatelessWidget {
  const FileViewerWidget({Key? key, this.fileUrl, this.file});

  final String? fileUrl;
  final File? file;

  @override
  Widget build(BuildContext context) {
    if (file == null && fileUrl == null) {
      throw ArgumentError('file and fileUrl cannot be null at the same time');
    }
    return file != null
        ? file!.path.endsWith('.pdf')
            ? SfPdfViewer.file(
                file!,
              )
            : Image.file(
                file!,
                fit: BoxFit.cover,
              )
        : fileUrl!.endsWith('.pdf')
            ? SfPdfViewer.network(
                fileUrl!,
              )
            : FancyImageShimmerViewer(
                imageUrl: fileUrl!,
                fit: BoxFit.cover,
              );
  }
}
