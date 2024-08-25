import 'dart:io';

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/common/helpers/input_validator.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../core/utils/app_strings.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/container_boxShadows.dart';
import 'image_profile.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final UserProvider _userProvider;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController nameUserController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);

    nameUserController.text = _userProvider.currentUser.nameUser ?? '';
    mobileController.text = _userProvider.currentUser.mobile ?? '';
    emailController.text = _userProvider.currentUser.email ?? '';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameUserController.dispose();
    mobileController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        actions: [
          IconButton(
            icon: const AppIcon(Icons.check),
            onPressed: () {
              if (_globalKey.currentState!.validate()) {
                _globalKey.currentState!.save();

                Map<String, String?> body = {
                  'email': emailController.text,
                  'nameUser': nameUserController.text,
                  'mobile': mobileController.text,
                };
                _userProvider.updateUserVm(
                  body,
                  _userProvider.currentUser.idUser,
                  _prepareFile(),
                );
                AppSnackbar.showSnakeBar(AppStrings.labelEditUser);
                AppNavigator.pop();
              }
            },
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, userVM, child) {
          return ModalProgressHUD(
            inAsyncCall: userVM.isUpdate,
            child: SingleChildScrollView(
              child: ContainerShadows(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ImageProfile(),
                      ),
                      Form(
                        key: _globalKey,
                        child: Column(
                          children: [
                            10.height,
                            _buildAlignedText('الإسم'),
                            5.height,
                            AppTextField(
                              hintText: 'الإسم',
                              controller: nameUserController,
                              validator: InputValidator.requiredFiled,
                            ),
                            10.height,
                            _buildAlignedText('البريد الإلكتروني'),
                            5.height,
                            AppTextField(
                              hintText: 'البريد الإلكتروني',
                              controller: emailController,
                              validator: InputValidator.requiredFiled,
                            ),
                            10.height,
                            _buildAlignedText(AppStrings.labelMobile),
                            5.height,
                            AppTextField(
                              hintText: AppStrings.labelMobile,
                              controller: mobileController,
                              validator: InputValidator.requiredFiled,
                            ),
                            20.height,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Align _buildAlignedText(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppText(
        text,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  File? _prepareFile() {
    return (_userProvider.currentUser.path?.isNotEmpty ?? false)
        ? File(_userProvider.currentUser.path!)
        : null;
  }
}
