import 'dart:io';

import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/image_error_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../view_model/user_vm_provider.dart';

class ImageProfile extends StatefulWidget {
  ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  late final UserProvider _userProvider;
  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    _userProvider = context.read<UserProvider>();
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
                    color: AppColors.primaryColor,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          if (pickedFile != null) ...[
            AppElevatedButton(
              text: 'حفظ',
              onPressed: () {
                _userProvider.updateProfileImage(
                  file: _prepareFile(),
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
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final currentUser = userProvider.currentUser;

    if (currentUser.path?.isNotEmpty ?? false) {
      return _buildLocalImage(currentUser.path!);
    } else if (currentUser.img_image?.isNotEmpty ?? false) {
      return _buildNetworkImage(currentUser.img_image!);
    } else {
      return ImageErrorWidget(name: currentUser.nameUser);
    }
  }

  Widget _buildLocalImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.file(
        File(path),
        width: 1000,
        height: 1000,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          return ImageErrorWidget(
            name: Provider.of<UserProvider>(context, listen: true)
                .currentUser
                .nameUser,
          );
        },
      ),
    );
  }

  Widget _buildNetworkImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: AppCachedNetworkImage(
        width: 1000,
        height: 1000,
        fit: BoxFit.fill,
        imageUrl: url,
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
    final pickedImage = await imagePicker.pickImage(
        source: source, imageQuality: 100, maxHeight: 1000, maxWidth: 1000);

    if (pickedImage == null) return;

    pickedFile = File(pickedImage.path);
    Provider.of<UserProvider>(context, listen: false)
        .setImagePath(pickedFile!.path);

    setState(() {});
    AppNavigator.pop(result: pickedFile != null);
  }

  File? _prepareFile() {
    return (_userProvider.currentUser.path?.isNotEmpty ?? false)
        ? File(_userProvider.currentUser.path!)
        : null;
  }
}
