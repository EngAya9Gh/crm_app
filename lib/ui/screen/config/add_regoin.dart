import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/app_card_row.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/custom_widget/text_form.dart';

class addregoin extends StatefulWidget {
  addregoin(
      {required this.nameregoin,
      required this.fk_country,
      required this.idregoin,
      Key? key})
      : super(key: key);
  String? idregoin, nameregoin, fk_country;

  @override
  _addregoinState createState() => _addregoinState();
}

class _addregoinState extends State<addregoin> {
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
    return Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<RegionProvider>(context).isLoading,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 150, right: 20, left: 20, bottom: 150),
              child: ContainerShadows(
                width: double.infinity,
                //height: 400,
                margin: EdgeInsets.only(),
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    AppCardRow(title: 'الفروع', value: '*'),
                    SizedBox(
                      height: 15,
                    ),
                    EditTextFormField(
                      vaildator: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل فارغ';
                        }
                      },
                      hintText: '',
                      controller: namelevel,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      width: double.infinity,
                      //MediaQuery.of(context).size.width * 0.2,
                      text: 'حفظ',
                      onTap: () async {
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();

                          if (widget.idregoin == null) {
                            Provider.of<RegionProvider>(context, listen: false)
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
                            Provider.of<RegionProvider>(context, listen: false)
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
