import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../provider/loadingprovider.dart';
import '../../../view_model/typeclient.dart';

class AddReason extends StatefulWidget {
  AddReason({
    super.key,
    required this.nameReason,
    required this.idReason,
    required this.type,
  });

  String type;
  String? nameReason;
  String? idReason;

  @override
  State<AddReason> createState() => _AddReasonState();
}

class _AddReasonState extends State<AddReason> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController namereson = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    namereson.text =
        widget.nameReason == null ? '' : widget.nameReason.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ClientTypeProvider>(context).isloading,
          child: AppCardContainer(
            child: Form(
              key: _globalKey,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    AppText("${widget.type == 'client' ? 'السبب' : 'نوع'}*"),
                    SizedBox(height: 15),
                    AppTextField(
                      hintText: 'السبب',
                      controller: namereson,
                      isRequired: true,
                    ),
                    SizedBox(height: 15),
                    AppElevatedButton(
                      text: 'حفظ',
                      width: double.infinity,
                      onPressed: () async {
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();
                          if (widget.idReason == null) {
                            Provider.of<ClientTypeProvider>(context,
                                    listen: false)
                                .addReson_vm({
                              'name_reason': namereson.text,
                              'type': widget.type,
                            }).then((value) => value != "error"
                                    ? clear(context)
                                    : error(context));
                          } else {
                            Provider.of<ClientTypeProvider>(context,
                                    listen: false)
                                .update_resoan({
                              'name_reason': namereson.text,
                              'type': widget.type,
                            }, widget.idReason.toString()).then((value) =>
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
    // Provider.of<LoadProvider>(context, listen: false)
    //     .changebooladdclient(false);
    namereson.text = "";
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
