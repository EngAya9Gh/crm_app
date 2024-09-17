import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/user_vm_provider.dart';

class AddRegion extends StatefulWidget {
  AddRegion({
    super.key,
    required this.nameregoin,
    required this.fk_country,
    required this.idregoin,
  });

  String? idregoin, nameregoin, fk_country;

  @override
  State<AddRegion> createState() => _AddRegionState();
}

class _AddRegionState extends State<AddRegion> {
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
        appBar: CustomAppBar(title: 'إضافة فرع'),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<RegionProvider>(context).isLoading,
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
                      AppText('الفروع*'),
                      SizedBox(
                        height: 15,
                      ),
                      AppTextField(
                        hintText: 'الفرع',
                        controller: namelevel,
                        isRequired: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppElevatedButton(
                        width: double.infinity,
                        text: 'حفظ',
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();

                            if (widget.idregoin == null) {
                              Provider.of<RegionProvider>(context,
                                      listen: false)
                                  .addRegionVm({
                                'name_regoin': namelevel.text,
                                'fk_country': Provider.of<UserProvider>(context,
                                        listen: false)
                                    .currentUser
                                    .fkCountry
                                    .toString(),
                              }).then((value) => value != "error"
                                      ? clear(context)
                                      : error(context));
                            } else {
                              Provider.of<RegionProvider>(context,
                                      listen: false)
                                  .updateRegion({
                                'name_regoin': namelevel.text,
                                'id_regoin': widget.idregoin,
                                'fk_country': widget.fk_country,
                              }, widget.idregoin.toString()).then((value) =>
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
    namelevel.text = "";
    AppSnackbar.showSnakeBar(
      'تمت الإضافة بنجاح',
      color: ToastColorsEnum.success,
    );
    AppNavigator.pop();
  }

  error(context) {
    AppSnackbar.showSnakeBar(
      'هناك خطأ ما',
      color: ToastColorsEnum.error,
    );
  }
}
