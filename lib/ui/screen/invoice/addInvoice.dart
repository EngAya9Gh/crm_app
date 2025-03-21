import 'dart:async';
import 'dart:io';
import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/models/file_model.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/client/client_source_enum.dart';
import '../../../core/common/enums/seller_type_enum.dart';
import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/helpers/input_validator.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_group_button.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/common/widgets/files/app_platform_image.dart';
import '../../../core/common/widgets/files/file_viewer_widget.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/finance/clients_attachments/data/models/subscribed_clients_model.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../features/sales/clients/clients_list/data/models/recommended_client.dart';
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../../../model/commentmodel.dart';
import '../../../model/invoiceModel.dart';
import '../../../provider/loadingprovider.dart';
import '../../../provider/selected_button_provider.dart';
import '../../../view_model/comment.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/app_file_viewer.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/pick_image_bottom_sheet.dart';
import 'add_invoice_product.dart';
import 'invoice_images_file.dart';
import 'seller_widget.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({
    required this.itemClient,
    this.invoice,
    Key? key,
  }) : super(key: key);
  final ClientModel itemClient;

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
  final TextEditingController numInvoiceController = TextEditingController();
  final TextEditingController numPosController = TextEditingController();
  final TextEditingController numuserController = TextEditingController();
  final TextEditingController userclientController = TextEditingController();
  final TextEditingController nummostawdaController = TextEditingController();
  final TextEditingController numTaxController = TextEditingController();
  final TextEditingController renewAdditionalOfBranchesController = TextEditingController();
  final TextEditingController renewAgentController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController renew2Controller = TextEditingController();
  final TextEditingController sellerCommissionRate = TextEditingController();
  final TextEditingController comment = TextEditingController();
  ValueNotifier<XFile?> companyLogoNotifier = ValueNotifier(null);
  ValueNotifier<XFile?> recordCommercialImageNotifier = ValueNotifier(null);
  InvoiceModel? _invoice = null;
  ValueNotifier<bool> isDeleteCompanyLogoNetworkImage = ValueNotifier(false);
  ValueNotifier<bool> isDeleteRecordCommercialImageNetworkImage = ValueNotifier(false);

  ValueNotifier<bool> isNumberOfBranchesBiggerThanOne = ValueNotifier(false);
  List<String> deletedFiles = [];
  String? selectedInvoiceSource;
  String? _selectedARecommendedClient;
  late final ClientsListBloc _bloc;

  @override
  void dispose() async {
    renewController.dispose();
    noteController.dispose();
    imageController.dispose();
    amount_paidController.dispose();
    numuserController.dispose();
    nummostawdaController.dispose();
    numbranchController.dispose();
    numInvoiceController.dispose();
    numPosController.dispose();
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
    _bloc = context.read<ClientsListBloc>()..add(GetRecommendedClientsFilterEvent());
    invoiceVm = context.read<InvoiceVm>();
    if (_invoice == null) _invoice = InvoiceModel(products: []);
    amount_paidController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Add Your Code here.
      Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(false);

      invoiceVm.productsInvoiceList = [];
      invoiceVm.set_total('0');

      totalController = '0';
      _invoice = widget.invoice;
      numbranchController.addListener(() {
        isNumberOfBranchesBiggerThanOne.value = numbranchController.text.isNotEmpty;
        // num number = 0;
        // if (numbranchController.text.isNotEmpty) {
        //   number = num.tryParse(numbranchController.text) ?? 0;
        // }
      });
      if (_invoice != null) {
        selectedInvoiceSource = _invoice!.invoice_source == null ? '' : _invoice!.invoice_source;
        invoiceVm.initAttachFiles(_invoice!.filesAttach ?? []);
        //in mode edit
        totalController = _invoice!.total.toString();
        // Provider.of<invoice_vm>(context,listen: false).set_total(totalController.toString());
        numuserController.text = _invoice!.numusers == null ? '' : _invoice!.numusers.toString();
        nummostawdaController.text = _invoice!.nummostda == null ? '' : _invoice!.nummostda.toString();
        numInvoiceController.text = _invoice!.renewInventory == null ? '' : _invoice!.renewInventory.toString();
        numPosController.text = _invoice!.renewPos == null ? '' : _invoice!.renewPos.toString();

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

        typeinstallController = _invoice!.typeInstallation.toString();

        if (_invoice!.ready_install != null) readyinstallController = _invoice!.ready_install!;

        noteController.text = _invoice!.notes.toString();
        imageController.text = _invoice!.imageRecord.toString();
        invoiceVm..productsInvoiceList = _invoice!.products!;

        sellerCommissionRate.text =
            _invoice?.rate_participate != null && _invoice?.rate_participate != "" ? _invoice!.rate_participate.toString() : "";
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
          amount_paidController.selection = TextSelection.fromPosition(TextPosition(offset: amount_paidController.text.length));
        }
      });
      Provider.of<selected_button_provider>(context, listen: false).selectValuetypepay(int.parse(typepayController));

      context.read<selected_button_provider>()
        ..selectValuereadyinstall(int.parse(readyinstallController), isInit: true)
        ..selectValuetypeinstall(int.tryParse(typeinstallController))
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
      appBar: CustomAppBar(
        title: widget.invoice == null ? 'إنشاء فاتورة' : 'تعديل الفاتورة',
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
                    AppElevatedButton(
                      text: 'إضافة منتجات الفاتورة',
                      onPressed: () {
                        AppNavigator.pushAndRemoveUntil(
                          AddInvoiceProduct(invoice: _invoice),
                          (Route<dynamic> route) => true,
                        );
                      },
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          AppStrings.labelTotal,
                          fontWeight: FontWeight.bold,
                        ),
                        10.width,
                        AppText(
                          Provider.of<InvoiceVm>(context, listen: true).total,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    20.height,
                    AppText('عنوان الفاتورة*'),
                    5.height,
                    AppTextField(
                      hintText: 'عنوان الفاتورة*',
                      controller: addressController,
                      isRequired: true,
                    ),
                    10.height,
                    AppText('${AppStrings.labelAmountPaid}*'),
                    5.height,
                    AppTextField(
                      hintText: '${AppStrings.labelAmountPaid}*',
                      controller: amount_paidController,
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return AppStrings.labelEmpty;
                        }
                        if (num.tryParse(value.toString()) == null) return 'من فضلك ادخل عدد';

                        if (num.parse(value!) <= 0) {
                          return "يجب إدخال قيمة مناسبة";
                        }

                        final total = num.tryParse(context.read<InvoiceVm>().total) ?? 0;
                        final amountPaid = num.tryParse(value) ?? 0;

                        if (amountPaid > total) {
                          return "لا يمكن إدخال مبلغ أكبر من قيمة الفاتورة.";
                        }
                        return null;
                      },
                    ),

                    10.height,
                    Consumer<InvoiceVm>(
                      builder: (context, data, _) {
                        bool invoiceHaveProductsOfTypePrograms =
                            data.productsInvoiceList.any((element) => element.type == ProductType.program.index.toString());

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText("${AppStrings.labelRenew}${invoiceHaveProductsOfTypePrograms ? '*' : ''}"),
                            5.height,
                            AppTextField(
                              hintText: "${AppStrings.labelRenew}${invoiceHaveProductsOfTypePrograms ? '*' : ''}",
                              controller: renewController,
                              inputType: TextInputType.number,
                              validator: (value) {
                                if ((value?.trim() == '0' || (value?.trim().isEmpty ?? true)) && invoiceHaveProductsOfTypePrograms) {
                                  return 'الحقل مطلوب.';
                                }
                                if (double.tryParse(value.toString()) == null) return 'من فضلك ادخل عدد';

                                if (num.parse(value!) < 0) {
                                  return "يجب إدخال قيمة أكبر من 0.";
                                }
                                return null;
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    10.height,
                    Consumer<InvoiceVm>(builder: (_, data, __) {
                      bool invoiceHaveProductsOfTypeResources = data.productsInvoiceList.any((element) => element.typeProdRenew == "resources");

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("${AppStrings.labelRenew2Year}${invoiceHaveProductsOfTypeResources ? '*' : ''}"),
                          5.height,
                          AppTextField(
                            hintText: "${AppStrings.labelRenew2Year}${invoiceHaveProductsOfTypeResources ? '*' : ''}",
                            controller: renew2Controller,
                            inputType: TextInputType.number,
                            validator: (value) {
                              if ((value?.trim() == '0' || (value?.trim().isEmpty ?? true)) && invoiceHaveProductsOfTypeResources) {
                                return 'الحقل مطلوب.';
                              }

                              if (num.parse(value!) < 0) {
                                return "يجب إدخال قيمة أكبر من 0.";
                              }
                              return null;
                            },
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ],
                      );
                    }),
                    10.height,
                    AppText("${AppStrings.labelInvoiceSource}*"),
                    5.height,
                    CustomDropDown(
                      hint: "${AppStrings.labelInvoiceSource}*",
                      compareFn:  (item, selectedItem) => item.index == selectedItem.index,
                      items: ClientSourceEnum.values,
                      itemAsString: (item) => item!.value,
                      onChanged: (value) {
                        selectedInvoiceSource = value!.value;
                        setState(() {});
                      },
                      validator: InputValidator.requiredFiled,
                      selectedItem: selectedInvoiceSource != null
                          ? ClientSourceEnum.values.firstWhereOrNull((element) => element.value == selectedInvoiceSource)
                          : null,
                    ),
                    10.height,
                    if ((selectedInvoiceSource == ClientSourceEnum.recommendedClient.value)) ...[
                      BlocBuilder<ClientsListBloc, ClientsListState>(
                        builder: (context, state) {
                          final recommendedList = state.recommendedClientsForFilterState.getDataWhenSuccess ?? [];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText('العملاء*'),
                              5.height,
                              CustomSearchableDropDown<SubscribedClientsModel>(
                                hint: 'العملاء*',
                                items: recommendedList,
                                itemAsString: (item) => item!.nameEnterprise!,
                                validator: InputValidator.requiredFiled,
                                filterFn: (item, query) {
                                  return item.nameEnterprise!.toLowerCase().contains(query.toLowerCase());
                                },
                                compareFn: (item, query) {
                                  return item.nameEnterprise!.toLowerCase() == query.nameEnterprise!.toLowerCase();
                                },
                                selectedItem: recommendedList.firstWhereOrNull((element) => element.id.toString() == _selectedARecommendedClient),
                                onChanged: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  _selectedARecommendedClient = value.id.toString();
                                  setState(() {});
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      10.height,
                    ],

                    if (widget.invoice == null) ...{
                      AppText('التعليق*'),
                      5.height,
                      AppTextField(
                        hintText: 'اكتب تعليقاً...',
                        controller: comment,
                        validator: InputValidator.requiredFiled,
                      ),
                      10.height,
                    },
                    //admin
                    AppText("${AppStrings.labelTypePay}*"),
                    5.height,
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
                    10.height,
                    AppText("${AppStrings.labelTypeInstall}*"),
                    5.height,
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
                          child: AppGroupButton(
                            groupButtonController: GroupButtonController(
                              selectedIndex: selectedProvider.isSelectedtypeinstall,
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
                    10.height,
                    AppText("العملة*"),
                    5.height,
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
                    10.height,
                    AppText(AppStrings.labelNote),
                    5.height,
                    AppTextField(
                      hintText: AppStrings.labelNote,
                      controller: noteController,
                    ),
                    ////////////////////////////////////////////////
                    10.height,
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              AppText('عدد الفروع'),
                              5.height,
                              AppTextField(
                                hintText: 'عدد الفروع',
                                controller: numbranchController,
                                inputType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              ),
                            ],
                          ),
                        ),
                        10.width,
                        Flexible(
                          child: Column(
                            children: [
                              AppText('عدد المستودعات'),
                              5.height,
                              AppTextField(
                                hintText: 'عدد المستودعات',
                                controller: nummostawdaController,
                                inputType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              AppText('عدد المستخدمين'),
                              5.height,
                              AppTextField(
                                hintText: 'عدد المستخدمين',
                                controller: numuserController,
                                inputType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              ),
                            ],
                          ),
                        ),
                        10.width,
                        Flexible(
                          child: Column(
                            children: [
                              AppText('الرقم الضريبي'),
                              5.height,
                              AppTextField(
                                hintText: 'الرقم الضريبي',
                                controller: numTaxController,
                                inputType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText('تجديد المستودعات'),
                        5.height,
                        AppTextField(
                          hintText: 'تجديد المستودعات',
                          controller: numInvoiceController,
                          inputType: TextInputType.number,
                          validator: (text) {
                            if (text?.isNotEmpty ?? false) {
                              if ((num.parse(text!)) <= 0) {
                                return "يجب إدخال قيمة اكبر من ال 0";
                              }
                              return null;
                            }
                            return null;
                          },
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ],
                    ),
                    10.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText('تجديد نقاط البيع'),
                        5.height,
                        AppTextField(
                          hintText: 'تجديد نقاط البيع',
                          controller: numPosController,
                          inputType: TextInputType.number,
                          validator: (text) {
                            if (text?.isNotEmpty ?? false) {
                              if ((num.parse(text!)) <= 0) {
                                return "يجب إدخال قيمة اكبر من ال 0";
                              }
                              return null;
                            }
                            return null;
                          },
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        ),
                      ],
                    ),
                    10.height,
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
                                  AppText('تجديد الفروع الاضافي*'),
                                  AppTextField(
                                    hintText: 'تجديد الفروع الاضافي*',
                                    controller: renewAdditionalOfBranchesController,
                                    inputType: TextInputType.number,
                                    validator: (text) {
                                      if (!value) {
                                        return null;
                                      }
                                      else if (text?.isNotEmpty ?? false) {
                                        if ((num.parse(text!)) <= 0) {
                                          return "يجب إدخال قيمة اكبر من ال 0";
                                        }
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    10.height,
                    if (context.read<PrivilegesCubit>().checkPrivilege('76') == true &&
                        _invoice!.idInvoice != null &&
                        _invoice!.userinstall != null) ...[
                      AppText('يوزر العميل'),
                      5.height,
                      AppTextField(
                        hintText: 'يوزر العميل',
                        controller: userclientController,
                      ),
                    ],
                    10.height,
                    AppText(
                      'شعار المؤسسة',
                      fontWeight: FontWeight.bold,
                    ),
                    5.height,
                    ValueListenableBuilder<XFile?>(
                        valueListenable: companyLogoNotifier,
                        builder: (context, companyLogo, _) {
                          return ValueListenableBuilder<bool>(
                              valueListenable: isDeleteCompanyLogoNetworkImage,
                              builder: (context, isDeleteCompanyLogo, _) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (_hasLogo(companyLogo, isDeleteCompanyLogo)) ...{
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () => pickImage((context, file) => onPickCompanyLogo(file)),
                                            borderRadius: BorderRadius.circular(90),
                                            child: Container(
                                              height: 40.scaleIconsSize,
                                              width: 40.scaleIconsSize,
                                              margin: EdgeInsets.only(top: 10, right: 15),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: Alignment.center,
                                              child: AppIcon(
                                                Icons.attachment_rounded,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () => onDeleteCompanyLogo(),
                                            borderRadius: BorderRadius.circular(90),
                                            child: Container(
                                              height: 40.scaleIconsSize,
                                              width: 40.scaleIconsSize,
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
                                    },
                                    Container(
                                      height: 150.scaleIconsSize,
                                      width: 150.scaleIconsSize,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: companyLogo != null
                                          ? ClipOval(
                                              child: AppPlatformImage(
                                              fileModel: FileModel(
                                                file: companyLogo,
                                              ),
                                              fit: BoxFit.cover,
                                              height: 150.scaleIconsSize,
                                              width: 150.scaleIconsSize,
                                            ))
                                          : ((_invoice!.imagelogo?.isNotEmpty ?? false) && !isDeleteCompanyLogo)
                                              ? InkWell(
                                                  onTap: () => AppFileViewer(urls: [_invoice!.imagelogo!]).show(context),
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
                                                      AppIcon(
                                                        Icons.attachment_rounded,
                                                        color: Colors.grey.shade700,
                                                      ),
                                                      SizedBox(height: 0),
                                                      AppText(
                                                        'Attach logo',
                                                        fontFamily: AppFonts.fontFamily2,
                                                        fontWeight: FontWeight.w700,
                                                        color: Colors.grey.shade600,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                    ),
                                  ],
                                );
                              });
                        }),
                    10.height,
                    AppText(AppStrings.labelImage),
                    5.height,
                    _commercialRecordImage(),
                    10.height,
                    InvoiceImagesFiles(
                      onDeleteFileAttach: (value) {
                        if (value.id == null) return;
                        deletedFiles.add(value.id!);
                      },
                    ),
                    Divider(),
                    10.height,
                    AppText("تفاصيل إضافية", fontWeight: FontWeight.bold),
                    Divider(),
                    5.height,
                    AppText("نوع البائع"),
                    5.height,
                    Consumer<InvoiceVm>(builder: (context, invoiceVM, _) {
                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: Container(
                          padding: EdgeInsets.all(2),
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
                            groupButtonController: GroupButtonController(selectedIndex: invoiceVM.selectedSellerType?.index),
                            buttons: ['موزع', 'وكيل', 'متعاون', 'موظف'],
                            onSelected: (value, index, isselected) {
                              invoiceVm.onChangeSellerType(SellerTypeEnum.values[index]);
                            },
                          ),
                        ),
                      );
                    }),
                    10.height,
                    Consumer<InvoiceVm>(builder: (context, invoice, _) {
                      final sellerStatus = invoice.sellerStatus;
                      final selectedSellerType = invoice.selectedSellerType;

                      final collaboratesList = invoice.collaboratorsState.data ?? [];
                      final agentsList = invoice.agentDistributorsState.data ?? [];
                      List<AgentDistributorModel> agentsListtemp = [];

                      agentsList.forEach((element) {
                        if (element.typeAgent == invoice.selectedSellerType!.index.toString()) agentsListtemp.add(element);
                      });
                      AgentDistributorModel? selectedAgent =
                          selectedSellerType == SellerTypeEnum.distributor ? invoice.selectedDistributor : invoice.selectedAgent;
                      if (selectedAgent != null) {
                        agentsListtemp.add(selectedAgent);
                      }
                      agentsListtemp.toSet().toList();

                      if (selectedSellerType != null && selectedSellerType != SellerTypeEnum.employee)
                        return Column(
                          children: [
                            AppText(
                              selectedSellerType == SellerTypeEnum.agent
                                  ? "اسم الوكيل"
                                  : selectedSellerType == SellerTypeEnum.collaborator
                                      ? "اسم المتعاون"
                                      : "اسم الموزع",
                            ),
                            5.height,
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
                                final title = selectedSellerType == SellerTypeEnum.agent
                                    ? "نسبة عمولة الوكيل"
                                    : selectedSellerType == SellerTypeEnum.collaborator
                                        ? "نسبة عمولة المتعاون"
                                        : "نسبة عمولة الموزع";

                                // clear sellerCommissionRate of the agent when the seller type is changed
                                final currentInvoiceType = _invoice?.type_seller;
                                if (currentInvoiceType != null && currentInvoiceType != selectedSellerType?.index.toString()) {
                                  sellerCommissionRate.clear();
                                } else {
                                  sellerCommissionRate.text = _invoice?.rate_participate != null && _invoice?.rate_participate != ""
                                      ? _invoice!.rate_participate.toString()
                                      : "";
                                }

                                if (selectedSellerType != SellerTypeEnum.agent) {
                                  renewAgentController.clear();
                                } else {
                                  renewAgentController.text =
                                      _invoice?.renew_agent != null && _invoice?.renew_agent != "" ? _invoice!.renew_agent.toString() : "";
                                }

                                return Column(
                                  children: [
                                    AppText(title),
                                    5.height,
                                    AppTextField(
                                      controller: sellerCommissionRate,
                                      validator: (text) {
                                        if (text?.trim().isEmpty ?? true) {
                                          if (selectedSellerType == SellerTypeEnum.employee) {
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
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      inputType: TextInputType.number,
                                    ),
                                    10.height,
                                    if (selectedSellerType == SellerTypeEnum.agent) ...{
                                      AppText("نسبة الوكيل من التجديد"),
                                      5.height,
                                      AppTextField(
                                        controller: renewAgentController,
                                        readOnly: false,
                                        validator: (text) {
                                          if (text?.trim().isEmpty ?? true) {
                                            if (selectedSellerType != SellerTypeEnum.agent) {
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
                                        inputType: TextInputType.number,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    10.height,
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppElevatedButton(
                            text: 'حفظ',
                            onPressed: () async {
                              final validate = _globalKey.currentState!.validate();
                              if (validate) {
                                typepayController = Provider.of<selected_button_provider>(context, listen: false).isSelectedtypepay.toString();

                                typeinstallController =
                                    Provider.of<selected_button_provider>(context, listen: false).isSelectedtypeinstall.toString();

                                if ((_invoice!.products != null) && (_invoice!.products!.isNotEmpty)) {
                                  Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(true);
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
                                      files: invoiceVm.filesAttach.where((element) => element.file != null).map((e) => e.file!).toList(),
                                      isDeleteFile: isDeleteRecordCommercialImageNetworkImage.value,
                                      isDeleteLogo: isDeleteCompanyLogoNetworkImage.value,
                                    )
                                        .then((value) {
                                      return value ? clear(context, invoiceID, _products) : error(context);
                                    });
                                  } else {
                                    Map<String, dynamic> body = _prepareAddInvoiceBody(
                                      context: context,
                                      user: user,
                                    );
                                    if (_products?.isNotEmpty ?? false) {
                                      body.addAll(_prepareProducts(_products!));
                                    }
                                    // : add invoice
                                    await invoiceVm.AddInvoiceClientVm(
                                      body,
                                      recordCommercialImageNotifier.value,
                                      companyLogoNotifier.value,
                                      invoiceVm.filesAttach.where((element) => element.file != null).map((e) => e.file!).toList(),
                                      onAddInvoiceSuccess: (InvoiceModel invoice) {
                                        final commentModel = CommentModel(
                                          idComment: "idComment",
                                          fkUser: user.currentUser.idUser!,
                                          fkClient: widget.itemClient.idClients!,
                                          content: comment.text,
                                          nameUser: user.currentUser.nameUser!,
                                          imgImage: user.currentUser.img_image,
                                          nameEnterprise: invoice.name_enterprise!,
                                          date_comment: DateTime.now().toIso8601String(),
                                          type_comment: '',
                                        );
                                        context.read<comment_vm>().addCommentFromAddInvoice(commentModel);
                                      },
                                      onFail: (error) {
                                        AppSnackbar.showSnakeBar(error, color: ToastColorsEnum.error);
                                        context.read<LoadProvider>().changebooladdinvoice(false);
                                      },
                                    ).then((value) => value != "false" ? clear(context, value, _products) : error(context)).catchError((e) {});
                                  }

                                  invoiceVm.clearProducts();
                                } else {
                                  AppSnackbar.showSnakeBar(
                                    'من فضلك ادخل منتجات',
                                    color: ToastColorsEnum.warning,
                                  );
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

  ValueListenableBuilder<XFile?> _commercialRecordImage() {
    return ValueListenableBuilder<XFile?>(
        valueListenable: recordCommercialImageNotifier,
        builder: (context, recordCommercialImage, _) {
          return ValueListenableBuilder<bool>(
              valueListenable: isDeleteRecordCommercialImageNetworkImage,
              builder: (context, isDeleteRecordCommercial, _) {
                return Container(
                  height: 200.scaleIconsSize,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => pickImage((context, file) => onPickCommercialRecordImage(file)),
                                      borderRadius: BorderRadius.circular(90),
                                      child: Container(
                                        height: 40.scaleIconsSize,
                                        width: 40.scaleIconsSize,
                                        margin: EdgeInsets.only(top: 10, right: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: AppIcon(
                                          Icons.attachment_rounded,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => onDeleteCommercialRecordImage(),
                                      borderRadius: BorderRadius.circular(90),
                                      child: Container(
                                        height: 40.scaleIconsSize,
                                        width: 40.scaleIconsSize,
                                        margin: EdgeInsets.only(top: 10, left: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment: Alignment.center,
                                        child: AppIcon(
                                          Icons.delete_rounded,
                                          color: Colors.red,
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
                              onTap: () => AppFileViewer(urls: [_invoice!.imageRecord!]).show(context),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: FileViewerWidget(
                                        fileUrl: _invoice!.imageRecord,
                                      ),
                                    ),
                                  ),
                                  if (context.read<PrivilegesCubit>().checkPrivilege('146'))
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () => pickImage((context, file) => onPickCommercialRecordImage(file)),
                                              borderRadius: BorderRadius.circular(90),
                                              child: Container(
                                                height: 40.scaleIconsSize,
                                                width: 40.scaleIconsSize,
                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: AppIcon(
                                                  Icons.attachment_rounded,
                                                  color: Colors.grey.shade700,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => onDeleteCommercialRecordImage(),
                                              borderRadius: BorderRadius.circular(90),
                                              child: Container(
                                                height: 40.scaleIconsSize,
                                                width: 40.scaleIconsSize,
                                                margin: EdgeInsets.only(top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: AppIcon(
                                                  Icons.delete_rounded,
                                                  color: Colors.red,
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
                              onTap: () => pickImage((context, file) => onPickCommercialRecordImage(file)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppIcon(Icons.attachment_rounded, color: Colors.grey.shade700, size: 30),
                                  SizedBox(height: 0),
                                  AppText(
                                    'Attach image/file',
                                    fontFamily: AppFonts.fontFamily1,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade600,
                                  )
                                ],
                              ),
                            ),
                );
              });
        });
  }

  bool _hasLogo(XFile? companyLogo, bool isDeleteCompanyLogo) =>
      companyLogo != null || ((_invoice!.imagelogo?.isNotEmpty ?? false) && !isDeleteCompanyLogo);

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
      'renew_inventory': numInvoiceController.text.isNotEmpty ? numInvoiceController.text.toString() : null,
      'renew_pos': numPosController.text.isNotEmpty ? numPosController.text.toString() : null,
      'numusers': numuserController.text.toString(),
      'address_invoice': addressController.text.toString(),
      'invoice_source': selectedInvoiceSource,
      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator && invoiceVm.selectedCollaborator?.id_participate != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.agent && invoiceVm.selectedAgent != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor && invoiceVm.selectedDistributor != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else
        'type_seller': '3',
      // type seller is employee,

      if (sellerCommissionRate.text.isNotEmpty && invoiceVm.selectedSellerType != SellerTypeEnum.employee)
        'rate_participate': sellerCommissionRate.text,

      if (renewAgentController.text.isNotEmpty && invoiceVm.selectedSellerType == SellerTypeEnum.agent) 'renew_agent': renewAgentController.text,

      if (invoiceVm.selectedSellerType == SellerTypeEnum.agent)
        'fk_agent': invoiceVm.selectedAgent?.idAgent.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor)
        'fk_agent': invoiceVm.selectedDistributor?.idAgent.toString(),
      'numTax': numTaxController.text.toString(),

      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator) 'participate_fk': invoiceVm.selectedCollaborator?.id_participate.toString(),
    };
    if (readyinstallController == '0')
      body.addAll({
        'date_not_readyinstall': DateTime.now().toString(),
        'user_not_ready_install': Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString(),
      });
    if (invoiceVm.filesAttach.isNotEmpty) {
      Map<String, dynamic> attachFilesMap = {};
      int fileIndex = 0;
      for (final file in invoiceVm.filesAttach) {
        attachFilesMap["file_types[$fileIndex]"] = file.type == 'all' ? null : file.type;
        fileIndex++;
      }
      body.addAll({
        ...attachFilesMap,
      });
    } else
      body.addAll({
        'date_readyinstall': DateTime.now().toString(),
        'user_ready_install': Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString(),
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
      'fk_country': widget.invoice!.fk_country.toString(),
      "fk_idClient": widget.itemClient.idClients.toString(),
      "fk_idUser": user.currentUser.idUser,
      "image_record": widget.invoice!.imageRecord.toString(),
      "lastuserupdate": Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString(),
      "lastnameuser": Provider.of<UserProvider>(context, listen: false).currentUser.nameUser.toString(),
      "total": totalController,
      "notes": noteController.text.toString(),
      "id_invoice": invoiceID,
      'imagelogo': widget.invoice!.imagelogo.toString(),
      'numbarnch': numbranchController.text.toString(),
      'renew_inventory': numInvoiceController.text.isNotEmpty ? numInvoiceController.text.toString() : null,
      'renew_pos': numPosController.text.isNotEmpty ? numPosController.text.toString() : null,
      'renew_pluse': renewAdditionalOfBranchesController.text.toString(),
      'nummostda': nummostawdaController.text.toString(),
      'numusers': numuserController.text.toString(),
      'numTax': numTaxController.text.toString(),
      'address_invoice': addressController.text.toString(),
      'clientusername': userclientController.text.toString(),
      'date_lastuserupdate': DateTime.now().toString(),
      'invoice_source': selectedInvoiceSource,
      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator && invoiceVm.selectedCollaborator?.id_participate != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.agent && invoiceVm.selectedAgent != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor && invoiceVm.selectedDistributor != null)
        'type_seller': invoiceVm.selectedSellerType?.index.toString()
      else
        'type_seller': "3",

      if (sellerCommissionRate.text.isNotEmpty && invoiceVm.selectedSellerType != SellerTypeEnum.employee)
        'rate_participate': sellerCommissionRate.text,

      if (renewAgentController.text.isNotEmpty && invoiceVm.selectedSellerType == SellerTypeEnum.agent) 'renew_agent': renewAgentController.text,

      if (invoiceVm.selectedSellerType == SellerTypeEnum.agent)
        'fk_agent': invoiceVm.selectedAgent?.idAgent.toString()
      else if (invoiceVm.selectedSellerType == SellerTypeEnum.distributor)
        'fk_agent': invoiceVm.selectedDistributor?.idAgent.toString(),

      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator)
        'participate_fk': invoiceVm.selectedCollaborator?.id_participate.toString()
      else
        'participate_fk': null.toString(),

      if (invoiceVm.selectedSellerType == SellerTypeEnum.collaborator || invoiceVm.selectedSellerType == SellerTypeEnum.employee)
        'fk_agent': null.toString(),
    });
    if (invoiceVm.filesAttach.isNotEmpty) {
      Map<String, dynamic> attachFilesMap = {};
      int fileIndex = 0;
      for (final file in invoiceVm.filesAttach) {
        attachFilesMap["file_types[$fileIndex]"] = file.type == 'all' ? null : file.type;
        fileIndex++;
      }
      body.addAll({
        ...attachFilesMap,
      });
    }
    ;

    return body;
  }

  Map<String, dynamic> _prepareProducts(List<ProductsInvoice> products) {
    final Map<String, dynamic> body = {};

    final List<Map<String, dynamic>> productsJson = products.map((e) => e.toJson()).toList();

    for (int i = 0; i < productsJson.length; i++) {
      final Map<String, dynamic> product = productsJson[i];
      body.addAll({
        'products[$i]': product,
      });
    }

    return body;
  }

  clear(BuildContext context, String value, List<ProductsInvoice>? _products) async {
    Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(false);
    Navigator.pop(context);
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false).changebooladdinvoice(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(onPickFile: onPickFile),
    );
  }

  void onPickCommercialRecordImage(XFile file) {
    recordCommercialImageNotifier.value = file;
  }

  void onDeleteCommercialRecordImage() {
    if ((_invoice!.imageRecord?.isNotEmpty ?? false) && !isDeleteRecordCommercialImageNetworkImage.value) {
      isDeleteRecordCommercialImageNetworkImage.value = true;
      return;
    }
    recordCommercialImageNotifier.value = null;
  }

  void onPickCompanyLogo(XFile file) {
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
