import 'dart:io';
import 'dart:ui';

import 'package:crm_smart/core/utils/app_file_handler.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/common/extensions/build_context.dart';
import '../../core/common/helpers/check_sorage_permission.dart';

typedef PickFileCallback = Function(BuildContext context, XFile file);

class PickImageBottomSheet extends StatefulWidget {
  const PickImageBottomSheet({
    Key? key,
    required this.onPickFile,
  }) : super(key: key);

  final PickFileCallback onPickFile;

  @override
  State<PickImageBottomSheet> createState() => _PickImageBottomSheetState();
}

class _PickImageBottomSheetState extends State<PickImageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: BottomSheet(
        backgroundColor: Colors.white,
        enableDrag: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        onClosing: () {},
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  "اختر صورة من:",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade600, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                imageSourceWidget(
                  onTap: () async =>
                      await onSelectSource(context, ImageSource.camera),
                  text: "الكاميرا",
                  iconData: Icons.camera,
                ),
                imageSourceWidget(
                  onTap: () async =>
                      await onSelectSource(context, ImageSource.gallery),
                  text: "المعرض",
                  iconData: Icons.image_rounded,
                ),
                imageSourceWidget(
                  onTap: () async => await onSelectSourceFile(context),
                  text: "الملفات",
                  iconData: Icons.image_rounded,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSelectSource(BuildContext context, ImageSource source) async {
    if (source == ImageSource.camera) {
      final pickedFile = await pickImage(source);
      if (pickedFile == null) return;
      AppNavigator.pop();
      final XFile xFile = XFile(pickedFile.path);
      widget.onPickFile(context, xFile);
      return;
    }

    final pickedFile = await AppFileHandler.pickSinge(
      type: FileType.image,
    );

    if (!mounted) return;

    if (pickedFile == null) return;

    AppNavigator.pop();

    widget.onPickFile(context, pickedFile.file!);
  }

  Future<void> onSelectSourceFile(BuildContext context) async {
    final pickedFile = await AppFileHandler.pickSinge(type: FileType.any);

    if (!mounted) return;

    if (pickedFile == null) return;

    AppNavigator.pop();

    widget.onPickFile(context, pickedFile.file!);
  }

  Widget imageSourceWidget({
    required VoidCallback onTap,
    required String text,
    required IconData iconData,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(iconData, color: context.theme.colorScheme.primary),
            SizedBox(width: 16),
            Text(
              text,
              style: context.textTheme.titleSmall
                  ?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> pickImage(ImageSource source) async {
    if (!(await checkStoragePermission())) return null;
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      return null;
    }

    return File(pickedFile.path);
  }
}
