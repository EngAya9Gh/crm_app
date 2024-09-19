import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/common/models/file_model.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/files/app_platform_image.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_file_handler.dart';
import '../../../view_model/user_vm_provider.dart';

class ImageProfile extends StatefulWidget {
  ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  late final UserProvider _userProvider;

  ImagePicker imagePicker = ImagePicker();

  FileModel pickedFile = FileModel();

  @override
  void initState() {
    _userProvider = context.read<UserProvider>();

    pickedFile = pickedFile.copyWith(
      url: AppConstants.currentUser.img_image,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 85.0,
                child: _buildProfileImage(context),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      backgroundColor: Colors.blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      context: context,
                      builder: (context) => bottomSheet(context),
                    );
                  },
                  child: AppIcon(
                    Icons.camera,
                    color: AppColors.primaryMain,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          5.height,
          if (pickedFile.file != null) ...[
            AppElevatedButton(
              text: 'حفظ',
              onPressed: () {
                if (pickedFile.file == null) return;
                _userProvider.updateProfileImage(
                  file: pickedFile.file,
                  iduser: AppConstants.currentUser.idUser,
                );
              },
            )
          ],
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: AppPlatformImage(
        fileModel: pickedFile,
        width: 1000,
        height: 1000,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Choose Profile Photo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera, context);
                },
                icon: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                label: Text(
                  'Camera',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              TextButton.icon(
                onPressed: () => takePhoto(ImageSource.gallery, context),
                icon: Icon(
                  Icons.open_in_browser,
                  color: Colors.white,
                ),
                label: Text(
                  'Gallery',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source, context) async {
    final selectedFile = await AppFileHandler.pickSingle(
      type: FileType.image,
    );

    if (selectedFile == null) return;

    pickedFile = selectedFile;

    Provider.of<UserProvider>(context, listen: false)
        .setImagePath(pickedFile.file!.path);

    setState(() {});
    AppNavigator.pop(result: true);
  }
}
