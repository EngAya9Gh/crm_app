import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/participatModel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customlogo.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/ui/widgets/photoviewcustom.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as myui;

import '../../../constants.dart';
import '../../../labeltext.dart';
import '../showpdf.dart';
import 'add_invoice_product.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class addinvoice extends StatefulWidget {
  addinvoice(
      {required this.itemClient,
      this.invoice,
      // required this.iduser,
      // required this.idClient,
      // required this.indexinvoice,
      Key? key})
      : super(key: key);
  ClientModel itemClient;

  // String? idClient,iduser;
  InvoiceModel? invoice = null;

  // late int indexinvoice;
  @override
  _addinvoiceState createState() => _addinvoiceState();
}

class _addinvoiceState extends State<addinvoice> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _globalKey = GlobalKey<FormState>();

  late String totalController; //= TextEditingController();

  final TextEditingController amount_paidController = TextEditingController();

  final TextEditingController renewController = TextEditingController();

  late String typepayController = '0';

  late String typeinstallController = '0';
  late String readyinstallController = '0';
  late String currencyController = '0';

  final TextEditingController noteController = TextEditingController();
  final TextEditingController numbranchController = TextEditingController();
  final TextEditingController numuserController = TextEditingController();
  final TextEditingController userclientController = TextEditingController();
  final TextEditingController nummostawdaController = TextEditingController();
  final TextEditingController numTaxController = TextEditingController();

  // final TextEditingController numTaxController = TextEditingController();

  final TextEditingController imageController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController renew2Controller = TextEditingController();
  final TextEditingController sellerCommissionRate = TextEditingController();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  String? _fileName;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  late File? _myfile = null;
  late File? _myfilelogo = null;
  InvoiceModel? _invoice = null;

  @override
  void dispose() async {
    renewController.dispose();
    noteController.dispose();
    imageController.dispose();
    amount_paidController.dispose();
    numuserController.dispose();
    nummostawdaController.dispose();
    numbranchController.dispose();
    numTaxController.dispose();
    userclientController.dispose();
    addressController.dispose();
    print('in dispos add invoice *****************');
    //_resetState();
    //await FilePicker.platform.clearTemporaryFiles();
    super.dispose();
  }

  late invoice_vm invoiceViewmodel;

  @override
  void initState() {
    if (_invoice == null) _invoice = InvoiceModel(products: []);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(false);

      invoiceViewmodel = Provider.of<invoice_vm>(context, listen: false);
      Provider.of<invoice_vm>(context, listen: false).listproductinvoic = [];
      Provider.of<invoice_vm>(context, listen: false).set_total('0'.toString());
      print('init in addinvoice screen main');
      totalController = '0';
      _invoice = widget.invoice;
      if (_invoice != null) {
        print('in if invoice');
        //in mode edit
        totalController = _invoice!.total.toString();
        // Provider.of<invoice_vm>(context,listen: false).set_total(totalController.toString());
        numuserController.text = _invoice!.numusers == null ? '' : _invoice!.numusers.toString();
        nummostawdaController.text = _invoice!.nummostda == null ? '' : _invoice!.nummostda.toString();
        numbranchController.text = _invoice!.numbarnch == null ? '' : _invoice!.numbarnch.toString();
        numTaxController.text = _invoice!.numTax == null ? '' : _invoice!.numTax.toString();
        userclientController.text = _invoice!.clientusername == null ? '' : _invoice!.clientusername.toString();
        addressController.text = _invoice!.address_invoice == null ? '' : _invoice!.address_invoice.toString();

        amount_paidController.text = _invoice!.amountPaid.toString();
        renewController.text = _invoice!.renewYear.toString();
        renew2Controller.text = _invoice!.renew2year.toString();

        typepayController = _invoice!.typePay.toString();
        currencyController = _invoice!.currency_name == null ? '1' : _invoice!.currency_name.toString();
        print(typepayController.toString());
        typeinstallController = _invoice!.typeInstallation.toString();
        print(typeinstallController);

        noteController.text = _invoice!.notes.toString();
        imageController.text = _invoice!.imageRecord.toString();
        Provider.of<invoice_vm>(context, listen: false)
          ..listproductinvoic = _invoice!.products!
          ..initAdditionalInformation(_invoice!);

        sellerCommissionRate.text = _invoice!.rate_participate.toString();

        // invoiceViewmodel.onChangeSelectedIndex(_invoice!.participate_fk);
      } else {
        /// add invoice
        // Provider.of<invoice_vm>(context,listen: false)
        //     .listinvoiceClient.add(
        print('in else invoice');
        _invoice = InvoiceModel(
          products: [],
          renewYear: renewController.text,
          typePay: typepayController,
          //"date_create": ,
          typeInstallation: typeinstallController,
          amountPaid: amount_paidController.text,
          imageRecord: "",
          fkIdClient: widget.itemClient.idClients,
          fkIdUser: widget.itemClient.fkUser,
          //صاحب العميل
          path: '',
          total: totalController,
          notes: noteController.text,
        );
        //);

        Provider.of<invoice_vm>(context, listen: false).listproductinvoic = [];
      }
      Provider.of<invoice_vm>(context, listen: false).set_total(totalController.toString());

      Provider.of<selected_button_provider>(context, listen: false).selectValuetypepay(int.parse(typepayController));
      print(typepayController);

      Provider.of<selected_button_provider>(context, listen: false)
          .selectValuetypeinstall(int.parse(typeinstallController.toString()));
      print(typeinstallController);
    });
    super.initState();
  }

  @override
  void deactivate() {
    invoiceViewmodel.resetAdditionalInformation();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddinvoice,
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          // child: ContainerShadows(
          //   width: double.infinity,
          //   //height: 400,
          //   margin: EdgeInsets.only(),
          child: Directionality(
            textDirection: myui.TextDirection.rtl,
            child: SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Column(
                    //textDirection: TextDirection.rtl,

                    children: [
                      ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kMainColor)),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => add_invoiceProduct(invoice: _invoice
                                      // Provider.of<invoice_vm>(context,listen: false)
                                      //     .listinvoiceClient[widget.indexinvoice],
                                      // indexinvoic:  widget.indexinvoice,
                                      ),
                                ),
                                (Route<dynamic> route) => true);
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (context)=>
                            //         add_invoiceProduct(
                            //           invoice:
                            //           Provider.of<invoice_vm>(context,listen: false)
                            //               .listinvoiceClient[widget.indexinvoice],
                            //           indexinvoic:  widget.indexinvoice,
                            //         ), fullscreenDialog: true,
                            // ));
                          },
                          child: Text("إضافة منتجات الفاتورة")),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            textstring: label_total,
                            underline: TextDecoration.none,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          TextUtilis(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.normal,
                            textstring:
                                // widget.indexinvoice>=0?
                                Provider.of<invoice_vm>(context, listen: true).total,
                            //     .listinvoiceClient[widget.indexinvoice]
                            //_invoice!.total.toString(),//totalController,
                            underline: TextDecoration.none,
                          ),
                          //  SizedBox(width: 10,),
                        ],
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      RowEdit(name: 'عنوان الفاتورة', des: ''),
                      EditTextFormField(
                        vaild: (value) {
                          if (value.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        maxline: 3,
                        paddcustom: EdgeInsets.all(16),
                        hintText: '',
                        obscureText: false,
                        controller: addressController,
                      ),
                      RowEdit(name: label_amount_paid, des: 'required'),
                      EditTextFormField(
                        obscureText: false,
                        hintText: label_amount_paid,
                        vaild: (value) {
                          if (value.toString().trim().isEmpty) {
                            return label_empty;
                          }
                          if (double.tryParse(value.toString()) == null) return 'من فضلك ادخل عدد';
                        },
                        controller: amount_paidController,
                        //اسم المؤسسة
                        //label: label_client,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                        inputType: TextInputType.number,
                        // inputformate: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RowEdit(name: label_renew, des: 'Required'),
                      EditTextFormField(
                        hintText: label_renew,
                        obscureText: false,
                        vaild: (value) {
                          if (value.toString().trim().isEmpty) {
                            return label_empty;
                          }
                          if (double.tryParse(value.toString()) == null) return 'من فضلك ادخل عدد';
                          // else if(value.characters){
                          //   return ;
                          // }
                        },
                        inputType: TextInputType.number,
                        // inputformate: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        controller: renewController,
                        //اسم المؤسسة
                        label: label_renew,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RowEdit(name: label_renew2year, des: 'اختياري'),
                      EditTextFormField(
                        hintText: label_renew2year,
                        obscureText: false,
                        // vaild: (value) {
                        //   if (value.toString().trim().isEmpty) {
                        //     return label_empty;
                        //   }
                        //   if (double.tryParse(value.toString()) == null) return 'من فضلك ادخل عدد';
                        //   // else if(value.characters){
                        //   //   return ;
                        //   // }
                        // },
                        inputType: TextInputType.number,
                        // inputformate: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        controller: renew2Controller,
                        //اسم المؤسسة
                        label: label_renew2year,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      //admin
                      RowEdit(name: label_typepay, des: 'Required'),
                      Container(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 8.0,
                              color: Colors.black87.withOpacity(0.2),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Consumer<selected_button_provider>(builder: (context, selectedProvider, child) {
                          return GroupButton(
                              controller: GroupButtonController(
                                selectedIndex: selectedProvider.isSelectedtypepay,
                                //
                                // typepayController==null
                                //    ? 0
                                //    :
                                //int.tryParse( typepayController!)
                              ),
                              options: GroupButtonOptions(buttonWidth: 110, borderRadius: BorderRadius.circular(10)),
                              buttons: ['نقدا', 'تحويل'],
                              onSelected: (_, index, isselected) {
                                print(index);
                                //setState(() {
                                typepayController = index.toString();
                                selectedProvider.selectValuetypepay(index);
                                //});
                              });
                        }),
                      ),
                      //manage
                      SizedBox(
                        height: 5,
                      ),
                      RowEdit(name: label_typeinstall, des: 'Required'),
                      Container(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 8.0,
                              color: Colors.black87.withOpacity(0.2),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Consumer<selected_button_provider>(builder: (context, selectedProvider, child) {
                          return GroupButton(
                              controller: GroupButtonController(
                                selectedIndex: selectedProvider.isSelectedtypeinstall,
                                // typeinstallController==null
                                //     ? 0 :
                                // int.tryParse( typeinstallController!)
                              ),
                              options: GroupButtonOptions(buttonWidth: 110, borderRadius: BorderRadius.circular(10)),
                              buttons: ['ميداني', 'اونلاين'],
                              onSelected: (_, index, isselected) {
                                print(index);
                                //setState(() {
                                typeinstallController = index.toString();
                                selectedProvider.selectValuetypeinstall(index);
                                //  });
                              });
                        }),
                      ),
                      //RowEdit(name: 'Image', des: ''),

                      SizedBox(
                        height: 15,
                      ),
                      _invoice!.idInvoice == null ? RowEdit(name: label_readyinstall, des: 'Required') : Container(),
                      _invoice!.idInvoice == null
                          ? Container(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 8.0,
                                    color: Colors.black87.withOpacity(0.2),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Consumer<selected_button_provider>(builder: (context, selectedProvider, child) {
                                return GroupButton(
                                    controller: GroupButtonController(
                                      selectedIndex: selectedProvider.isSelectedreadyinstall,
                                      // typeinstallController==null
                                      //     ? 0 :
                                      // int.tryParse( typeinstallController!)
                                    ),
                                    options:
                                        GroupButtonOptions(buttonWidth: 110, borderRadius: BorderRadius.circular(10)),
                                    buttons: ['غير جاهز للتركيب', 'جاهز للتركيب'],
                                    onSelected: (_, index, isselected) {
                                      print(index);
                                      //setState(() {
                                      readyinstallController = index.toString();
                                      selectedProvider.selectValuereadyinstall(index);
                                      //  });
                                    });
                              }),
                            )
                          : Container(),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 8.0,
                              color: Colors.black87.withOpacity(0.2),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Consumer<selected_button_provider>(builder: (context, selectedProvider, child) {
                          return GroupButton(
                              controller: GroupButtonController(
                                selectedIndex: selectedProvider.isSelectCurrency,
                                // typeinstallController==null
                                //     ? 0 :
                                // int.tryParse( typeinstallController!)
                              ),
                              options: GroupButtonOptions(buttonWidth: 110, borderRadius: BorderRadius.circular(10)),
                              buttons: [' USD دولار', '  SAR ريال'],
                              onSelected: (_, index, isselected) {
                                print(index);
                                //setState(() {
                                currencyController = index.toString();
                                selectedProvider.selectValueCurrency(index);
                                //  });
                              });
                        }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_note, des: ''),
                      EditTextFormField(
                        paddcustom: EdgeInsets.all(16),
                        maxline: 3,
                        hintText: label_note,
                        obscureText: false,
                        controller: noteController,
                      ),
                      ////////////////////////////////////////////////
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                RowEdit(name: 'عدد الفروع', des: ''),
                                EditTextFormField(
                                  inputType: TextInputType.number,
                                  inputformate: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  paddcustom: EdgeInsets.all(16),
                                  hintText: '',
                                  obscureText: false,
                                  controller: numbranchController,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                RowEdit(name: 'عدد المستودعات', des: ''),
                                EditTextFormField(
                                  inputType: TextInputType.number,
                                  inputformate: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  paddcustom: EdgeInsets.all(16),
                                  hintText: '',
                                  obscureText: false,
                                  controller: nummostawdaController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                RowEdit(name: 'عدد المستخدمين', des: ''),
                                EditTextFormField(
                                  inputType: TextInputType.number,
                                  inputformate: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  paddcustom: EdgeInsets.all(16),
                                  hintText: '',
                                  obscureText: false,
                                  controller: numuserController,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                RowEdit(name: 'الرقم الضريبي', des: ''),
                                EditTextFormField(
                                  inputType: TextInputType.number,
                                  inputformate: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  paddcustom: EdgeInsets.all(16),
                                  hintText: '',
                                  obscureText: false,
                                  controller: numTaxController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Provider.of<privilge_vm>(context, listen: true).checkprivlge('76') == true &&
                              _invoice!.idInvoice != null &&
                              _invoice!.userinstall != null
                          ? RowEdit(name: 'يوزر العميل', des: '')
                          : Container(),
                      Provider.of<privilge_vm>(context, listen: true).checkprivlge('76') == true &&
                              _invoice!.idInvoice != null &&
                              _invoice!.userinstall != null
                          ? EditTextFormField(
                              paddcustom: EdgeInsets.all(16),
                              hintText: '',
                              obscureText: false,
                              controller: userclientController,
                            )
                          : Container(),

                      //CustomButton(text: 'd',width: 50,onTap: (){},),
                      RowEdit(name: 'شعار المؤسسة', des: ''),
                      TextFormField(
                        controller: logoController,
                        obscureText: false,
                        cursorColor: Colors.black,
                        onTap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          final pickedImage = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 100,
                          );
                          File? pickedFile = File(pickedImage!.path);
                          setState(() {
                            print(pickedFile.path);
                            _myfilelogo = pickedFile;
                            logoController.text = pickedFile.path;
                          });

                          // _invoice!.path=pickedFile.path;
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          prefixIcon: Icon(
                            Icons.add_photo_alternate,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                          hintText: '',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)),
                        ),
                      ),
                      _invoice!.imagelogo != null && widget.invoice!.imagelogo.toString().isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 40,
                                width: 50,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.network(_invoice!.imagelogo.toString()),
                                    // Positioned(
                                    //     bottom: 0,
                                    //     child: Text(
                                    //       'smart life',
                                    //       style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Pacifico'),)
                                    // )
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      RowEdit(name: label_image, des: ''),
                      //show chose image
                      EditTextFormField(
                        read: true,
                        icon: Icons.camera,
                        hintText: label_image,
                        ontap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          final pickedImage = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 100,
                          );
                          File? pickedFile = File(pickedImage!.path);
                          print(pickedFile.path);
                          _myfile = pickedFile;
                          _invoice!.path = pickedFile.path;
                          imageController.text = _myfile!.path;
                          //Navigator.of(context).pop();
                          //  FilePickerResult? result
                          //  = await FilePicker.platform.pickFiles(
                          //   // allowedExtensions: ['pdf'],
                          //  );
                          // //
                          //  if (result != null) {
                          //   File? file = File(result.files.single.path.toString());
                          //  _myfile=file;
                          //   imageController.text=file.path;
                          //   _invoice!.path=file.path;
                          //   //   _pickFiles();
                          // //   _saveFile();
                          // } else {
                          //   // User canceled the picker
                          // }
                          //  setState(() {
                          //
                          //  });
                        },
                        obscureText: false,
                        controller: imageController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _invoice!.imageRecord.toString().isNotEmpty
                          ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      iconSize: 50,
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => photoviewcustom(
                                                      urlimagecon: _invoice!.imageRecord.toString(),
                                                    ) // support_view(type: 'only',)
                                                ));
                                      },
                                      icon: Icon(
                                        Icons.image,
                                        color: kMainColor,
                                      ))
                                  // Text('فتح الملف'),
                                  // IconButton(
                                  //   iconSize: 50,
                                  //      onPressed: ()async {
                                  //   //await FilePicker.platform.
                                  //   if( _invoice!.imageRecord.toString().isNotEmpty){
                                  //     Provider.of<LoadProvider>(context, listen: false)
                                  //         .changebooladdinvoice(true);
                                  //   File? filee=await  createFileOfPdfUrl(_invoice!.imageRecord.toString());
                                  //     Provider.of<LoadProvider>(context, listen: false)
                                  //         .changebooladdinvoice(false);
                                  //       Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //           builder: (context) => PDFScreen(
                                  //               path: filee.path),
                                  //         ),
                                  //       );
                                  //     //   String url =_invoice!.imageRecord.toString();
                                  //     //   if (await canLaunch(url)) {
                                  //     //     await launch(url);
                                  //     //   } else {
                                  //     //     throw 'Could not launch $url';
                                  //        }
                                  //
                                  // }, icon:Icon( Icons.image)),
                                ],
                              ),
                            )
                          : Container(),
                      Divider(),
                      Text(
                        "تفاصيل إضافية",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      RowEdit(name: "نوع البائع"),
                      SizedBox(height: 5),
                      Selector<invoice_vm, SellerType?>(
                          selector: (_, vm) => vm.selectedSellerType,
                          builder: (context, selectedSellerType, _) {
                            return Container(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              margin: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 8.0,
                                    color: Colors.black87.withOpacity(0.2),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: GroupButton(
                                controller: GroupButtonController(selectedIndex: selectedSellerType?.index),
                                options: GroupButtonOptions(
                                  buttonWidth: (MediaQuery.of(context).size.width - 130) / 3,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                buttons: ['موزع', 'وكيل', 'متعاون'],
                                onSelected: (_, index, isselected) {
                                  invoiceViewmodel.onChangeSellerType(
                                      SellerType.values.firstWhere((element) => element.index == index));
                                },
                              ),
                            );
                          }),
                      SizedBox(height: 10),
                      Consumer<invoice_vm>(builder: (context, invoice, _) {
                        final sellerStatus = invoice.sellerStatus;
                        final selectedSellerType = invoice.selectedSellerType;
                        final bool isCollaborate = selectedSellerType == SellerType.collaborator;

                        final collaboratesList = invoice.collaboratorsState.data ?? [];
                        final agentsList = invoice.agentDistributorsState.data ?? [];
                        List<AgentDistributorModel> agentsListtemp = [];

                        agentsList.forEach((element) {
                          if (element.typeAgent == invoice.selectedSellerType!.index.toString())
                            agentsListtemp.add(element);
                        });
                        final selectedAgent = selectedSellerType == SellerType.distributor
                            ? invoice.selectedDistributor
                            : invoice.selectedAgent;

                        final selectedCollaborate = invoice.selectedCollaborator;
                        if (selectedSellerType != null)
                          return Column(
                            children: [
                              RowEdit(name: "اسم البائع"),
                              SizedBox(height: 5),
                              if (sellerStatus == SellerStatus.loading)
                                loadingWidget
                              else if (sellerStatus == SellerStatus.failed)
                                refreshIcon(() {})
                              else if (isCollaborate)
                                sellerDropdown<ParticipateModel>(
                                  collaboratesList,
                                  selectedValue: selectedCollaborate,
                                )
                              else
                                sellerDropdown<AgentDistributorModel>(
                                  agentsListtemp, // agentsList,
                                  selectedValue: selectedAgent,
                                ),
                              SizedBox(height: 10),
                              RowEdit(name: "نسبة عمولة البائع"),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: sellerCommissionRate,
                                obscureText: false,
                                cursorColor: Colors.black,
                                readOnly: false,
                                validator: (text) {
                                  // if (text?.trim().isEmpty ?? true) {
                                  //   return 'هذا الحقل مطلوب';
                                  // }
                                  // return null;
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintStyle:
                                      const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                  hintText: '',
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.white)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Colors.white)),
                                ),
                              ),
                            ],
                          );

                        return SizedBox();
                      }),
                      SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                elevation: MaterialStateProperty.all(8),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(75))),
                                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                                shadowColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onSurface),
                              ),
                              child: Text(
                                'حفظ',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_globalKey.currentState!.validate()) {
                                  typepayController = Provider.of<selected_button_provider>(context, listen: false)
                                      .isSelectedtypepay
                                      .toString();

                                  typeinstallController = Provider.of<selected_button_provider>(context, listen: false)
                                      .isSelectedtypeinstall
                                      .toString();
                                  // if (invoiceViewmodel.selectedSellerType == null) {
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(SnackBar(content: Text('من فضلك اختر نوع البائع')));
                                  //   return;
                                  // }

                                  if ((_invoice!.products != null) && (_invoice!.products!.isNotEmpty)) {
                                    Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(true);
                                    totalController = _invoice!.total.toString();
                                    _globalKey.currentState!.save();
                                    List<ProductsInvoice>? _products = [];
                                    _products = _invoice!.products;

                                    if (_invoice!.idInvoice != null) {
                                      String? invoiceID = _invoice!.idInvoice;
                                      Provider.of<invoice_vm>(context, listen: false).update_invoiceclient_vm({
                                        "name_enterprise": widget.itemClient.nameEnterprise,
                                        "name_client": widget.itemClient.nameClient.toString(),
                                        "nameUser": widget.itemClient.nameUser.toString(),
                                        "renew_year": renewController.text.toString(),
                                        "renew2year": renew2Controller.text.toString(),
                                        "type_pay": typepayController.toString(),
                                        "date_create": DateTime.now().toString(),
                                        "type_installation": typeinstallController.toString(),
                                        "ready_install": readyinstallController.toString(),
                                        "currency_name": currencyController.toString(),

                                        /////////////////////////////////////////////////////////////////////
                                        "amount_paid": amount_paidController.text.toString(),
                                        'fk_regoin': widget.invoice!.fk_regoin.toString(),
                                        'fk_regoin_invoice': widget.invoice!.fk_regoin.toString(),
                                        'fkcountry': widget.invoice!.fk_country.toString(),
                                        "fk_idClient": widget.itemClient.idClients.toString(),
                                        "fk_idUser": widget.itemClient.fkUser.toString(),
                                        "image_record": imageController.text.toString(),
                                        "lastuserupdate": Provider.of<user_vm_provider>(context, listen: false)
                                            .currentUser
                                            .idUser
                                            .toString(),
                                        "lastnameuser": Provider.of<user_vm_provider>(context, listen: false)
                                            .currentUser
                                            .nameUser
                                            .toString(),
                                        "total": totalController,
                                        "notes": noteController.text.toString(),
                                        "id_invoice": invoiceID,
                                        // 'imagelogo':'',
                                        'numbarnch': numbranchController.text.toString(),
                                        'nummostda': nummostawdaController.text.toString(),
                                        'numusers': numuserController.text.toString(),
                                        'numTax': numTaxController.text.toString(),
                                        'address_invoice': addressController.text.toString(),
                                        'clientusername': userclientController.text.toString(),
                                        'date_lastuserupdate': DateTime.now().toString(),

                                        if (invoiceViewmodel.selectedSellerType == SellerType.collaborator &&
                                            invoiceViewmodel.selectedCollaborator?.id_participate != null)
                                          'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                        else if (invoiceViewmodel.selectedSellerType != SellerType.collaborator &&
                                            invoiceViewmodel.selectedAgent != null)
                                          'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                        else
                                          'type_seller': '3', // type seller is employee,

                                        if (sellerCommissionRate.text.isNotEmpty)
                                          'rate_participate': sellerCommissionRate.text,

                                          if (invoiceViewmodel.selectedSellerType == SellerType.agent)
                                            'fk_agent': invoiceViewmodel.selectedAgent?.idAgent.toString()
                                          else if (invoiceViewmodel.selectedSellerType == SellerType.distributor)
                                            'fk_agent': invoiceViewmodel.selectedDistributor?.idAgent.toString(),

                                        if (invoiceViewmodel.selectedSellerType == SellerType.collaborator)
                                          'participate_fk':
                                              invoiceViewmodel.selectedCollaborator?.id_participate.toString(),

                                        // 'type_seller':
                                        // 'rate_participate':

                                        // 'fk_agent':
                                        // 'participate_fk':
                                      }, invoiceID, _invoice!.path.toString().isNotEmpty ? _myfile : null,
                                          _myfilelogo).then((value) => value !=
                                              false
                                          ? clear(context, invoiceID.toString(), _products)
                                          : error(context));
                                    } else {
                                      var body = {
                                        "name_enterprise": widget.itemClient.nameEnterprise,
                                        "name_client": widget.itemClient.nameClient.toString(),
                                        "nameUser": Provider.of<user_vm_provider>(context, listen: false)
                                            .currentUser
                                            .nameUser
                                            .toString(),
                                        //widget.itemClient.nameUser,
                                        "renew_year": renewController.text.toString(),
                                        "renew2year": renew2Controller.text.toString(),
                                        "type_pay": typepayController,
                                        "date_create": DateTime.now().toString(),
                                        //formatter.format(_currentDate),
                                        "type_installation": typeinstallController.toString(),
                                        "ready_install": readyinstallController.toString(),
                                        "currency_name": currencyController.toString(),

                                        "amount_paid": amount_paidController.text.toString(),
                                        "image_record": imageController.text.toString(),
                                        "fk_idClient": widget.itemClient.idClients.toString(),
                                        "fk_idUser": widget.itemClient.fkUser.toString(),
                                        //the same user that create a client not current user
                                        "total": totalController.toString(),
                                        "notes": noteController.text.toString(),
                                        'fk_regoin': widget.itemClient.fkRegoin.toString(),
                                        'fk_regoin_invoice': widget.itemClient.fkRegoin.toString(),
                                        'fkcountry': widget.itemClient.fkcountry.toString(),
                                        'numbarnch': numbranchController.text.toString(),
                                        'nummostda': nummostawdaController.text.toString(),
                                        'numusers': numuserController.text.toString(),
                                        'address_invoice': addressController.text.toString(),

                                        if (invoiceViewmodel.selectedSellerType == SellerType.collaborator &&
                                            invoiceViewmodel.selectedCollaborator?.id_participate != null)
                                          'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                        else if (invoiceViewmodel.selectedSellerType != SellerType.collaborator &&
                                            invoiceViewmodel.selectedAgent != null)
                                          'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                        else
                                          'type_seller': '3', // type seller is employee,

                                        'rate_participate': sellerCommissionRate.text,

                                        if (invoiceViewmodel.selectedSellerType == SellerType.agent)
                                          'fk_agent': invoiceViewmodel.selectedAgent?.idAgent.toString()
                                        else if (invoiceViewmodel.selectedSellerType == SellerType.distributor)
                                          'fk_agent': invoiceViewmodel.selectedDistributor?.idAgent.toString(),

                                        if (invoiceViewmodel.selectedSellerType == SellerType.collaborator)
                                          'participate_fk':
                                              invoiceViewmodel.selectedCollaborator?.id_participate.toString(),
                                      };
                                      if (readyinstallController == '0')
                                        body.addAll({
                                          'date_not_readyinstall': DateTime.now().toString(),
                                          'user_not_ready_install':
                                              Provider.of<user_vm_provider>(context, listen: false)
                                                  .currentUser
                                                  .idUser
                                                  .toString(),
                                        });
                                      else
                                        body.addAll({
                                          'date_readyinstall': DateTime.now().toString(),
                                          'user_ready_install': Provider.of<user_vm_provider>(context, listen: false)
                                              .currentUser
                                              .idUser
                                              .toString(),
                                        });
                                      log(body.toString());
                                      Provider.of<invoice_vm>(context, listen: false)
                                          .add_invoiceclient_vm(
                                              body, _invoice!.path!.isNotEmpty ? _myfile : null, _myfilelogo)
                                          .then((value) =>
                                              value != "false" ? clear(context, value, _products) : error(context));
                                    }
                                  } else {
                                    _scaffoldKey.currentState!
                                        .showSnackBar(SnackBar(content: Text('من فضلك ادخل منتجات')));
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //),
      ),
    );
  }

  clear(BuildContext context, String value, List<ProductsInvoice>? _products) async {
    // int index=  Provider.of<client_vm>(context,listen: false)
    //     .listClient.indexWhere(
    //           (element) => element.idClients==widget.itemClient.idClients);
    //  //
    //
    // if(index!=-1) {
    //   double total_paid=0;
    //
    //   total_paid=double.parse(Provider.of<client_vm>(context,listen: false)
    //       .listClient[index].total_paid.toString());
    //
    //   total_paid=total_paid+(
    //        double.parse(totalController)
    //       -double.parse(amount_paidController.text));
    //
    //   Provider.of<client_vm>(context,listen: false).listClient[index]
    //       .total_paid  =total_paid.toString();
    // }
    print('in clear');
    //widget.indexinvoice = 0;
    _products =
        // Provider
        // .of<invoice_vm>(context, listen: false)
        // .listinvoiceClient[widget.indexinvoice]
        _invoice!.products;
    print('length ' + _products!.length.toString());
    for (int i = 0; i < _products.length; i++) {
      print('inside for');
      if (_products[i].idInvoiceProduct == null || _products[i].idInvoiceProduct == "null") {
        print('inside if');
        Map<String, dynamic?> body = _products[i].toJson();
        // if(value!="")//update
        // {}
        body.addAll({
          'fk_id_invoice': value,
        });
        String res = await Provider.of<invoice_vm>(context, listen: false).add_invoiceProduct_vm(body);

        if (res != "false") {
          body.addAll({
            'idInvoiceProduct': res,
          });
          Provider.of<invoice_vm>(context, listen: false).listproductinvoic[i].idInvoiceProduct = res;
        }
      } //if
      else {
        //update product in invoice
        print('before else');
        Map<String, dynamic?> body = _products[i].toJson();
        print('after else');
        bool res = await Provider.of<invoice_vm>(context, listen: false)
            .update_invoiceProduct_vm(body, _products[i].idInvoiceProduct.toString());
      }
    }
    //for loop
    int index1 = Provider.of<invoice_vm>(context, listen: false)
        .listinvoices
        .indexWhere((element) => element.idInvoice == value);

    // _invoice=Provider.of<invoice_vm>(context,listen: false)
    //     .listinvoices[index1];
    // _invoice!.idInvoice=value;
    //  _invoice!.products
    //    = Provider
    //        .of<invoice_vm>(context, listen: false)
    //        .listproductinvoic;
    // //
    Provider.of<invoice_vm>(context, listen: false).listinvoices[index1].products = _invoice!.products;

    Provider.of<invoice_vm>(context, listen: false).updatelistproducetInvoice();

    Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(false);
    Navigator.pop(context);
    // _scaffoldKey.currentState!.showSnackBar(
    //     SnackBar(content: Text('تم الحفظ بنجاح'))
    // );
    // setState(() {
    // });
  }

  error(context) {
    print("error method");
    Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(false);
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
  }

  DateTime _currentDate = DateTime.now();
  final intl.DateFormat formatter = intl.DateFormat('yyyy-MM-dd');

  void _pickFiles() async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false) ? _extension?.replaceAll(' ', '').split(',') : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      _logException('Unsupported operation' + e.toString());
    } catch (e) {
      _logException(e.toString());
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName = _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
    });
  }

  // Future<void> _saveFile() async {
  //   _resetState();
  //   try {
  //     // String? fileName = await FilePicker.platform.toString(
  //     //   allowedExtensions: (_extension?.isNotEmpty ?? false)
  //     //       ? _extension?.replaceAll(' ', '').split(',')
  //     //       : null,
  //     //   type: _pickingType,
  //     );
  //     setState(() {
  //       _saveAsFileName = fileName;
  //       _userAborted = fileName == null;
  //     });
  //   } on PlatformException catch (e) {
  //     _logException('Unsupported operation' + e.toString());
  //   } catch (e) {
  //     _logException(e.toString());
  //   } finally {
  //     setState(() => _isLoading = false);
  //   }
  // }

  void _logException(String message) {
    print(message);
    // _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    // _scaffoldMessengerKey.currentState?.showSnackBar(
    //   SnackBar(
    //     content: Text(message),
    //   ),
    // );
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _saveAsFileName = null;
      _userAborted = false;
    });
  }

  Widget fileshow_widget() {
    // String type='';
    // type=  _invoice!.imageRecord.toString()
    //     .substring(_invoice!.imageRecord.toString().length-4,
    //     _invoice!.imageRecord.toString().length);
    // return
    //     _invoice!.path.toString().isNotEmpty
    //     ?type=='.jpg'
    //     ?Image.file(File(_invoice!.path.toString()))
    //     CircleAvatar(radius: 80.0,
    //     child: _invoice!.path.toString()!.isNotEmpty
    //         ? CachedNetworkImage(progressIndicatorBuilder: (context, url, progress) => Center(
    //           child: CircularProgressIndicator(value: progress.progress,),),
    //         imageUrl: _invoice!.imageRecord.toString()!  )
    // ): File(_invoice!.imageRecord.toString())
    //  : File(_invoice!.imageRecord.toString())
    //  :Container(),

    return Container();
  }

  Future<File> createFileOfPdfUrl(String urlparam) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url = urlparam;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Widget get loadingWidget {
    return Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget refreshIcon(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.refresh),
    );
  }

  Widget sellerDropdown<T>(
    List<T> sellerNames, {
    T? selectedValue,
  }) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DropdownButtonFormField<T>(
            isExpanded: true,
            validator: (text) {
              if (text == null) {
                return 'هذا الحقل مطلوب';
              }
              return null;
            },
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            hint: Text("اختر البائع"),
            items: sellerNames.map((item) {
              if (T == ParticipateModel) {
                return DropdownMenuItem(
                  child: Text((item as ParticipateModel).name_participate, textDirection: TextDirection.rtl),
                  value: item,
                );
              } else {
                return DropdownMenuItem(
                  child: Text((item as AgentDistributorModel).nameAgent, textDirection: TextDirection.rtl),
                  value: item,
                );
              }
            }).toList(),
            value: selectedValue,
            onChanged: (seller) {
              if (seller == null) {
                return;
              }

              if (T == ParticipateModel) {
                invoiceViewmodel.onChangeSelectedCollaborator(seller as ParticipateModel);
              } else {
                invoiceViewmodel.onChangeSelectedAgent(seller as AgentDistributorModel);
              }
            },
            onSaved: (seller) {},
          ),
        ),
      ),
    );
  }
}
