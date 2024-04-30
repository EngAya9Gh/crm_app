import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/enums/seller_type_enum.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/ui/screen/invoice/seller_widget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' as intl;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../constantsList.dart';
import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/app/presentation/widgets/app_drop_down.dart';
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../view_model/comment.dart';
import '../../widgets/app_photo_viewer.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/invoice_widget/file_viewer_widget.dart';
import '../../widgets/pick_image_bottom_sheet.dart';
import 'add_invoice_product.dart';
import 'invoice_images_file.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({
    required this.itemClient,
    this.invoice,
    Key? key,
  }) : super(key: key);
  final ClientModel1 itemClient;

  final InvoiceModel? invoice;

  @override
  _AddInvoiceState createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
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
  final TextEditingController renewAdditionalOfBranchesController =
      TextEditingController();
  final TextEditingController renewAgentController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController renew2Controller = TextEditingController();
  final TextEditingController sellerCommissionRate = TextEditingController();
  final TextEditingController comment = TextEditingController();
  ValueNotifier<File?> companyLogoNotifier = ValueNotifier(null);
  ValueNotifier<File?> recordCommercialImageNotifier = ValueNotifier(null);
  InvoiceModel? _invoice = null;
  ValueNotifier<bool> isDeleteCompanyLogoNetworkImage = ValueNotifier(false);
  ValueNotifier<bool> isDeleteRecordCommercialImageNetworkImage =
      ValueNotifier(false);

  ValueNotifier<bool> isNumberOfBranchesBiggerThanOne = ValueNotifier(false);
  List<String> deletedFiles = [];
  String? selectedInvoiceSource;

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
    comment.dispose();
    renewAdditionalOfBranchesController.dispose();
    renewAgentController.dispose();
    renew2Controller.dispose();
    sellerCommissionRate.dispose();
    companyLogoNotifier.dispose();
    recordCommercialImageNotifier.dispose();
    isDeleteCompanyLogoNetworkImage.dispose();
    isDeleteRecordCommercialImageNetworkImage.dispose();
    isNumberOfBranchesBiggerThanOne.dispose();

    super.dispose();
  }

  late InvoiceVm invoiceVm;

  @override
  void initState() {
    invoiceVm = context.read<InvoiceVm>();
    if (_invoice == null) _invoice = InvoiceModel(products: []);
    amount_paidController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Add Your Code here.
      Provider.of<LoadProvider>(context, listen: false)
          .changebooladdinvoice(false);

      invoiceVm.productsInvoiceList = [];
      invoiceVm.set_total('0');

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
        selectedInvoiceSource =
            _invoice!.invoice_source == null ? '' : _invoice!.invoice_source;
        invoiceVm.initAttachFiles(_invoice!.filesAttach ?? []);
        //in mode edit
        totalController = _invoice!.total.toString();
        // Provider.of<invoice_vm>(context,listen: false).set_total(totalController.toString());
        numuserController.text =
            _invoice!.numusers == null ? '' : _invoice!.numusers.toString();
        nummostawdaController.text =
            _invoice!.nummostda == null ? '' : _invoice!.nummostda.toString();

        numbranchController.text =
            _invoice!.numbarnch == null ? '' : _invoice!.numbarnch.toString();
        renewAdditionalOfBranchesController.text =
            _invoice!.renewPlus == null ? '' : _invoice!.renewPlus.toString();
        renewAgentController.text =
            _invoice!.renewPlus == null ? '' : _invoice!.renew_agent.toString();
        numTaxController.text =
            _invoice!.numTax == null ? '' : _invoice!.numTax.toString();
        userclientController.text = _invoice!.clientusername == null
            ? ''
            : _invoice!.clientusername.toString();
        addressController.text = _invoice!.address_invoice == null
            ? ''
            : _invoice!.address_invoice.toString();

        amount_paidController.text = _invoice!.amountPaid.toString();
        renewController.text = _invoice!.renewYear.toString();
        renew2Controller.text = _invoice!.renew2year.toString();

        typepayController = _invoice!.typePay.toString();
        currencyController = _invoice!.currency_name == null
            ? 1
            : int.parse(_invoice!.currency_name.toString());

        typeinstallController = _invoice!.typeInstallation.toString();

        if (_invoice!.ready_install != null)
          readyinstallController = _invoice!.ready_install!;

        noteController.text = _invoice!.notes.toString();
        imageController.text = _invoice!.imageRecord.toString();
        invoiceVm..productsInvoiceList = _invoice!.products!;

        sellerCommissionRate.text = _invoice?.rate_participate != null &&
                _invoice?.rate_participate != ""
            ? _invoice!.rate_participate.toString()
            : "";
      } else {
        /// add invoice
        // Provider.of<invoice_vm>(context,listen: false)
        //     .listinvoiceClient.add(

        invoiceVm.initAttachFiles([]);
        selectedInvoiceSource = "";
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

        invoiceVm.productsInvoiceList = [];
      }
      invoiceVm.set_total(totalController.toString());

      amount_paidController.addListener(() {
        final total = num.tryParse(invoiceVm.total) ?? 0;
        final amountPaid = num.tryParse(amount_paidController.text) ?? 0;

        if (amountPaid > total) {
          amount_paidController.text = total.toString();
          amount_paidController.selection = TextSelection.fromPosition(
              TextPosition(offset: amount_paidController.text.length));
        }
      });
      Provider.of<selected_button_provider>(context, listen: false)
          .selectValuetypepay(int.parse(typepayController));

      context.read<selected_button_provider>()
        ..selectValuereadyinstall(int.parse(readyinstallController),
            isInit: true)
        ..selectValuetypeinstall(int.parse(typeinstallController.toString()))
        ..selectValueCurrency(int.parse(currencyController.toString()));

      invoiceVm.getCollaborators().then((value) {
        invoiceVm.onChangeSelectedSeller(invoice: _invoice);
      });

      invoiceVm.getAgentsAndDistributors().then((value) {
        invoiceVm.onChangeSelectedSeller(invoice: _invoice);
      });
    });
    super.initState();
  }

  @override
  void deactivate() {
    invoiceVm.resetAdditionalInformation();
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
          child: Directionality(
            textDirection: myui.TextDirection.rtl,
            child: Form(
              key: _globalKey,
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: ListView(
                  //textDirection: TextDirection.rtl,

                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kMainColor)),
                        onPressed: () {
                          AppNavigator.pushAndRemoveUntil(
                            AddInvoiceProduct(invoice: _invoice),
                            (Route<dynamic> route) => true,
                          );
                        },
                        child: Text("إضافة منتجات الفاتورة")),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtilis(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          textstring: AppStrings.labelTotal,
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
                              Provider.of<InvoiceVm>(context, listen: true)
                                  .total,
                          underline: TextDecoration.none,
                        ),
                        //  SizedBox(width: 10,),
                      ],
                    ),

                    SizedBox(height: 5),
                    RowEdit(name: 'عنوان الفاتورة', des: '*'),
                    EditTextFormField(
                      vaildator: HelperFunctions.instance.requiredFiled,
                      maxline: 3,
                      paddcustom: EdgeInsets.all(16),
                      hintText: '',
                      obscureText: false,
                      controller: addressController,
                    ),
                    RowEdit(name: AppStrings.labelAmountPaid, des: '*'),
                    EditTextFormField(
                      obscureText: false,
                      hintText: AppStrings.labelAmountPaid,
                      vaildator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return AppStrings.labelEmpty;
                        }
                        if (num.tryParse(value.toString()) == null)
                          return 'من فضلك ادخل عدد';

                        if (num.parse(value!) <= 0) {
                          return "يجب إدخال قيمة مناسبة";
                        }

                        final total =
                            num.tryParse(context.read<InvoiceVm>().total) ?? 0;
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
                    SizedBox(height: 5),
                    Consumer<InvoiceVm>(
                      builder: (context, data, _) {
                        bool invoiceHaveProductsOfTypePrograms =
                            data.productsInvoiceList.any((element) =>
                                element.type ==
                                ProductType.program.index.toString());
                        return RowEdit(
                            name: AppStrings.labelRenew,
                            des: invoiceHaveProductsOfTypePrograms ? "*" : ' ');
                      },
                    ),
                    Consumer<InvoiceVm>(
                      builder: (context, data, _) {
                        bool invoiceHaveProductsOfTypePrograms =
                            data.productsInvoiceList.any((element) =>
                                element.type ==
                                ProductType.program.index.toString());

                        return EditTextFormField(
                          hintText: AppStrings.labelRenew,
                          obscureText: false,
                          vaildator: (value) {
                            if ((value?.trim() == '0' ||
                                    (value?.trim().isEmpty ?? true)) &&
                                invoiceHaveProductsOfTypePrograms) {
                              return 'الحقل مطلوب.';
                            }
                            if (double.tryParse(value.toString()) == null)
                              return 'من فضلك ادخل عدد';

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
                          label: AppStrings.labelRenew,
                          onChanged: (val) {
                            // nameprod = val;
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Consumer<InvoiceVm>(
                      builder: (context, data, _) {
                        bool invoiceHaveProductsOfTypeResources =
                            data.productsInvoiceList.any((element) =>
                                element.typeProdRenew == "resources");
                        return RowEdit(
                            name: AppStrings.labelRenew2Year,
                            des:
                                invoiceHaveProductsOfTypeResources ? "*" : ' ');
                      },
                    ),
                    Consumer<InvoiceVm>(builder: (_, data, __) {
                      bool invoiceHaveProductsOfTypeResources =
                          data.productsInvoiceList.any((element) =>
                              element.typeProdRenew == "resources");

                      return EditTextFormField(
                        hintText: AppStrings.labelRenew2Year,
                        obscureText: false,
                        vaildator: (value) {
                          if ((value?.trim() == '0' ||
                                  (value?.trim().isEmpty ?? true)) &&
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
                        label: AppStrings.labelRenew2Year,
                        inputformate: [FilteringTextInputFormatter.digitsOnly],
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      );
                    }),
                    SizedBox(height: 5),
                    RowEdit(name: AppStrings.labelInvoiceSource, des: '*'),

                    AppDropdownButtonFormField<String, String>(
                      items: sourceClientsList,
                      onChange: (value) {
                        if (value == null) {
                          return;
                        }

                        setState(() {
                          selectedInvoiceSource = value.toString();
                        });
                      },
                      hint: "مصدر الفاتورة*",
                      fillColor: Colors.grey.shade200,
                      borderColor: Colors.grey.shade200,
                      iconColor: Colors.grey,
                      isFilledColor: true,
                      styleForHintText: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      validator: HelperFunctions.instance.requiredFiled,
                      itemAsValue: (String? item) => item,
                      itemAsString: (item) => item!,
                      value: selectedInvoiceSource != null &&
                              selectedInvoiceSource!.isNotEmpty
                          ? selectedInvoiceSource
                          : null,
                    ),
                    SizedBox(height: 5),
                    if (widget.invoice == null) ...{
                      RowEdit(name: 'التعليق', des: '*'),
                      EditTextFormField(
                        hintText: "اكتب تعليقاً...",
                        obscureText: false,
                        vaildator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "الحقل مطلوب.";
                          }
                          return null;
                        },
                        inputType: TextInputType.multiline,
                        controller: comment,
                        label: "التعليق",
                        minLines: 4,
                        maxline: 8,
                        paddcustom:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      ),
                      10.verticalSpace,
                    },
                    //admin
                    RowEdit(name: AppStrings.labelTypePay, des: '*'),
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
                      child: Consumer<selected_button_provider>(
                          builder: (context, selectedProvider, child) {
                        return Directionality(
                          textDirection: TextDirection.ltr,
                          child: AppGroupButton(
                            groupButtonController: GroupButtonController(
                              selectedIndex: selectedProvider.isSelectedtypepay,
                            ),
                            buttons: ['نقدا', 'تحويل'],
                            onSelected: (value, index, isselected) {
                              typepayController = index.toString();
                              selectedProvider.selectValuetypepay(index);
                            },
                          ),
                        );
                      }),
                    ),
                    //manage
                    SizedBox(
                      height: 5,
                    ),
                    RowEdit(name: AppStrings.labelTypeInstall, des: '*'),
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
                      child: Consumer<selected_button_provider>(
                          builder: (context, selectedProvider, child) {
                        return Directionality(
                          textDirection: TextDirection.ltr,
                          child: AppGroupButton(
                            groupButtonController: GroupButtonController(
                              selectedIndex:
                                  selectedProvider.isSelectedtypeinstall,
                            ),
                            buttons: ['ميداني', 'اونلاين'],
                            onSelected: (value, index, isselected) {
                              typeinstallController = index.toString();
                              selectedProvider.selectValuetypeinstall(index);
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 15),
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
                      child: Consumer<selected_button_provider>(
                          builder: (context, selectedProvider, child) {
                        return Directionality(
                          textDirection: TextDirection.ltr,
                          child: AppGroupButton(
                            groupButtonController: GroupButtonController(
                              selectedIndex: selectedProvider.isSelectCurrency,
                            ),
                            buttons: [' USD دولار', '  SAR ريال'],
                            onSelected: (value, index, isselected) {
                              currencyController = index;
                              selectedProvider.selectValueCurrency(index);
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RowEdit(name: AppStrings.labelNote, des: ''),
                    EditTextFormField(
                      paddcustom: EdgeInsets.all(16),
                      maxline: 3,
                      hintText: AppStrings.labelNote,
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
                                inputformate: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                                inputformate: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                                inputformate: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                                inputformate: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                paddcustom: EdgeInsets.all(16),
                                hintText: '',
                                obscureText: false,
                                controller: numTaxController,
                                vaildator: (value) {
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
                                  RowEdit(
                                      name: 'تجديد الفروع الاضافي', des: "*"),
                                  EditTextFormField(
                                    inputType: TextInputType.number,
                                    inputformate: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    paddcustom: EdgeInsets.all(16),
                                    hintText: '',
                                    obscureText: false,
                                    controller:
                                        renewAdditionalOfBranchesController,
                                    vaildator: (text) {
                                      if (!value) {
                                        return null;
                                      }

                                      if ((text?.trim().isEmpty ?? true) &&
                                          value) {
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
                    context.read<PrivilegeCubit>().checkPrivilege('76') ==
                                true &&
                            _invoice!.idInvoice != null &&
                            _invoice!.userinstall != null
                        ? RowEdit(name: 'يوزر العميل', des: '')
                        : Container(),
                    context.read<PrivilegeCubit>().checkPrivilege('76') ==
                                true &&
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
                                    if (_hasLogo(
                                        companyLogo, isDeleteCompanyLogo)) ...{
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () => pickImage(
                                                (context, file) =>
                                                    onPickCompanyLogo(file)),
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              margin: EdgeInsets.only(
                                                  top: 10, right: 15),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                  Icons.attachment_rounded,
                                                  color: Colors.grey.shade700,
                                                  size: 20),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => onDeleteCompanyLogo(),
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              margin: EdgeInsets.only(
                                                  top: 10, right: 15),
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
                                              child: Image.file(companyLogo,
                                                  fit: BoxFit.cover,
                                                  height: 150,
                                                  width: 150))
                                          : ((_invoice!.imagelogo?.isNotEmpty ??
                                                      false) &&
                                                  !isDeleteCompanyLogo)
                                              ? InkWell(
                                                  onTap: () => AppFileViewer(
                                                      urls: [
                                                        _invoice!.imagelogo!
                                                      ]).show(context),
                                                  child: ClipOval(
                                                    child:
                                                        FancyImageShimmerViewer(
                                                      imageUrl:
                                                          _invoice!.imagelogo!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )
                                              : InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  onTap: () => pickImage(
                                                      (context, file) =>
                                                          onPickCompanyLogo(
                                                              file)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                          Icons
                                                              .attachment_rounded,
                                                          color: Colors
                                                              .grey.shade700,
                                                          size: 35),
                                                      SizedBox(height: 0),
                                                      Text(
                                                        'Attach logo',
                                                        style: context.textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                                fontFamily:
                                                                    kfontfamily2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .grey
                                                                    .shade600),
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
                    RowEdit(name: AppStrings.labelImage, des: ''),
                    SizedBox(width: 20),
                    _commercialRecordImage(),
                    SizedBox(width: 20),
                    InvoiceImagesFiles(
                      onDeleteFileAttach: (value) {
                        if (value.id == null) return;
                        deletedFiles.add(value.id!);
                      },
                    ),
                    Divider(),
                    Text(
                      "تفاصيل إضافية",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    RowEdit(name: "نوع البائع"),
                    SizedBox(height: 5),
                    Consumer<InvoiceVm>(builder: (context, invoiceVM, _) {
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
                          child: AppGroupButton(
                            groupButtonController: GroupButtonController(
                                selectedIndex:
                                    invoiceVM.selectedSellerType?.index),
                            buttons: ['موزع', 'وكيل', 'متعاون', 'موظف'],
                            onSelected: (value, index, isselected) {
                              invoiceVm.onChangeSellerType(
                                  SellerTypeEnum.values[index]);
                            },
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 10),
                    Consumer<InvoiceVm>(builder: (context, invoice, _) {
                      final sellerStatus = invoice.sellerStatus;
                      final selectedSellerType = invoice.selectedSellerType;

                      final collaboratesList =
                          invoice.collaboratorsState.data ?? [];
                      final agentsList =
                          invoice.agentDistributorsState.data ?? [];
                      List<AgentDistributorModel> agentsListtemp = [];

                      agentsList.forEach((element) {
                        if (element.typeAgent ==
                            invoice.selectedSellerType!.index.toString())
                          agentsListtemp.add(element);
                      });
                      AgentDistributorModel? selectedAgent =
                          selectedSellerType == SellerTypeEnum.distributor
                              ? invoice.selectedDistributor
                              : invoice.selectedAgent;
                      if (selectedAgent != null) {
                        agentsListtemp.add(selectedAgent);
                      }
                      agentsListtemp.toSet().toList();

                      if (selectedSellerType != null &&
                          selectedSellerType != SellerTypeEnum.employee)
                        return Column(
                          children: [
                            RowEdit(
                                name: selectedSellerType == SellerTypeEnum.agent
                                    ? "اسم الوكيل"
                                    : selectedSellerType ==
                                            SellerTypeEnum.collaborator
                                        ? "اسم المتعاون"
                                        : "اسم الموزع"),
                            SizedBox(height: 5),
                            SellerWidget(
                              invoiceModel: _invoice,
                              selectedSellerType: selectedSellerType,
                              sellerStatus: sellerStatus,
                              collaboratesList: collaboratesList,
                              agentsListTemp: agentsListtemp,
                            ),
                            SizedBox(height: 10),
                            Selector<InvoiceVm, SellerTypeEnum?>(
                              selector: (_, vm) => vm.selectedSellerType,
                              builder: (context, selectedSellerType, _) {
                                return Column(
                                  children: [
                                    RowEdit(
                                        name: selectedSellerType ==
                                                SellerTypeEnum.agent
                                            ? "نسبة عمولة الوكيل"
                                            : selectedSellerType ==
                                                    SellerTypeEnum.collaborator
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
                                          if (selectedSellerType ==
                                              SellerTypeEnum.employee) {
                                            return null;
                                          }
                                          return "هذا الحقل مطلوب.";
                                        }

                                        if (num.tryParse(text ?? "0") == null)
                                          return "أدخل رقم صحيح.";

                                        if (num.parse(text!) <= 0) {
                                          return "يجب إدخال قيمة أكبر من 0.";
                                        }
                                        if (num.parse(text) > 100) {
                                          return "النسبة يجب أن تكون أصغر أو تساوي 100";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        hintStyle: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        hintText: '',
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.white)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.white)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    if (selectedSellerType ==
                                        SellerTypeEnum.agent) ...{
                                      RowEdit(name: "نسبة الوكيل من التجديد"),
                                      SizedBox(height: 5),
                                      TextFormField(
                                        controller: renewAgentController,
                                        obscureText: false,
                                        cursorColor: Colors.black,
                                        readOnly: false,
                                        validator: (text) {
                                          if (text?.trim().isEmpty ?? true) {
                                            if (selectedSellerType !=
                                                SellerTypeEnum.agent) {
                                              return null;
                                            }
                                            return "هذا الحقل مطلوب.";
                                          }

                                          if (num.tryParse(text ?? "0") == null)
                                            return "أدخل رقم صحيح.";

                                          if (num.parse(text!) <= 0) {
                                            return "يجب إدخال قيمة أكبر من 0.";
                                          }
                                          if (num.parse(text) > 100) {
                                            return "النسبة يجب أن تكون أصغر أو تساوي 100";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          hintStyle: const TextStyle(
                                              color: Colors.black45,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                          hintText: '',
                                          filled: true,
                                          fillColor: Colors.grey.shade200,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.white)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.white)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.white)),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                      color: Colors.white)),
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
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(0)),
                              elevation: MaterialStateProperty.all(8),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(75))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.lightBlue),
                              shadowColor: MaterialStateProperty.all(
                                  Theme.of(context).colorScheme.onSurface),
                            ),
                            child: Text(
                              'حفظ',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              final validate =
                                  _globalKey.currentState!.validate();
                              if (validate) {
                                typepayController =
                                    Provider.of<selected_button_provider>(
                                            context,
                                            listen: false)
                                        .isSelectedtypepay
                                        .toString();

                                typeinstallController =
                                    Provider.of<selected_button_provider>(
                                            context,
                                            listen: false)
                                        .isSelectedtypeinstall
                                        .toString();

                                if ((_invoice!.products != null) &&
                                    (_invoice!.products!.isNotEmpty)) {
                                  Provider.of<LoadProvider>(context,
                                          listen: false)
                                      .changebooladdinvoice(true);
                                  totalController = _invoice!.total.toString();
                                  _globalKey.currentState!.save();
                                  List<ProductsInvoice>? _products = [];
                                  _products = _invoice!.products;

                                  final user = context.read<UserProvider>();
                                  if (_invoice?.idInvoice != null) {
                                    String invoiceID = _invoice!.idInvoice!;
                                    final body = _prepareUpdateInvoiceBody(
                                      context: context,
                                      invoiceID: invoiceID,
                                      user: user,
                                    );
                                    await invoiceVm
                                        .updateInvoiceClientVm(
                                      body: body,
                                      idInvoice: invoiceID,
                                      file: recordCommercialImageNotifier.value,
                                      fileLogo: companyLogoNotifier.value,
                                      files: invoiceVm.filesAttach
                                          .where(
                                              (element) => element.file != null)
                                          .map((e) => File(e.file!.path))
                                          .toList(),
                                      isDeleteFile:
                                          isDeleteRecordCommercialImageNetworkImage
                                              .value,
                                      isDeleteLogo:
                                          isDeleteCompanyLogoNetworkImage.value,
                                    )
                                        .then((value) {
                                      return value
                                          ? clear(context, invoiceID, _products)
                                          : error(context);
                                    });
                                  } else {
                                    Map<String, dynamic> body =
                                        _prepareAddInvoiceBody(
                                      context: context,
                                      user: user,
                                    );

                                    if (_products?.isNotEmpty ?? false) {
                                      body.addAll(_prepareProducts(_products!));
                                    }
                                    log("body for add invoice => $body");
                                    //: add invoice
                                    await invoiceVm.AddInvoiceClientVm(
                                      body,
                                      recordCommercialImageNotifier.value,
                                      companyLogoNotifier.value,
                                      invoiceVm.filesAttach
                                          .where(
                                              (element) => element.file != null)
                                          .map((e) => File(e.file!.path))
                                          .toList(),
                                      onAddInvoiceSuccess:
                                          (InvoiceModel invoice) {
                                        final commentModel = CommentModel(
                                          idComment: "idComment",
                                          fkUser: user.currentUser.idUser!,
                                          fkClient:
                                              widget.itemClient.idClients!,
                                          content: comment.text,
                                          nameUser: user.currentUser.nameUser!,
                                          imgImage: user.currentUser.img_image,
                                          nameEnterprise:
                                              invoice.name_enterprise!,
                                          date_comment:
                                              DateTime.now().toIso8601String(),
                                          type_comment: '',
                                        );
                                        context
                                            .read<comment_vm>()
                                            .addCommentFromAddInvoice(
                                                commentModel);
                                      },
                                    ).then((value) => value != "false"
                                        ? clear(context, value, _products)
                                        : error(context));
                                  }

                                  invoiceVm.clearProducts();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('من فضلك ادخل منتجات')));
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
        //),
      ),
    );
  }

  ValueListenableBuilder<File?> _commercialRecordImage() {
    return ValueListenableBuilder<File?>(
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
                                child: FileViewerWidget(
                                  file: recordCommercialImage,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => pickImage((context, file) =>
                                          onPickCommercialRecordImage(file)),
                                      borderRadius: BorderRadius.circular(90),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        margin:
                                            EdgeInsets.only(top: 10, right: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(Icons.attachment_rounded,
                                            color: Colors.grey.shade700,
                                            size: 20),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () =>
                                          onDeleteCommercialRecordImage(),
                                      borderRadius: BorderRadius.circular(90),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        margin:
                                            EdgeInsets.only(top: 10, left: 15),
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
                      : ((_invoice!.imageRecord?.isNotEmpty ?? false) &&
                              !isDeleteRecordCommercial)
                          ? InkWell(
                              onTap: () =>
                                  AppFileViewer(urls: [_invoice!.imageRecord!])
                                      .show(context),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: FileViewerWidget(
                                        fileUrl: _invoice!.imageRecord!,
                                      ),
                                    ),
                                  ),
                                  if (context
                                      .read<PrivilegeCubit>()
                                      .checkPrivilege('146'))
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () => pickImage((context,
                                                      file) =>
                                                  onPickCommercialRecordImage(
                                                      file)),
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(
                                                    top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                    Icons.attachment_rounded,
                                                    color: Colors.grey.shade700,
                                                    size: 20),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () =>
                                                  onDeleteCommercialRecordImage(),
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(
                                                    top: 10, right: 15),
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
                              onTap: () => pickImage((context, file) =>
                                  onPickCommercialRecordImage(file)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.attachment_rounded,
                                      color: Colors.grey.shade700, size: 35),
                                  SizedBox(height: 0),
                                  Text(
                                    'Attach image/file',
                                    style: context.textTheme.titleMedium
                                        ?.copyWith(
                                            fontFamily: kfontfamily2,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade600),
                                  )
                                ],
                              ),
                            ),
                );
              });
        });
  }

  bool _hasLogo(File? companyLogo, bool isDeleteCompanyLogo) =>
      companyLogo != null ||
      ((_invoice!.imagelogo?.isNotEmpty ?? false) && !isDeleteCompanyLogo);

  Map<String, dynamic> _prepareAddInvoiceBody({
    required BuildContext context,
    required UserProvider user,
  }) {
    Map<String, dynamic> body = {
      "name_enterprise": widget.itemClient.nameEnterprise,
      "name_client": widget.itemClient.nameClient.toString(),
      "nameUser": user.currentUser.nameUser,
      "comment": comment.text,
      "renew_year": renewController.text.toString(),
      "renew2year": renew2Controller.text.toString(),
      "type_pay": typepayController,
      "date_create": DateTime.now().toString(),
      //formatter.format(_currentDate),
      "type_installation": typeinstallController.toString(),
      "ready_install": readyinstallController.toString(),
      "currency_name": currencyController.toString(),

      "amount_paid": amount_paidController.text.toString(),
      "image_record": recordCommercialImageNotifier.value?.path ?? '',
      "fk_idClient": widget.itemClient.idClients.toString(),
      "fk_idUser": user.currentUser.idUser,
      //the same user that create a client not current user
      "total": totalController,
      "notes": noteController.text.toString(),
      'fk_regoin': widget.itemClient.fkRegoin.toString(),
      'fk_regoin_invoice': user.currentUser.fkRegoin,
      'region_invoice_name': user.currentUser.nameRegoin,
      'fk_country': widget.itemClient.fkcountry.toString(),
      'numbarnch': numbranchController.text.toString(),
      'renew_pluse': renewAdditionalOfBranchesController.text.toString(),
      'nummostda': nummostawdaController.text.toString(),
      'numusers': numuserController.text.toString(),
      'address_invoice': addressController.text.toString(),
      'invoice_source': selectedInvoiceSource,
      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator &&
          invoiceVm.selectedCollaborator?.id_participate != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.agent &&
          invoiceVm.selectedAgent != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor &&
          invoiceVm.selectedDistributor != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else
        'type_seller': '3',
      // type seller is employee,

      if (sellerCommissionRate.text.isNotEmpty &&
          invoiceVm.selectedSellerType != SellerTypeEnum.employee)
        'rate_participate': sellerCommissionRate.text,

      if (renewAgentController.text.isNotEmpty &&
          invoiceVm.selectedSellerType == SellerTypeEnum.agent)
        'renew_agent': renewAgentController.text,

      if (invoiceVm.selectedSellerType == SellerTypeEnum.agent)
        'fk_agent': invoiceVm.selectedAgent?.idAgent.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor)
        'fk_agent': invoiceVm.selectedDistributor?.idAgent.toString(),
      'numTax': numTaxController.text.toString(),

      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator)
        'participate_fk':
            invoiceVm.selectedCollaborator?.id_participate.toString(),
    };
    if (readyinstallController == '0')
      body.addAll({
        'date_not_readyinstall': DateTime.now().toString(),
        'user_not_ready_install':
            Provider.of<UserProvider>(context, listen: false)
                .currentUser
                .idUser
                .toString(),
      });
    else
      body.addAll({
        'date_readyinstall': DateTime.now().toString(),
        'user_ready_install': Provider.of<UserProvider>(context, listen: false)
            .currentUser
            .idUser
            .toString(),
      });

    return body;
  }

  Map<String, dynamic> _prepareUpdateInvoiceBody({
    required BuildContext context,
    required String invoiceID,
    required UserProvider user,
  }) {
    final deletedProductsInvoice = invoiceVm.deleteProductsInvoice;
    final addedProducts = invoiceVm.addedProductsInvoice;
    final editedProducts = invoiceVm.editProductsInvoiceRemote;

    Map<String, dynamic> body = {};
    Map<String, dynamic> deleteFilesMap = {};
    Map<String, dynamic> deleteProductsInvoice = {};
    Map<String, dynamic> addProductsInvoice = {};
    Map<String, dynamic> editProductsInvoice = {};

    deletedFiles.forEachIndexed((index, id) {
      deleteFilesMap["id_files[$index]"] = id;
    });
    deletedProductsInvoice.forEachIndexed((index, id) {
      deleteProductsInvoice["product_to_delete[$index]"] = id;
    });

    int index = 0;
    for (final product in addedProducts) {
      addProductsInvoice["products[$index]"] = product.toJson();
      index++;
    }
    for (final product in editedProducts) {
      editProductsInvoice["products[$index]"] = product.toJson();
      index++;
    }

    body.addAll({
      ...deleteFilesMap,
      ...deleteProductsInvoice,
      ...addProductsInvoice,
      ...editProductsInvoice,

      "name_enterprise": widget.itemClient.nameEnterprise,
      "name_client": widget.itemClient.nameClient.toString(),
      "nameUser": user.currentUser.nameUser,
      "renew_year": renewController.text.toString(),
      "renew2year": renew2Controller.text.toString(),
      "type_pay": typepayController.toString(),
      // "date_create": DateTime.now().toString(),
      "type_installation": typeinstallController.toString(),
      "ready_install": _invoice!.ready_install,
      "currency_name": currencyController.toString(),

      /////////////////////////////////////////////////////////////////////
      "amount_paid": amount_paidController.text.toString(),
      'fk_regoin': widget.invoice!.fk_regoin.toString(),
      'fk_regoin_invoice': widget.invoice?.fk_regoin_invoice,
      'region_invoice_name': widget.invoice!.name_regoin_invoice,
      'fk_country': widget.invoice!.fk_country.toString(),
      "fk_idClient": widget.itemClient.idClients.toString(),
      "fk_idUser": user.currentUser.idUser,
      "image_record": widget.invoice!.imageRecord.toString(),
      "lastuserupdate": Provider.of<UserProvider>(context, listen: false)
          .currentUser
          .idUser
          .toString(),
      "lastnameuser": Provider.of<UserProvider>(context, listen: false)
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
      'invoice_source': selectedInvoiceSource,
      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator &&
          invoiceVm.selectedCollaborator?.id_participate != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.agent &&
          invoiceVm.selectedAgent != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor &&
          invoiceVm.selectedDistributor != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else
        'type_seller': "3",

      if (sellerCommissionRate.text.isNotEmpty &&
          invoiceVm.selectedSellerType != SellerTypeEnum.employee)
        'rate_participate': sellerCommissionRate.text,

      if (renewAgentController.text.isNotEmpty &&
          invoiceVm.selectedSellerType == SellerTypeEnum.agent)
        'renew_agent': renewAgentController.text,

      if (invoiceVm.selectedSellerType == SellerTypeEnum.agent)
        'fk_agent': invoiceVm.selectedAgent?.idAgent.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor)
        'fk_agent': invoiceVm.selectedDistributor?.idAgent.toString(),

      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator)
        'participate_fk':
            invoiceVm.selectedCollaborator?.id_participate.toString()
      else
        'participate_fk': null.toString(),

      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator ||
          invoiceVm.selectedSellerType == SellerTypeEnum.employee)
        'fk_agent': null.toString(),
    });

    return body;
  }

  Map<String, dynamic> _prepareProducts(List<ProductsInvoice> products) {
    final Map<String, dynamic> body = {};

    final List<Map<String, dynamic>> productsJson =
        products.map((e) => e.toJson()).toList();

    for (int i = 0; i < productsJson.length; i++) {
      final Map<String, dynamic> product = productsJson[i];
      body.addAll({
        'products[$i]': product,
      });
    }

    log("body for add products => $body");
    return body;
  }

  clear(BuildContext context, String value,
      List<ProductsInvoice>? _products) async {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdinvoice(false);
    Navigator.pop(context);
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdinvoice(false);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
  }

  final intl.DateFormat formatter = intl.DateFormat('yyyy-MM-dd');

  Future<File> createFileOfPdfUrl(String urlparam) async {
    Completer<File> completer = Completer();

    try {
      final url = urlparam;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();

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

  pickImage(PickFileCallback onPickFile) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(onPickFile: onPickFile),
    );
  }

  void onPickCommercialRecordImage(File file) {
    recordCommercialImageNotifier.value = file;
  }

  void onDeleteCommercialRecordImage() {
    if ((_invoice!.imageRecord?.isNotEmpty ?? false) &&
        !isDeleteRecordCommercialImageNetworkImage.value) {
      isDeleteRecordCommercialImageNetworkImage.value = true;
      return;
    }
    recordCommercialImageNotifier.value = null;
  }

  void onPickCompanyLogo(File file) {
    companyLogoNotifier.value = file;
  }

  void onDeleteCompanyLogo() {
    if ((_invoice!.imagelogo?.isNotEmpty ?? false) &&
        !isDeleteCompanyLogoNetworkImage.value) {
      isDeleteCompanyLogoNetworkImage.value = true;
      return;
    }
    companyLogoNotifier.value = null;
  }
}
