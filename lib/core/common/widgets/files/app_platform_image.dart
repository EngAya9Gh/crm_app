import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/file_model.dart';
import '../app_cached_network_image.dart';
import '../custom_error_widget.dart';

class AppPlatformImage extends StatelessWidget {
  const AppPlatformImage({
    super.key,
    this.fileModel,
    this.fit,
    this.width,
    this.height,
    this.errorWidget,
  });

  final FileModel? fileModel;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    String? filePath;

    String? tempPath = _prepareUrl(fileModel?.file?.path);
    if (tempPath?.startsWith('http') == true) filePath = fileModel?.file?.path;

    if (filePath != null) return _buildNetworkImage(filePath);

    filePath = fileModel?.path;

    if (filePath != null) return _buildLocalImage(filePath);

    filePath = fileModel?.url;

    if (filePath != null) return _buildNetworkImage(filePath);

    filePath = fileModel?.file?.path;

    if (filePath != null) return _buildLocalImage(filePath);

    return AppErrorWidget(message: 'No image found');
  }

  String? _prepareUrl(String? path) {
    String? tempPath = fileModel?.file?.path;
    final String prefix = 'blob:';
    if (tempPath != null && tempPath.contains(prefix)) {
      return tempPath.replaceFirst('blob:', '');
    }
    return path;
  }

  Widget _buildLocalImage(String path) {
    return Image.file(
            File(path),
            fit: fit ?? BoxFit.cover,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) {
              debugPrint('error in image => $error');
              return errorWidget ??
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  );
            },
          );
  }

  Widget _buildNetworkImage(String path) {
    return AppCachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: path,
    );
  }
}
