import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/models/config_model.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/productmodel.dart';
import '../../../provider/config_vm.dart';
import '../../../provider/loadingprovider.dart';
import '../../../provider/selected_button_provider.dart';
import '../../../provider/switch_provider.dart';
import '../../../view_model/product_vm.dart';
import '../../../view_model/user_vm_provider.dart';

class addProduct extends StatefulWidget {
  addProduct({super.key});

  @override
  _addProductState createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  bool valtaxrate = false;

  int valtype_product = 0;

  String nameprod = "";

  double price = 0;

  ProductModel? pd;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _globalKey = GlobalKey<FormState>();

  TextEditingController _textName = TextEditingController();

  TextEditingController _textprice = TextEditingController();

  late ConfigModel taxrate;

  bool _isLoading = false;

  void settaxrate(context) {
    List<ConfigModel> _listconfg =
        Provider.of<config_vm>(context, listen: false).listofconfig;

    taxrate =
        _listconfg.firstWhere((element) => element.nameConfig == 'taxrate');
  }

  // String? idCountry;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // idCountry = Provider.of<user_vm_provider>(context, listen: false).currentUser!.fkCountry;

      Provider.of<config_vm>(context, listen: false).getAllConfig();

      Provider.of<switch_provider>(context, listen: false)
          .changeboolValue(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeMedia = MediaQuery.of(context).size.width;
    return AppScaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: 'إضافة منتج'),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddProd,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _globalKey,
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<selected_button_provider>(
                      builder: (context, selectedProvider, child) {
                    return AppCardContainer(
                      child: Center(
                        child: AppGroupButton(
                          groupButtonController: GroupButtonController(
                            selectedIndex: selectedProvider.isSelected,
                          ),
                          buttons: ['أجهزة', 'برامج'],
                          onSelected: (_, index, isSelected) {
                            valtype_product = index;
                            selectedProvider.selectValue(index);
                          },
                        ),
                      ),
                    );
                  }),
                  10.height,
                  AppCardContainer(
                    child: Column(
                      children: [
                        10.height,
                        AppTextField(
                          hintText: AppStrings.labelNameProduct,
                          controller: _textName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a  name of product ';
                            }
                            return null;
                          },
                          onChange: (val) {
                            nameprod = val!;
                          },
                        ),
                        10.height,
                        AppTextField(
                          hintText: AppStrings.labelNamePrice,
                          controller: _textprice,
                          inputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a  price ';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please Enter a Valid Number';
                            }
                            if (double.parse(value) <= 0) {
                              return 'Please Enter the number greather no than zero';
                            }
                            return null;
                          },
                          onChange: (val) {
                            price = double.parse(val!);
                          },
                        ),
                        10.height,
                        Center(
                          child: Consumer<switch_provider>(
                            builder: (context, isSwitched, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(AppStrings.labelTurnVat),
                                  Switch(
                                    activeTrackColor:
                                        AppColors.primaryMain.withAlpha(90),
                                    activeColor: AppColors.primaryMain,
                                    value: isSwitched.isSwitched,
                                    onChanged: (value) {
                                      isSwitched.changeboolValue(value);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        20.height,
                        if (_isLoading) AppLoader() else AppElevatedButton(
                                width: MediaQuery.of(context).size.width * 0.4,
                                text: AppStrings.labelButtonAddProduct,
                                onPressed: () async {
                                  try{
                                  if (_globalKey.currentState!.validate()) {
                                    _globalKey.currentState!.save();
                                    Provider.of<LoadProvider>(context,
                                            listen: false)
                                        .changeboolValueisLoading(true);

                                    settaxrate(context);
                                    valtaxrate = Provider.of<switch_provider>(
                                            context,
                                            listen: false)
                                        .isSwitched;
                                    valtype_product =
                                        Provider.of<selected_button_provider>(
                                                context,
                                                listen: false)
                                            .isSelected;
                                    Provider.of<product_vm>(context,
                                            listen: false)
                                        .addproduct_vm({
                                      'nameProduct': nameprod,
                                      'priceProduct': price.toString(),
                                      'type': valtype_product.toString(),
                                      'fk_country': Provider.of<UserProvider>(
                                              context,
                                              listen: false)
                                          .currentUser
                                          .fkCountry
                                          .toString(),
                                      'fk_config': valtaxrate
                                          ? taxrate.idConfig
                                          : "null",
                                      "value_config": valtaxrate
                                          ? taxrate.valueConfig
                                          : "null",
                                      "created_at": DateTime.now().toString(),
                                      "fkusercreate": Provider.of<UserProvider>(
                                              context,
                                              listen: false)
                                          .currentUser
                                          .idUser
                                          .toString(),
                                      //
                                    }).then((value) {
                                      print(value);
                                      value != "error"
                                            ? clear(context)
                                            : error();
                                    });

                                  }
                                  }catch(e,s){
                                    print(e.toString() + s.toString());
                                    error();
                                  }
                                },
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void error() {
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueisLoading(false);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppStrings.labelErrorAddProd)));
  }

  void clear(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changeboolValueisLoading(false);

    _textName.text = "";
    _textprice.text = "";
    Provider.of<switch_provider>(context, listen: false).changeboolValue(false);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppStrings.labelDoneAddProduct)));

    Navigator.pop(context);
    // Fluttertoast.showToast(
    //   backgroundColor: Colors.lightBlueAccent,
    //
    //   msg: label_doneAddProduct, // message
    //   toastLength: Toast.LENGTH_SHORT, // length
    //   gravity: ToastGravity.BOTTOM_LEFT, //
    // );
  }
}
