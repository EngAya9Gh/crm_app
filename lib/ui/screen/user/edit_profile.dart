import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/common/helpers/input_validator.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/config/navigator/app_navigator.dart';
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
        title: ' ',
        actions: [
          IconButton(
            icon: const AppIcon(Icons.check),
            onPressed: () async {
              if (_globalKey.currentState!.validate()) {
                _globalKey.currentState!.save();

                Map<String, String?> body = {
                  'email': emailController.text,
                  'nameUser': nameUserController.text,
                  'mobile': mobileController.text,
                  'isActive': _userProvider.currentUser.isActive
                };
                await _userProvider.updateUserVm(
                  body: body,
                  iduser: _userProvider.currentUser.idUser,
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
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 80, top: 20),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: ImageProfile(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        AppText(
                          _userProvider.currentUser.nameUser.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -40),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: _globalKey,
                          child: Column(
                            children: [
                              _buildInfoItem(
                                icon: Icons.email_outlined,
                                title: 'Email',
                                controller: emailController,
                              ),
                              Divider(height: 30),
                              _buildInfoItem(
                                icon: Icons.phone_outlined,
                                title: 'Phone',
                                controller: mobileController,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.grey, size: 20),
            SizedBox(width: 10),
            AppText(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        AppTextField(
          controller: controller,
          validator: InputValidator.requiredFiled,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
