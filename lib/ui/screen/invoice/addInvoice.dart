import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as myui;

import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/participatModel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' as intl;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';
import '../../widgets/app_photo_viewer.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/pick_image_bottom_sheet.dart';
import 'add_invoice_product.dart';

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

  late final TextEditingController amount_paidController;

  final TextEditingController renewController = TextEditingController();

  late String typepayController = '1';

  late String typeinstallController = '1';
  late String readyinstallController = '1';
  late int currencyController = 1;

  final TextEditingController noteController = TextEditingController();
  final TextEditingController numbranchController = TextEditingController();
  final TextEditingController numuserController = TextEditingController();
  final TextEditingController userclientController = TextEditingController();
  final TextEditingController nummostawdaController = TextEditingController();
  final TextEditingController numTaxController = TextEditingController();
  final TextEditingController renewAdditionalOfBranchesController = TextEditingController();
  final TextEditingController renewAgentController = TextEditingController();

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
  ValueNotifier<File?> companyLogoNotifier = ValueNotifier(null);
  ValueNotifier<File?> recordCommercialImageNotifier = ValueNotifier(null);
  InvoiceModel? _invoice = null;
  ValueNotifier<bool> isDeleteCompanyLogoNetworkImage = ValueNotifier(false);
  ValueNotifier<bool> isDeleteRecordCommercialImageNetworkImage = ValueNotifier(false);

  ValueNotifier<bool> isNumberOfBranchesBiggerThanOne = ValueNotifier(false);

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
    invoiceViewmodel = context.read<invoice_vm>();
    if (_invoice == null) _invoice = InvoiceModel(products: []);
    amount_paidController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(false);

      invoiceViewmodel.listproductinvoic = [];
      invoiceViewmodel.set_total('0'.toString());
      print('init in addinvoice screen main');
      totalController = '0';
      _invoice = widget.invoice;
      numbranchController.addListener(() {
        num number = 0;
        if (numbranchController.text.isNotEmpty) {
          number = num.tryParse(numbranchController.text) ?? 0;
        }
        isNumberOfBranchesBiggerThanOne.value = number > 1;
      });

      if (_invoice != null) {
        print('in if invoice');
        //in mode edit
        totalController = _invoice!.total.toString();
        // Provider.of<invoice_vm>(context,listen: false).set_total(totalController.toString());
        numuserController.text = _invoice!.numusers == null ? '' : _invoice!.numusers.toString();
        nummostawdaController.text = _invoice!.nummostda == null ? '' : _invoice!.nummostda.toString();

        numbranchController.text = _invoice!.numbarnch == null ? '' : _invoice!.numbarnch.toString();
        renewAdditionalOfBranchesController.text = _invoice!.renewPlus == null ? '' : _invoice!.renewPlus.toString();
        renewAgentController.text = _invoice!.renewPlus == null ? '' : _invoice!.renew_agent.toString();
        numTaxController.text = _invoice!.numTax == null ? '' : _invoice!.numTax.toString();
        userclientController.text = _invoice!.clientusername == null ? '' : _invoice!.clientusername.toString();
        addressController.text = _invoice!.address_invoice == null ? '' : _invoice!.address_invoice.toString();

        amount_paidController.text = _invoice!.amountPaid.toString();
        renewController.text = _invoice!.renewYear.toString();
        renew2Controller.text = _invoice!.renew2year.toString();

        typepayController = _invoice!.typePay.toString();
        currencyController = _invoice!.currency_name == null ? 1 : int.parse(_invoice!.currency_name.toString());
        print(typepayController.toString());
        typeinstallController = _invoice!.typeInstallation.toString();
        print(typeinstallController);
        if (_invoice!.ready_install != null) readyinstallController = _invoice!.ready_install!;

        noteController.text = _invoice!.notes.toString();
        imageController.text = _invoice!.imageRecord.toString();
        invoiceViewmodel
          ..listproductinvoic = _invoice!.products!
          ..initAdditionalInformation(_invoice!);

        sellerCommissionRate.text = _invoice?.rate_participate != null && _invoice?.rate_participate != ""
            ? _invoice!.rate_participate.toString()
            : "";
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
        renewController.text = '0';
        renew2Controller.text = '0';

        //);

        invoiceViewmodel.listproductinvoic = [];
      }
      invoiceViewmodel.set_total(totalController.toString());

      amount_paidController.addListener(() {
        final total = num.tryParse(context.read<invoice_vm>().total) ?? 0;
        final amountPaid = num.tryParse(amount_paidController.text) ?? 0;

        if (amountPaid > total) {
          amount_paidController.text = total.toString();
          amount_paidController.selection =
              TextSelection.fromPosition(TextPosition(offset: amount_paidController.text.length));
        }
      });
      Provider.of<selected_button_provider>(context, listen: false).selectValuetypepay(int.parse(typepayController));
      print(typepayController);

      context.read<selected_button_provider>()
        ..selectValuereadyinstall(int.parse(readyinstallController), isInit: true)
        ..selectValuetypeinstall(int.parse(typeinstallController.toString()))
        ..selectValueCurrency(int.parse(currencyController.toString()));

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
                                CupertinoPageRoute(
                                  builder: (context) => add_invoiceProduct(invoice: _invoice
                                      // Provider.of<invoice_vm>(context,listen: false)
                                      //     .listinvoiceClient[widget.indexinvoice],
                                      // indexinvoic:  widget.indexinvoice,
                                      ),
                                ),
                                (Route<dynamic> route) => true);
                            // Navigator.push(context, CupertinoPageRoute(
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
                      RowEdit(name: 'عنوان الفاتورة', des: '*'),
                      EditTextFormField(
                        vaild: (value) {
                          if (value.toString().trim().isEmpty) {
                            return label_empty;
                          }
                          return null;
                        },
                        maxline: 3,
                        paddcustom: EdgeInsets.all(16),
                        hintText: '',
                        obscureText: false,
                        controller: addressController,
                      ),
                      RowEdit(name: label_amount_paid, des: '*'),
                      EditTextFormField(
                        obscureText: false,
                        hintText: label_amount_paid,
                        vaild: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return label_empty;
                          }
                          if (num.tryParse(value.toString()) == null) return 'من فضلك ادخل عدد';

                          if (num.parse(value!) <= 0) {
                            return "يجب إدخال قيمة مناسبة";
                          }

                          final total = num.tryParse(context.read<invoice_vm>().total) ?? 0;
                          final amountPaid = num.tryParse(value) ?? 0;

                          if (amountPaid > total) {
                            return "لا يمكن إدخال مبلغ أكبر من قيمة الفاتورة.";
                          }
                          return null;
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
                      Consumer<invoice_vm>(
                        builder: (context, data, _) {
                          bool invoiceHaveProductsOfTypePrograms = data.listproductinvoic
                              .any((element) => element.type == ProductType.program.index.toString());
                          return RowEdit(name: label_renew, des: invoiceHaveProductsOfTypePrograms ? "*" : ' ');
                        },
                      ),
                      Consumer<invoice_vm>(
                        builder: (context, data, _) {
                          bool invoiceHaveProductsOfTypePrograms = data.listproductinvoic
                              .any((element) => element.type == ProductType.program.index.toString());

                          return EditTextFormField(
                            hintText: label_renew,
                            obscureText: false,
                            vaild: (value) {
                              if ((value?.trim() == '0' || (value?.trim().isEmpty ?? true)) &&
                                  invoiceHaveProductsOfTypePrograms) {
                                return 'الحقل مطلوب.';
                              }
                              if (double.tryParse(value.toString()) == null) return 'من فضلك ادخل عدد';

                              if (num.parse(value!) < 0) {
                                return "يجب إدخال قيمة أكبر من 0.";
                              }
                              return null;
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
                          );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Consumer<invoice_vm>(
                        builder: (context, data, _) {
                          bool invoiceHaveProductsOfTypeResources =
                              data.listproductinvoic.any((element) => element.typeProdRenew == "resources");
                          return RowEdit(name: label_renew2year, des: invoiceHaveProductsOfTypeResources ? "*" : ' ');
                        },
                      ),
                      Consumer<invoice_vm>(builder: (_, data, __) {
                        bool invoiceHaveProductsOfTypeResources =
                            data.listproductinvoic.any((element) => element.typeProdRenew == "resources");

                        return EditTextFormField(
                          hintText: label_renew2year,
                          obscureText: false,
                          vaild: (value) {
                            if ((value?.trim() == '0' || (value?.trim().isEmpty ?? true)) &&
                                invoiceHaveProductsOfTypeResources) {
                              return 'الحقل مطلوب.';
                            }

                            if (num.parse(value!) < 0) {
                              return "يجب إدخال قيمة أكبر من 0.";
                            }
                            return null;
                          },
                          inputType: TextInputType.number,
                          // inputformate: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          controller: renew2Controller,
                          //اسم المؤسسة
                          label: label_renew2year,
                          inputformate: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (val) {
                            // nameprod = val;
                          },
                        );
                      }),
                      SizedBox(
                        height: 5,
                      ),

                      //admin
                      RowEdit(name: label_typepay, des: '*'),
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
                          return Directionality(
                            textDirection: TextDirection.ltr,
                            child: GroupButton(
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
                                }),
                          );
                        }),
                      ),
                      //manage
                      SizedBox(
                        height: 5,
                      ),
                      RowEdit(name: label_typeinstall, des: '*'),
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
                          return Directionality(
                            textDirection: TextDirection.ltr,
                            child: GroupButton(
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
                                }),
                          );
                        }),
                      ),
                      //RowEdit(name: 'Image', des: ''),

                      SizedBox(
                        height: 15,
                      ),
                      _invoice!.idInvoice == null ? RowEdit(name: label_readyinstall, des: '*') : Container(),
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
                                return Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: GroupButton(
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
                                      }),
                                );
                              }),
                            )
                          : Container(),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: 'العملة', des: '*'),
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
                          return Directionality(
                            textDirection: TextDirection.ltr,
                            child: GroupButton(
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
                                  currencyController = index;
                                  selectedProvider.selectValueCurrency(index);
                                  //  });
                                }),
                          );
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
                                  vaild: (value) {
                                    if (value?.trim().isNotEmpty ?? false) {
                                      if (value!.length < 15) {
                                        return "يجب إدخال 15 محرف.";
                                      }
                                      return null;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ValueListenableBuilder<bool>(
                          valueListenable: isNumberOfBranchesBiggerThanOne,
                          builder: (context, value, _) {
                            return AnimatedOpacity(
                              opacity: value ? 1.0 : 0.0,
                              duration: kTabScrollDuration,
                              child: Offstage(
                                offstage: !value,
                                child: Column(
                                  children: [
                                    RowEdit(name: 'تجديد الفروع الاضافي', des: "*"),
                                    EditTextFormField(
                                      inputType: TextInputType.number,
                                      inputformate: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                      paddcustom: EdgeInsets.all(16),
                                      hintText: '',
                                      obscureText: false,
                                      controller: renewAdditionalOfBranchesController,
                                      vaild: (text) {
                                        if (!value) {
                                          return null;
                                        }

                                        if ((text?.trim().isEmpty ?? true) && value) {
                                          return 'الحقل مطلوب.';
                                        }
                                        if (text?.isEmpty ?? true) return null;

                                        if ((num.tryParse(text!) ?? 0) <= 0) {
                                          return "يجب إدخال قيمة أكبر من 0.";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
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
                      SizedBox(height: 20),
                      ValueListenableBuilder<File?>(
                          valueListenable: companyLogoNotifier,
                          builder: (context, companyLogo, _) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: isDeleteCompanyLogoNetworkImage,
                                builder: (context, isDeleteCompanyLogo, _) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (companyLogo != null ||
                                          ((_invoice!.imagelogo?.isNotEmpty ?? false) && !isDeleteCompanyLogo)) ...{
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () => pickImage((context, file) => onPickCompanyLogo(file)),
                                              borderRadius: BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(Icons.attachment_rounded,
                                                    color: Colors.grey.shade700, size: 20),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => onDeleteCompanyLogo(),
                                              borderRadius: BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.delete_rounded,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 20),
                                      },
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: companyLogo != null
                                            ? ClipOval(
                                                child:
                                                    Image.file(companyLogo, fit: BoxFit.cover, height: 150, width: 150))
                                            : ((_invoice!.imagelogo?.isNotEmpty ?? false) && !isDeleteCompanyLogo)
                                                ? InkWell(
                                                    onTap: () =>
                                                        AppPhotoViewer(urls: [_invoice!.imagelogo!]).show(context),
                                                    child: ClipOval(
                                                      child: FancyImageShimmerViewer(
                                                        imageUrl: _invoice!.imagelogo!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    borderRadius: BorderRadius.circular(15),
                                                    onTap: () => pickImage((context, file) => onPickCompanyLogo(file)),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.attachment_rounded,
                                                            color: Colors.grey.shade700, size: 35),
                                                        SizedBox(height: 0),
                                                        Text(
                                                          'Attach logo',
                                                          style: context.textTheme.titleMedium?.copyWith(
                                                              fontFamily: kfontfamily2,
                                                              fontWeight: FontWeight.w700,
                                                              color: Colors.grey.shade600),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                      ),
                                    ],
                                  );
                                });
                          }),
                      SizedBox(height: 20),

                      // TextFormField(
                      //   controller: logoController,
                      //   obscureText: false,
                      //   cursorColor: Colors.black,
                      //   onTap: () async {
                      //     ImagePicker imagePicker = ImagePicker();
                      //     final pickedImage = await imagePicker.pickImage(
                      //       source: ImageSource.gallery,
                      //       imageQuality: 100,
                      //     );
                      //     File? pickedFile = File(pickedImage!.path);
                      //     setState(() {
                      //       print(pickedFile.path);
                      //       _myfilelogo = pickedFile;
                      //       logoController.text = pickedFile.path;
                      //     });
                      //
                      //     // _invoice!.path=pickedFile.path;
                      //   },
                      //   readOnly: true,
                      //   decoration: InputDecoration(
                      //     contentPadding: EdgeInsets.all(2),
                      //     prefixIcon: Icon(
                      //       Icons.add_photo_alternate,
                      //       color: kMainColor,
                      //     ),
                      //     hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                      //     hintText: '',
                      //     filled: true,
                      //     fillColor: Colors.grey.shade200,
                      //     enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: const BorderSide(color: Colors.white)),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: const BorderSide(color: Colors.white)),
                      //     errorBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: const BorderSide(color: Colors.white)),
                      //     focusedErrorBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: const BorderSide(color: Colors.white)),
                      //   ),
                      // ),
                      // _invoice!.imagelogo != null && widget.invoice!.imagelogo.toString().isNotEmpty
                      //     ? Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Container(
                      //           height: 40,
                      //           width: 50,
                      //           child: Stack(
                      //             alignment: Alignment.center,
                      //             children: [
                      //               Image.network(_invoice!.imagelogo.toString()),
                      //               // Positioned(
                      //               //     bottom: 0,
                      //               //     child: Text(
                      //               //       'smart life',
                      //               //       style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Pacifico'),)
                      //               // )
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     : Container(),
                      RowEdit(name: label_image, des: ''),
                      SizedBox(width: 20),
                      //show chose image
                      // EditTextFormField(
                      //   read: true,
                      //   icon: Icons.camera,
                      //   hintText: label_image,
                      //   ontap: () async {
                      //     ImagePicker imagePicker = ImagePicker();
                      //     final pickedImage = await imagePicker.pickImage(
                      //       source: ImageSource.gallery,
                      //       imageQuality: 100,
                      //     );
                      //     File? pickedFile = File(pickedImage!.path);
                      //     print(pickedFile.path);
                      //     // _myfile = pickedFile;
                      //
                      //     _invoice!.path = pickedFile.path;
                      //
                      //     // imageController.text = _myfile!.path;
                      //
                      //     //Navigator.of(context).pop();
                      //     //  FilePickerResult? result
                      //     //  = await FilePicker.platform.pickFiles(
                      //     //   // allowedExtensions: ['pdf'],
                      //     //  );
                      //     // //
                      //     //  if (result != null) {
                      //     //   File? file = File(result.files.single.path.toString());
                      //     //  _myfile=file;
                      //     //   imageController.text=file.path;
                      //     //   _invoice!.path=file.path;
                      //     //   //   _pickFiles();
                      //     // //   _saveFile();
                      //     // } else {
                      //     //   // User canceled the picker
                      //     // }
                      //     //  setState(() {
                      //     //
                      //     //  });
                      //   },
                      //   obscureText: false,
                      //   controller: imageController,
                      // ),

                      ValueListenableBuilder<File?>(
                          valueListenable: recordCommercialImageNotifier,
                          builder: (context, recordCommercialImage, _) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: isDeleteRecordCommercialImageNetworkImage,
                                builder: (context, isDeleteRecordCommercial, _) {
                                  return Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: Alignment.center,
                                    child: recordCommercialImage != null
                                        ? Stack(
                                            children: [
                                              Positioned.fill(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(15),
                                                  child: Image.file(recordCommercialImage, fit: BoxFit.cover),
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () => pickImage(
                                                            (context, file) => onPickCommercialRecordImage(file)),
                                                        borderRadius: BorderRadius.circular(90),
                                                        child: Container(
                                                          height: 40,
                                                          width: 40,
                                                          margin: EdgeInsets.only(top: 10, right: 15),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey.shade50,
                                                            shape: BoxShape.circle,
                                                          ),
                                                          alignment: Alignment.center,
                                                          child: Icon(Icons.attachment_rounded,
                                                              color: Colors.grey.shade700, size: 20),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () => onDeleteCommercialRecordImage(),
                                                        borderRadius: BorderRadius.circular(90),
                                                        child: Container(
                                                          height: 40,
                                                          width: 40,
                                                          margin: EdgeInsets.only(top: 10, left: 15),
                                                          decoration: BoxDecoration(
                                                            color: Colors.grey.shade50,
                                                            shape: BoxShape.circle,
                                                          ),
                                                          alignment: Alignment.center,
                                                          child: Icon(
                                                            Icons.delete_rounded,
                                                            color: Colors.red,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : ((_invoice!.imageRecord?.isNotEmpty ?? false) && !isDeleteRecordCommercial)
                                            ? InkWell(
                                                onTap: () =>
                                                    AppPhotoViewer(urls: [_invoice!.imageRecord!]).show(context),
                                                child: Stack(
                                                  children: [
                                                    Positioned.fill(
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(15),
                                                        child: FancyImageShimmerViewer(
                                                          imageUrl: _invoice!.imageRecord!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned.fill(
                                                      child: Align(
                                                        alignment: Alignment.topRight,
                                                        child: Row(
                                                          children: [
                                                            InkWell(
                                                              onTap: () => pickImage(
                                                                  (context, file) => onPickCommercialRecordImage(file)),
                                                              borderRadius: BorderRadius.circular(90),
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                                decoration: BoxDecoration(
                                                                  color: Colors.grey.shade50,
                                                                  shape: BoxShape.circle,
                                                                ),
                                                                alignment: Alignment.center,
                                                                child: Icon(Icons.attachment_rounded,
                                                                    color: Colors.grey.shade700, size: 20),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () => onDeleteCommercialRecordImage(),
                                                              borderRadius: BorderRadius.circular(90),
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                                decoration: BoxDecoration(
                                                                  color: Colors.grey.shade50,
                                                                  shape: BoxShape.circle,
                                                                ),
                                                                alignment: Alignment.center,
                                                                child: Icon(
                                                                  Icons.delete_rounded,
                                                                  color: Colors.red,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : InkWell(
                                                borderRadius: BorderRadius.circular(15),
                                                onTap: () =>
                                                    pickImage((context, file) => onPickCommercialRecordImage(file)),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.attachment_rounded,
                                                        color: Colors.grey.shade700, size: 35),
                                                    SizedBox(height: 0),
                                                    Text(
                                                      'Attach image',
                                                      style: context.textTheme.titleMedium?.copyWith(
                                                          fontFamily: kfontfamily2,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.grey.shade600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                  );
                                });
                          }),

                      // SizedBox(height: 20),
                      // _invoice!.imageRecord.toString().isNotEmpty
                      //     ? Center(
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             IconButton(
                      //                 iconSize: 50,
                      //                 onPressed: () async {
                      //                   Navigator.push(
                      //                       context,
                      //                       CupertinoPageRoute(
                      //                           builder: (context) => photoviewcustom(
                      //                                 urlimagecon: _invoice!.imageRecord.toString(),
                      //                               ) // support_view(type: 'only',)
                      //                           ));
                      //                 },
                      //                 icon: Icon(
                      //                   Icons.image,
                      //                   color: kMainColor,
                      //                 ))
                      //             // Text('فتح الملف'),
                      //             // IconButton(
                      //             //   iconSize: 50,
                      //             //      onPressed: ()async {
                      //             //   //await FilePicker.platform.
                      //             //   if( _invoice!.imageRecord.toString().isNotEmpty){
                      //             //     Provider.of<LoadProvider>(context, listen: false)
                      //             //         .changebooladdinvoice(true);
                      //             //   File? filee=await  createFileOfPdfUrl(_invoice!.imageRecord.toString());
                      //             //     Provider.of<LoadProvider>(context, listen: false)
                      //             //         .changebooladdinvoice(false);
                      //             //       Navigator.push(
                      //             //         context,
                      //             //         CupertinoPageRoute(
                      //             //           builder: (context) => PDFScreen(
                      //             //               path: filee.path),
                      //             //         ),
                      //             //       );
                      //             //     //   String url =_invoice!.imageRecord.toString();
                      //             //     //   if (await canLaunch(url)) {
                      //             //     //     await launch(url);
                      //             //     //   } else {
                      //             //     //     throw 'Could not launch $url';
                      //             //        }
                      //             //
                      //             // }, icon:Icon( Icons.image)),
                      //           ],
                      //         ),
                      //       )
                      //     : Container(),

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
                            return Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
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
                                    buttonWidth: (MediaQuery.of(context).size.width - 130) / 4,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  buttons: ['موزع', 'وكيل', 'متعاون', 'موظف'],
                                  onSelected: (_, index, isselected) {
                                    invoiceViewmodel.onChangeSellerType(
                                        SellerType.values.firstWhere((element) => element.index == index));
                                  },
                                ),
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
                        if (selectedSellerType != null && selectedSellerType != SellerType.employee)
                          return Column(
                            children: [
                              RowEdit(
                                  name: selectedSellerType == SellerType.agent
                                      ? "اسم الوكيل"
                                      : selectedSellerType == SellerType.collaborator
                                          ? "اسم المتعاون"
                                          : "اسم الموزع"),
                              SizedBox(height: 5),
                              if (sellerStatus == SellerStatus.loading)
                                loadingWidget
                              else if (sellerStatus == SellerStatus.failed)
                                refreshIcon(() {})
                              else if (isCollaborate)
                                collaborateDropdown(
                                  participates: collaboratesList,
                                  selectedValue: selectedCollaborate,
                                  selectedSellerType: selectedSellerType,
                                )
                              // sellerDropdown<ParticipateModel>(
                              //   collaboratesList,
                              //   selectedSellerType,
                              //   selectedValue: selectedCollaborate,
                              // )
                              else
                                sellerDropdown<AgentDistributorModel>(
                                  agentsListtemp, // agentsList,
                                  selectedSellerType,
                                  selectedValue: selectedAgent,
                                ),
                              SizedBox(height: 10),
                              Selector<invoice_vm, SellerType?>(
                                selector: (_, vm) => vm.selectedSellerType,
                                builder: (context, selectedSellerType, _) {
                                  return Column(
                                    children: [
                                      RowEdit(
                                          name: selectedSellerType == SellerType.agent
                                              ? "نسبة عمولة الوكيل"
                                              : selectedSellerType == SellerType.collaborator
                                                  ? "نسبة عمولة المتعاون"
                                                  : "نسبة عمولة الموزع"),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: sellerCommissionRate,
                                        obscureText: false,
                                        cursorColor: Colors.black,
                                        readOnly: false,
                                        validator: (text) {
                                          if (text?.trim().isEmpty ?? true) {
                                            if (selectedSellerType == SellerType.employee) {
                                              return null;
                                            }
                                            return "هذا الحقل مطلوب.";
                                          }

                                          if (num.tryParse(text ?? "0") == null) return "أدخل رقم صحيح.";

                                          if (num.parse(text!) <= 0) {
                                            return "يجب إدخال قيمة أكبر من 0.";
                                          }
                                          if (num.parse(text) > 100) {
                                            return "النسبة يجب أن تكون أصغر أو تساوي 100";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          hintStyle: const TextStyle(
                                              color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
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
                                      SizedBox(height: 10),
                                      if (selectedSellerType == SellerType.agent) ...{
                                        RowEdit(name: "نسبة الوكيل من التجديد"),
                                        SizedBox(height: 5),
                                        TextFormField(
                                          controller: renewAgentController,
                                          obscureText: false,
                                          cursorColor: Colors.black,
                                          readOnly: false,
                                          validator: (text) {
                                            if (text?.trim().isEmpty ?? true) {
                                              if (selectedSellerType != SellerType.agent) {
                                                return null;
                                              }
                                              return "هذا الحقل مطلوب.";
                                            }

                                            if (num.tryParse(text ?? "0") == null) return "أدخل رقم صحيح.";

                                            if (num.parse(text!) <= 0) {
                                              return "يجب إدخال قيمة أكبر من 0.";
                                            }
                                            if (num.parse(text) > 100) {
                                              return "النسبة يجب أن تكون أصغر أو تساوي 100";
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            hintStyle: const TextStyle(
                                                color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
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
                                      },
                                    ],
                                  );
                                },
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
                                final validate = _globalKey.currentState!.validate();
                                if (validate) {
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

                                    final user = context.read<user_vm_provider>();
                                    if (_invoice?.idInvoice != null) {
                                      String? invoiceID = _invoice!.idInvoice;
                                      invoiceViewmodel.update_invoiceclient_vm(
                                        {
                                          "name_enterprise": widget.itemClient.nameEnterprise,
                                          "name_client": widget.itemClient.nameClient.toString(),
                                          "nameUser": user.currentUser.nameUser,
                                          "renew_year": renewController.text.toString(),
                                          "renew2year": renew2Controller.text.toString(),
                                          "type_pay": typepayController.toString(),
                                          // "date_create": DateTime.now().toString(),
                                          "type_installation": typeinstallController.toString(),
                                          "ready_install": _invoice!.ready_install,
                                          // "user_not_ready_install": Provider.of<user_vm_provider>(context, listen: false)
                                          //     .currentUser
                                          //     .idUser
                                          //     .toString(),
                                          "currency_name": currencyController.toString(),

                                          /////////////////////////////////////////////////////////////////////
                                          "amount_paid": amount_paidController.text.toString(),
                                          'fk_regoin': widget.invoice!.fk_regoin.toString(),
                                          'fk_regoin_invoice': widget.invoice?.fk_regoin_invoice,
                                          'region_invoice_name': widget.invoice!.name_regoin_invoice,
                                          'fkcountry': widget.invoice!.fk_country.toString(),
                                          "fk_idClient": widget.itemClient.idClients.toString(),
                                          "fk_idUser": user.currentUser.idUser,
                                          "image_record": widget.invoice!.imageRecord.toString(),
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
                                          'imagelogo': widget.invoice!.imagelogo.toString(),
                                          'numbarnch': numbranchController.text.toString(),
                                          'renew_pluse': renewAdditionalOfBranchesController.text.toString(),
                                          'nummostda': nummostawdaController.text.toString(),
                                          'numusers': numuserController.text.toString(),
                                          'numTax': numTaxController.text.toString(),
                                          'address_invoice': addressController.text.toString(),
                                          'clientusername': userclientController.text.toString(),
                                          'date_lastuserupdate': DateTime.now().toString(),

                                          if (invoiceViewmodel.selectedSellerType == SellerType.collaborator &&
                                              invoiceViewmodel.selectedCollaborator?.id_participate != null)
                                            'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                          else if (invoiceViewmodel.selectedSellerType == SellerType.agent &&
                                              invoiceViewmodel.selectedAgent != null)
                                            'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                          else if (invoiceViewmodel.selectedSellerType == SellerType.distributor &&
                                              invoiceViewmodel.selectedDistributor != null)
                                            'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                          else
                                            'type_seller': "3",
                                          // widget.invoice?.type_seller != "3" ? null.toString() : '3',
                                          // type seller is employee,

                                          if (sellerCommissionRate.text.isNotEmpty &&
                                              invoiceViewmodel.selectedSellerType != SellerType.employee)
                                            'rate_participate': sellerCommissionRate.text,

                                          if (renewAgentController.text.isNotEmpty &&
                                              invoiceViewmodel.selectedSellerType == SellerType.agent)
                                            'renew_agent': renewAgentController.text,

                                          if (invoiceViewmodel.selectedSellerType == SellerType.agent)
                                            'fk_agent': invoiceViewmodel.selectedAgent?.idAgent.toString()
                                          else if (invoiceViewmodel.selectedSellerType == SellerType.distributor)
                                            'fk_agent': invoiceViewmodel.selectedDistributor?.idAgent.toString(),

                                          if (invoiceViewmodel.selectedSellerType == SellerType.collaborator)
                                            'participate_fk':
                                                invoiceViewmodel.selectedCollaborator?.id_participate.toString()
                                          else
                                            'participate_fk': null.toString(),

                                          if (invoiceViewmodel.selectedSellerType == SellerType.collaborator ||
                                              invoiceViewmodel.selectedSellerType == SellerType.employee)
                                            'fk_agent': null.toString()

                                          // 'type_seller':
                                          // 'rate_participate':

                                          // 'fk_agent':
                                          // 'participate_fk':
                                        },
                                        invoiceID,
                                        recordCommercialImageNotifier.value,
                                        companyLogoNotifier.value,
                                      ).then((value) => value != false
                                          ? clear(context, invoiceID.toString(), _products)
                                          : error(context));
                                    } else {
                                      var body = {
                                        "name_enterprise": widget.itemClient.nameEnterprise,
                                        "name_client": widget.itemClient.nameClient.toString(),
                                        "nameUser": user.currentUser.nameUser,
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
                                        "image_record": recordCommercialImageNotifier.value?.path.toString() ?? '',
                                        "fk_idClient": widget.itemClient.idClients.toString(),
                                        "fk_idUser": user.currentUser.idUser,
                                        //the same user that create a client not current user
                                        "total": totalController.toString(),
                                        "notes": noteController.text.toString(),
                                        'fk_regoin': widget.itemClient.fkRegoin.toString(),
                                        'fk_regoin_invoice': user.currentUser.fkRegoin,
                                        'region_invoice_name': user.currentUser.nameRegoin,
                                        'fkcountry': widget.itemClient.fkcountry.toString(),
                                        'numbarnch': numbranchController.text.toString(),
                                        'renew_pluse': renewAdditionalOfBranchesController.text.toString(),
                                        'nummostda': nummostawdaController.text.toString(),
                                        'numusers': numuserController.text.toString(),
                                        'address_invoice': addressController.text.toString(),

                                        if (invoiceViewmodel.selectedSellerType == SellerType.collaborator &&
                                            invoiceViewmodel.selectedCollaborator?.id_participate != null)
                                          'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                        else if (invoiceViewmodel.selectedSellerType == SellerType.agent &&
                                            invoiceViewmodel.selectedAgent != null)
                                          'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                        else if (invoiceViewmodel.selectedSellerType == SellerType.distributor &&
                                            invoiceViewmodel.selectedDistributor != null)
                                          'type_seller': invoiceViewmodel.selectedSellerType?.index.toString()
                                        else
                                          'type_seller': '3', // type seller is employee,

                                        if (sellerCommissionRate.text.isNotEmpty &&
                                            invoiceViewmodel.selectedSellerType != SellerType.employee)
                                          'rate_participate': sellerCommissionRate.text,

                                        if (renewAgentController.text.isNotEmpty &&
                                            invoiceViewmodel.selectedSellerType == SellerType.agent)
                                          'renew_agent': renewAgentController.text,

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
                                      invoiceViewmodel
                                          .add_invoiceclient_vm(
                                            body,
                                            recordCommercialImageNotifier.value,
                                            companyLogoNotifier.value,
                                          )
                                          .then((value) =>
                                              value != "false" ? clear(context, value, _products) : error(context));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
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
        String res = await invoiceViewmodel.add_invoiceProduct_vm(body);

        if (res != "false") {
          body.addAll({
            'idInvoiceProduct': res,
          });
          invoiceViewmodel.listproductinvoic[i].idInvoiceProduct = res;
        }
      } //if
      else {
        //update product in invoice
        print('before else');
        Map<String, dynamic?> body = _products[i].toJson();
        print('after else');
        bool res = await invoiceViewmodel.update_invoiceProduct_vm(body, _products[i].idInvoiceProduct.toString());
      }
    }

    //for loop
    int index1 = invoiceViewmodel.listinvoices.indexWhere((element) => element.idInvoice == value);

    // _invoice=Provider.of<invoice_vm>(context,listen: false)
    //     .listinvoices[index1];
    // _invoice!.idInvoice=value;
    //  _invoice!.products
    //    = Provider
    //        .of<invoice_vm>(context, listen: false)
    //        .listproductinvoic;
    // //
    if (index1 != -1) {
      invoiceViewmodel.listinvoices[index1].products = _invoice!.products;
    }

    if (invoiceViewmodel.currentInvoice != null) {
      final invoiceTemp = invoiceViewmodel.currentInvoice!;
      invoiceTemp.products = _invoice!.products;
      invoiceViewmodel.setCurrentInvoice(invoiceTemp, needRefresh: true);
    }
    invoiceViewmodel.updatelistproducetInvoice();
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
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

  Widget collaborateDropdown({
    required List<ParticipateModel> participates,
    required ParticipateModel? selectedValue,
    required SellerType selectedSellerType,
  }) {
    return DropdownSearch<ParticipateModel>(
      mode: Mode.DIALOG,
      filterFn: (user, filter) => user!.getFilterParticipate(filter ?? ''),
      compareFn: (item, selectedItem) => item?.id_participate == selectedItem?.id_participate,
      showSelectedItems: true,
      items: participates,
      itemAsString: (u) => u!.name_participate,
      onChanged: (seller) {
        invoiceViewmodel.onChangeSelectedCollaborator(seller as ParticipateModel);
      },
      selectedItem: selectedValue,
      showSearchBox: true,
      validator: (text) {
        if (selectedSellerType == SellerType.employee) {
          return null;
        }

        if (text == null) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      dropdownSearchDecoration: InputDecoration(
        isCollapsed: true,
        hintText: 'اختر المتعاون',
        alignLabelWithHint: true,
        fillColor: Colors.grey.withOpacity(0.2),
        contentPadding: EdgeInsets.all(0),
        border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
      ),
    );
  }

  Widget sellerDropdown<T>(
    List<T> sellerNames,
    SellerType selectedSellerType, {
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
              if (selectedSellerType == SellerType.employee) {
                return null;
              }

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
            hint: Text(selectedSellerType == SellerType.distributor ? "اختر الموزع" : "اختر الوكيل"),
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

  pickImage(PickFileCallback onPickFile) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(onPickFile: onPickFile),
    );
  }

  void onPickCommercialRecordImage(File file) {
    recordCommercialImageNotifier.value = file;
  }

  void onDeleteCommercialRecordImage() {
    if ((_invoice!.imageRecord?.isNotEmpty ?? false) && !isDeleteRecordCommercialImageNetworkImage.value) {
      isDeleteRecordCommercialImageNetworkImage.value = true;
      return;
    }
    recordCommercialImageNotifier.value = null;
  }

  void onPickCompanyLogo(File file) {
    companyLogoNotifier.value = file;
  }

  void onDeleteCompanyLogo() {
    if ((_invoice!.imagelogo?.isNotEmpty ?? false) && !isDeleteCompanyLogoNetworkImage.value) {
      isDeleteCompanyLogoNetworkImage.value = true;
      return;
    }
    companyLogoNotifier.value = null;
  }
}
