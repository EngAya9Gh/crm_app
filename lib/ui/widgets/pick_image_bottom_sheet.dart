import 'dart:io';
import 'dart:ui';

import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/common/helpers/checkSoragePermission.dart';

typedef PickFileCallback = Function(BuildContext context, File file);

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
    final file = await pickImage(source);
    if (!mounted) return;

    if (file != null) {
      Navigator.of(context).pop();
    } else {
      return;
    }

    widget.onPickFile(context, file);
  }

  Future<void> onSelectSourceFile(BuildContext context) async {
    final file = await pickSingleFile();
    if (!mounted) return;

    if (file != null) {
      Navigator.of(context).pop();
    } else {
      return;
    }

    widget.onPickFile(context, file);
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

  Future<File?> pickSingleFile() async {
    if (!(await checkStoragePermission())) return null;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'webp', 'dng', 'heic', 'pdf'],
      type: FileType.custom,
    );
    if (result == null) {
      return null;
    }
    File file = File(result.files.single.path.toString());
    return file;
  }
}
