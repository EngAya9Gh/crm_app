import 'dart:io';

import 'package:flutter/material.dart';

import '../models/file_model.dart';
import 'app_cached_network_image.dart';
import 'custom_error_widget.dart';

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
    String? path;
    if (fileModel?.file?.path.startsWith('http') == true) {
      path = fileModel?.file?.path;
    }

    if (path != null) return _buildNetworkImage(path);

    path = fileModel?.file?.path;

    if (path != null) return _buildLocalImage(path);

    path = fileModel?.url;

    if (path != null) return _buildNetworkImage(path);

    path = fileModel?.path;

    if (path != null) return _buildLocalImage(path);

    return AppErrorWidget(message: 'No image found');
  }

  Widget _buildLocalImage(String path) {
    return Image.file(
      File(path),
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
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
