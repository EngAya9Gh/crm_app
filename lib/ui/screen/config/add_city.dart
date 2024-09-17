import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../view_model/maincity_vm.dart';

class AddCity extends StatefulWidget {
  AddCity(
      {this.fkmain, required this.nameregoin, required this.idregoin, Key? key})
      : super(key: key);
  String? idregoin, nameregoin, fkmain;

  @override
  _AddCityState createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
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
        appBar: CustomAppBar(title: 'إضافة مدينة'),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<MainCityProvider>(context).isloading,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: AppCardContainer(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      AppText(
                          "${widget.idregoin == null ? 'إضافة' : 'تعديل'} مدينة"),
                      SizedBox(
                        height: 15,
                      ),
                      AppTextField(
                        hintText: '',
                        controller: namelevel,
                        validator: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return 'الحقل فارغ';
                          }
                          return null;
                        },
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

                            if (widget.idregoin == null) {
                              Provider.of<MainCityProvider>(context,
                                      listen: false)
                                  .addcity_vm({
                                'name_city': namelevel.text,
                                'fk_maincity': widget.fkmain,
                              }).then((value) => value != "error"
                                      ? clear(context)
                                      : error(context));
                            } else {
                              Provider.of<MainCityProvider>(context,
                                      listen: false)
                                  .update_city({
                                'name_city': namelevel.text,
                                'fk_maincity': widget.fkmain,
                                'id_city': widget.idregoin,
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
