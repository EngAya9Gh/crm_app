


import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/group_button.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class EditProduct extends StatefulWidget {
   EditProduct({Key? key,required this.productModel}) : super(key: key);

  ProductModel productModel;

   @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey<FormState>();
  TextEditingController _textName = TextEditingController();

  TextEditingController _textprice = TextEditingController();
  int valtype_product = 0;
  bool valtaxrate = false;

  late ConfigModel taxrate;
  bool _isLoading = false;
  String nameprod = "";
  double price = 0;
  String? idCountry;
  @override
  void initState()  {


    print(widget.productModel.fkConfig);
    valtaxrate=widget.productModel.fkConfig==null
        ||widget.productModel.fkConfig=="null"?false:true;
    print(valtaxrate);
    print(valtaxrate);


      WidgetsBinding.instance!.addPostFrameCallback((_) {

        Provider.of<config_vm>(context, listen: false).getAllConfig();
        print(Provider.of<config_vm>(context, listen: false).listofconfig);
        ////////////////////////////////
        Provider.of<selected_button_provider>(context,listen: false)
            .selectValue(valtype_product);

        Provider.of<switch_provider>(context,listen: false)
            .changeboolValue(valtaxrate);
        print("valtaxrate");
      });
    nameprod= _textName.text=widget.productModel.nameProduct;
    _textprice.text=widget.productModel.priceProduct;
    price=double.parse(_textprice.text.toString());
    valtype_product=int.parse( widget.productModel.type);
    idCountry=Provider.of<user_vm_provider>(context,listen: false)
    .currentUser.fkCountry.toString();
    //valtype_product == 0 ? 1 : 0;

    super.initState();

  }
   void settaxrate(context) {

    List<ConfigModel> _listconfg =
        Provider.of<config_vm>(context, listen: false).listofconfig;
    print("build 3");
    taxrate =
        _listconfg.firstWhere((element) => element.name_config == 'taxrate');
    print(taxrate);
  }

  @override
  Widget build(BuildContext context) {
    //
    // idCountry= Provider.of<country_vm>(context,listen: false).id_country;
    // print("build edit prod");
    // print(idCountry);
    // Provider.of<config_vm>(context, listen: false).getAllConfig(idCountry!);
    // print(Provider.of<config_vm>(context, listen: false).listofconfig);
    // Provider.of<LoadProvider>(context, listen: false)
    //     .changeLoadingupdateprod(false);

    var sizeMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //title: Text('إضافة منتج',textAlign: TextAlign.center,style: TextStyle(color: kWhiteColor),),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingupdateprod,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: Form(

              key: _globalKey,
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: sizeMedia * 0.10,
                  ),
                  Consumer<selected_button_provider>(
                      builder: (context, selectedProvider, child) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 8.0,
                                color: Colors.black87.withOpacity(0.2),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Center(
                            child: GroupButton(
                                options: GroupButtonOptions(
                                  borderRadius: BorderRadius.circular(20),
                                  buttonWidth:
                                  MediaQuery.of(context).size.width * 0.3,
                                  //elevation: 0,
                                  selectedColor: kMainColor,
                                ),
                                //secondaryColor: Colors.white,
                                buttons: ['أجهزة', 'برامج'], //[0,1]
                                controller: GroupButtonController(
                                  selectedIndex: selectedProvider.isSelected,
                                  onDisablePressed: (i) =>
                                      print('Button #$i is disabled'),
                                ),
                                onSelected: (selected, isselect) {
                                  valtype_product = selected;
                                  // valtype_product == 0 ? 1 : 0;
                                  selectedProvider.selectValue(selected);
                                }),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 6,
                  ),
                  ContainerShadows(
                    width: double.infinity,
                    // height: 400,
                    margin: EdgeInsets.only(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  //horizontal: 10, vertical: 20
                    horizontal: sizeMedia * .05,
                    vertical: sizeMedia * .05),
                child: Column(

                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      read: false,
                      radius: 15,
                      maxline: 3,
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a  name of product ';
                        }
                      },
                      con: _textName,
                      label: label_name_product,
                      onChanged: (val) {
                        nameprod = val;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      read: false,
                      radius: 15,
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a  price ';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please Enter a Valid Number';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please Enter the number greather no than zero';
                        }
                      },
                      con: _textprice,
                      inputType: TextInputType.number,
                      label: label_name_price,
                      onChanged: (val) {
                        price = double.parse(val.toString());
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Consumer<switch_provider>(
                        //on off tax
                        builder: (context, isSwitched, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(label_turnVat),
                              Switch(
                                  activeTrackColor: kMainColor.withAlpha(90),
                                  activeColor: kMainColor,
                                  value: isSwitched.isSwitched,
                                  onChanged: (value) {
                                    valtaxrate = value;
                                    isSwitched.changeboolValue(value);

                                  }),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _isLoading
                            ? CircularProgressIndicator()
                            :
                        Provider.of<privilge_vm>(context,listen: true)
                            .checkprivlge('46')==true ?
                        CustomButton(
                          width: MediaQuery.of(context).size.width * 0.2,
                          text: "تعديل",
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              _globalKey.currentState!.save();
                              Provider.of<LoadProvider>(context, listen: false)
                                  .changeLoadingupdateprod(true);

                              settaxrate(context);
                              print("update");
                              print(valtype_product);
                              print(valtaxrate);
                              print(taxrate.id_config);
                              valtype_product=   Provider.of<selected_button_provider>(context,listen: false)
                                  .isSelected;
                              valtaxrate=  Provider.of<switch_provider>(context,listen: false).isSwitched;
                              Provider.of<product_vm>(context, listen: false)
                                  .updateproduct_vm(
                                  {
                                    'nameProduct': nameprod,
                                    'priceProduct': price.toString(),
                                    'type': valtype_product.toString(),
                                    'fk_country':idCountry,
                                    'fk_config': valtaxrate ? taxrate.id_config : "null",
                                    "value_config":valtaxrate ?taxrate.value_config:"null",
                                    "id_product": widget.productModel.idProduct.toString()
                                  },
                                  widget.productModel.idProduct.toString())
                                  .then((value) => value
                                  ? clear(context)
                                  : error()
                                // Fluttertoast.showToast(
                                //  backgroundColor:
                                //      Colors.lightBlueAccent,
                                //  msg: label_errorAddProd, // message
                                //  toastLength:
                                //      Toast.LENGTH_SHORT, // length
                                //  gravity: ToastGravity.CENTER, //
                              );
                            }
                          },
                        ):Container(),

                        Provider.of<privilge_vm>(context,listen: true)
                            .checkprivlge('48')==true ?   CustomButton(
                            width: MediaQuery.of(context).size.width * 0.2,

                            onTap: ()async{
                              bool result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return ModalProgressHUD(
                                    inAsyncCall: Provider.of<LoadProvider>(context)
                                        .isLoadingdelete,

                                    child: AlertDialog(
                                      titlePadding:const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0) ,
                                      insetPadding:  EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                      contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                                      title: Center(child: Text('تأكيد')),
                                      content: Text('هل تريد الحذف'),
                                      actions: <Widget>[
                                        new FlatButton(
                                          onPressed: () {
                                            Navigator.of(context, rootNavigator: true)
                                                .pop(false); // dismisses only the dialog and returns false
                                          },
                                          child: Text('لا'),
                                        ),
                                        FlatButton(
                                          onPressed: ()async {
                                            Provider.of<LoadProvider>(context,listen: false)
                                                .changebooldelete(true);
                                            String res =await Provider.of<product_vm>(context,listen: false)
                                                .deleteProduct( widget.productModel.idProduct);
                                            Provider.of<LoadProvider>(context,listen: false)
                                                .changebooldelete(false);
                                            print(res);
                                            if(res=="remove error")
                                              _scaffoldKey.currentState!.showSnackBar(
                                                  SnackBar(content: Text("لا يمكن حذف هذا المنتج"))
                                              );
                                            else{

                                              if(res=="done") {
                                                _scaffoldKey.currentState!
                                                    .showSnackBar(
                                                    SnackBar(content: Text(
                                                        "تم الحذف بنجاح")));
                                             Navigator.pop(context);
                                              } else
                                              if(res=='bad requst')
                                                _scaffoldKey.currentState!.showSnackBar(
                                                    SnackBar(content: Text("ارسال خاطئ")));
                                              else
                                              if(res=='error')
                                                _scaffoldKey.currentState!.showSnackBar(
                                                    SnackBar(content: Text(" هناك مشكلة ما أثناء حذف المنتج")));
                                              else
                                                _scaffoldKey.currentState!.showSnackBar(
                                                    SnackBar(content: Text("يوجد مشكلة ما ")));
                                            }

                                            Navigator.of(context, rootNavigator: true)
                                                .pop(true); // dismisses only the dialog and returns true
                                          },
                                          child: Text('نعم'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                            },
                            text: 'حذف'):Container(),
                      ],
                    )


                  ],
                ),
              ),
            )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  clear(body) {
    //label_Edituser
    Provider.of<LoadProvider>(context, listen: false)
        .changeLoadingupdateprod(false);
    // final index=
     //Provider.of<switch_provider>(context, listen: false).changeboolValue(false);

    // controllerUsers.usersList.indexWhere((element) =>
    // element.idUser==widget.userModel.idUser);
    // controllerUsers.usersList[index] = UserModel.fromJson( body);

    // _textName.text = "";
    // _textprice.text = "";

    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_Edituser)));

    Navigator.pop(context);

  }

  error() {
    Provider.of<LoadProvider>(context, listen: false)
        .changeLoadingupdateprod(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_errorAddProd)));
  }
}
