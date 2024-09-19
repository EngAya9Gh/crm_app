import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../ui/widgets/app_file_viewer.dart';
import '../../../utils/app_colors.dart';
import '../app_icon.dart';

class AppPlatformPdf extends StatelessWidget {
  const AppPlatformPdf({
    super.key,
    required this.file,
    this.fileUrl,
  });

  final XFile? file;
  final String? fileUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppFileViewer(
          imageSource: kIsWeb
              ? ImageSourceViewer.network
              : file != null
                  ? ImageSourceViewer.file
                  : ImageSourceViewer.network,
          files: file != null ? [file!] : [],
          urls: fileUrl != null ? [fileUrl!] : [],
        ).show(context);
      },
      child: Center(
        child: AppIcon(
          Icons.picture_as_pdf,
          size: 80,
          color: AppColors.primaryMain.withOpacity(0.5),
        ),
      ),
    );
  }
}
