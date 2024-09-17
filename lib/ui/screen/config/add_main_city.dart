import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../view_model/maincity_vm.dart';
import '../../../view_model/user_vm_provider.dart';

class AddMainCity extends StatefulWidget {
  AddMainCity({
    super.key,
    required this.nameregoin,
    required this.fkcountry,
    required this.idregoin,
  });

  String? idregoin, nameregoin, fkcountry;

  @override
  _AddMainCityState createState() => _AddMainCityState();
}

class _AddMainCityState extends State<AddMainCity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController namelevel = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    namelevel.text =
        widget.idregoin == null ? '' : widget.nameregoin.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(title: 'المنطقة'),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<MainCityProvider>(context).isloading,
          child: AppCardContainer(
            child: Form(
              key: _globalKey,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    AppText('المنطقة'),
                    SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                      hintText: 'المنطقة',
                      controller: namelevel,
                      isRequired: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppElevatedButton(
                      width: double.infinity,
                      //MediaQuery.of(context).size.width * 0.2,
                      text: 'حفظ',
                      onPressed: () async {
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();

                          if (widget.idregoin == null) {
                            Provider.of<MainCityProvider>(context,
                                    listen: false)
                                .addmaincity_vm({
                              'namemaincity': namelevel.text,
                              'fk_country': Provider.of<UserProvider>(context,
                                      listen: false)
                                  .currentUser
                                  .fkCountry
                                  .toString(),
                            }).then((value) => value != "error"
                                    ? clear(context)
                                    : error(context));
                          } else {
                            Provider.of<MainCityProvider>(context,
                                    listen: false)
                                .update_maincity({
                              'namemaincity': namelevel.text,
                              'fk_country': widget.fkcountry,
                            }, widget.idregoin.toString()).then((value) =>
                                    value != "error"
                                        ? clear(context)
                                        : error(context));
                          }
                        } else {
                          AppSnackbar.showSnakeBar('الحقل فارغ',
                              color: ToastColorsEnum.warning);
                        }
                      },
                      //child: Text(" حفظ"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  clear(BuildContext context) {
    namelevel.text = "";
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('تمت الإضافة بنجاح')));
    Navigator.pop(context);
    //
  }

  error(context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
  }
}
