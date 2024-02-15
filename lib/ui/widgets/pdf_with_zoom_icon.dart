import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'app_photo_viewer.dart';

class PdfWithZoomIcon extends StatelessWidget {
  const PdfWithZoomIcon({
    Key? key,
    required this.file,
    this.fileUrl,
  }) : super(key: key);

  final File? file;
  final String? fileUrl;

  @override
  Widget build(BuildContext context) {
    // show pdf with zoom icon on bottom left since we can't click on the pdf to zoom as it's scrollable
    return Stack(
      children: [
        file != null
            ? SfPdfViewer.file(
                file!,
              )
            : SfPdfViewer.network(
                fileUrl!,
              ),
        Positioned(
          bottom: 0,
          left: 0,
          child: IconButton(
            icon: Icon(
              Icons.zoom_in_outlined,
            ),
            style: ButtonStyle(
              iconColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(Colors.white54),
            ),
            // color: Colors.white,
            iconSize: 30,
            onPressed: () {
              return AppFileViewer(
                imageSource: file != null
                    ? ImageSourceViewer.file
                    : ImageSourceViewer.network,
                files: file != null ? [file!] : [],
                urls: fileUrl != null ? [fileUrl!] : [],
              ).show(context);
            },
          ),
        ),
      ],
    );
  }
}
