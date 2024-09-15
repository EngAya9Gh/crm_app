import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/helpers/input_validator.dart';
import '../../../core/common/widgets/app_card_container.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_file_handler.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/app/presentation/widgets/app_text_field.dart.dart';
import '../../../provider/loadingprovider.dart';
import '../../../view_model/company_vm.dart';

class AddCompany extends StatefulWidget {
  AddCompany({super.key});

  @override
  _AddCompanyState createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController nameractv = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  late XFile? _myfilelogo = null;

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: CustomAppBar(title: 'إضافة مؤسسة'),
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<CompanyProvider>(context).isloading,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: AppCardContainer(
                child: Form(
                  key: _globalKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.height,
                        AppText('المؤسسة'),
                        5.height,
                        AppTextField(
                          hintText: 'المؤسسة',
                          controller: nameractv,
                          validator: InputValidator.requiredFiled,
                        ),
                        10.height,
                        AppText('شعار المؤسسة'),
                        5.height,
                        AppTextField(
                          hintText: 'شعار المؤسسة',
                          controller: logoController,
                          onTap: () async {
                            final selectedImage =
                                await AppFileHandler.pickSingle(
                              type: FileType.image,
                            );
                            if (selectedImage == null) return;
                            setState(() {
                              _myfilelogo = selectedImage.file;
                              logoController.text = selectedImage.file!.path;
                            });
                          },
                          readOnly: true,
                        ),
                        10.height,
                        SizedBox(
                          width: double.infinity,
                          child: AppElevatedButton(
                            text: 'حفظ',
                            onPressed: () async {
                              if (_globalKey.currentState!.validate()) {
                                _globalKey.currentState!.save();

                                Provider.of<CompanyProvider>(context,
                                        listen: false)
                                    .addCompany_vm(
                                  {
                                    'name_company': nameractv.text,
                                  },
                                  _myfilelogo,
                                ).then((value) => value != "error"
                                        ? clear(context)
                                        : error(context));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('الحقل فارغ  ')));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  clear(BuildContext context) {
    nameractv.text = "";
    AppSnackbar.showSnakeBar('تمت الإضافة بنجاح');
    AppNavigator.pop();
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    AppSnackbar.showSnakeBar('هناك خطأ ما');
  }
}
