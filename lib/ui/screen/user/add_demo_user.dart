import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../view_model/maincity_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../../view_model/usertest_vm.dart';

class AddDemoUser extends StatefulWidget {
  AddDemoUser(
      {this.des_usertest,
      required this.nameusertest,
      required this.idregoin,
      Key? key})
      : super(key: key);
  String? idregoin, nameusertest, des_usertest;

  @override
  _AddDemoUserState createState() => _AddDemoUserState();
}

class _AddDemoUserState extends State<AddDemoUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController nameusertest = TextEditingController();
  final TextEditingController desusertest = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameusertest.text = (widget.idregoin == null ? '' : widget.nameusertest)!;
    desusertest.text = (widget.idregoin == null ? '' : widget.des_usertest)!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          title:
              '${widget.nameusertest == null ? 'إضافة' : 'تعديل'} يوزر تجريبي',
        ),
        body: Center(
          child: AppCardContainer(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: ModalProgressHUD(
              inAsyncCall: Provider.of<MainCityProvider>(context).isloading,
              child: SingleChildScrollView(
                child: Form(
                  key: _globalKey,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.height,
                        AppText('العنوان*'),
                        5.height,
                        AppTextField(
                          hintText: 'العنوان',
                          controller: nameusertest,
                          validator: InputValidator.requiredFiled,
                        ),
                        10.height,
                        AppText('الوصف*'),
                        5.height,
                        AppTextField(
                          hintText: 'الوصف',
                          controller: desusertest,
                          validator: InputValidator.requiredFiled,
                        ),
                        20.height,
                        AppElevatedButton(
                          text: 'حفظ',
                          width: double.infinity,
                          onPressed: () async {
                            if (!_globalKey.currentState!.validate()) return;
                            _globalKey.currentState!.save();

                            if (widget.idregoin == null) {
                              _addDemoUser(context);
                            } else {
                              _updateDemoUser(context);
                            }
                          },
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

  void _addDemoUser(BuildContext context) {
    Provider.of<usertest_vm>(context, listen: false).addusertest_vm({
      'nameusertest': nameusertest.text,
      'des_usertest': desusertest.text,
      'fk_country': Provider.of<UserProvider>(context, listen: false)
          .currentUser
          .fkCountry
    }).then((value) => value != "error" ? clear(context) : error(context));
  }

  void _updateDemoUser(BuildContext context) {
    Provider.of<usertest_vm>(context, listen: false).updateusertest_vm({
      'nameusertest': nameusertest.text,
      'des_usertest': desusertest.text,
    }, widget.idregoin.toString()).then(
        (value) => value != "error" ? clear(context) : error(context));
  }

  clear(BuildContext context) {
    nameusertest.text = "";
    desusertest.text = "";
    AppSnackbar.showSnakeBar('تمت الإضافة بنجاح',
        color: ToastColorsEnum.success);
    AppNavigator.pop();
    //
  }

  error(context) {
    AppSnackbar.showSnakeBar('هناك خطأ ما', color: ToastColorsEnum.error);
  }
}
