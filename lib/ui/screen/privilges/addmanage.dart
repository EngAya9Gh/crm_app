import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../provider/loadingprovider.dart';
import '../../../provider/manage_provider.dart';

class AddManagement extends StatefulWidget {
  AddManagement({
    super.key,
    required this.name_mange,
    required this.fk_country,
    required this.idmange,
  });

  String? idmange, name_mange, fk_country;

  @override
  _AddManagementState createState() => _AddManagementState();
}

class _AddManagementState extends State<AddManagement> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController namelevel = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    namelevel.text =
        widget.name_mange == null ? '' : widget.name_mange.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(title: 'إضافة إدارة'),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: AppCardContainer(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      AppText('الإدارة*'),
                      SizedBox(
                        height: 15,
                      ),
                      AppTextField(
                        hintText: 'الإدارة',
                        controller: namelevel,
                        isRequired: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppElevatedButton(
                        text: 'حفظ',
                        width: double.infinity,
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            Provider.of<LoadProvider>(context, listen: false)
                                .changebooladdclient(true);
                            if (widget.name_mange == null) {
                              Provider.of<manage_provider>(context,
                                      listen: false)
                                  .addmanage_vm({
                                'name_mange': namelevel.text
                              }).then((value) => value != "error"
                                      ? clear(context)
                                      : error(context));
                            } else {
                              Provider.of<manage_provider>(context,
                                      listen: false)
                                  .update_manage({
                                'fk_country': widget.fk_country.toString(),
                                'name_mange': namelevel.text
                              }, widget.idmange.toString()).then((value) =>
                                      value != "error"
                                          ? clear(context)
                                          : error(context));
                            }
                          } else {
                            AppSnackbar.showSnakeBar(
                              'الحقل فارغ',
                              color: ToastColorsEnum.warning,
                            );
                          }
                        },
                        //child: Text(" حفظ"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  clear(BuildContext context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    namelevel.text = "";
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('تمت الإضافة بنجاح')));
    Navigator.pop(context);
    //
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
  }
}
