import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/card_product_Invoice.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../core/utils/app_strings.dart';

enum ProductType { device, program }

class AddInvoiceProduct extends StatefulWidget {
  const AddInvoiceProduct({
    super.key,
    required this.invoice,
  });

  final InvoiceModel? invoice;

  // int indexinvoic;
  @override
  _AddInvoiceProductState createState() => _AddInvoiceProductState();
}

class _AddInvoiceProductState extends State<AddInvoiceProduct> {
  late final InvoiceVm invoiceVm;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<ProductModel> listProduct = [];
  List<ProductsInvoice> listAdded = [];
  String? selectedvalue = null;
  ProductModel? selectedProduct = null;
  TextEditingController _taxuser = TextEditingController();

  TextEditingController _textprice = TextEditingController();

  TextEditingController _taxadmin = TextEditingController();
  TextEditingController _amount = TextEditingController();

  // late int index = 0;
  String? taxCountry = null;

  @override
  void initState() {
    invoiceVm = Provider.of<InvoiceVm>(context, listen: false);
    _taxuser.text = '';
    _taxadmin.text = '';
    _textprice.text = '';
    _amount.text = '';
    _taxuser.addListener(() {
      if (_taxuser.text.trim().isNotEmpty && _taxadmin.text.trim().isNotEmpty) {
        final userTax = num.tryParse(_taxuser.text.trim()) ?? 0;
        final adminTax = num.tryParse(_taxadmin.text.trim()) ?? 0;

        if (userTax + adminTax > 100) {
          _taxuser.text = (100 - adminTax).toString();
          _taxuser.selection = TextSelection.fromPosition(
              TextPosition(offset: _taxuser.text.length));
        }
      }

      if (_taxuser.text.trim().isNotEmpty) {
        final userTax = num.tryParse(_taxuser.text.trim()) ?? 0;

        if (userTax > 100) {
          _taxuser.text = 100.toString();
          _taxuser.selection = TextSelection.fromPosition(
              TextPosition(offset: _taxuser.text.length));
        }
      }
    });
    _taxadmin.addListener(() {
      if (_taxuser.text.trim().isNotEmpty && _taxadmin.text.trim().isNotEmpty) {
        final userTax = num.tryParse(_taxuser.text.trim()) ?? 0;
        final adminTax = num.tryParse(_taxadmin.text.trim()) ?? 0;

        if (userTax + adminTax > 100) {
          _taxadmin.text = (100 - userTax).toString();
          _taxadmin.selection = TextSelection.fromPosition(
              TextPosition(offset: _taxuser.text.length));
        }
      }

      if (_taxadmin.text.trim().isNotEmpty) {
        final adminTax = num.tryParse(_taxadmin.text.trim()) ?? 0;

        if (adminTax > 100) {
          _taxadmin.text = 100.toString();
          _taxadmin.selection = TextSelection.fromPosition(
              TextPosition(offset: _taxadmin.text.length));
        }
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //
    // });
    super.didChangeDependencies();
  }

  void calculate() {
    setState(() {
      double totaltax = 0;
      if (listProduct.isNotEmpty) {
        _textprice.text = double.parse(selectedProduct?.priceProduct ?? "0.0")
            .toStringAsFixed(2);
        String? taxCountry = selectedProduct?.value_config;

        if (taxCountry != null) {
          double pricewithtax =
              double.parse(_textprice.text) * double.parse(taxCountry) / 100;

          _textprice.text =
              (double.parse(_textprice.text) + pricewithtax).toString();
        }
        if (_taxadmin.text != '' && _taxuser.text != '') {
          totaltax = double.parse(_taxadmin.text) + double.parse(_taxuser.text);
          //_textprice.text=totaltax.toString();
        } else {
          if (_taxadmin.text != '') totaltax = double.parse(_taxadmin.text);
          if (_taxuser.text != '') totaltax = double.parse(_taxuser.text);
        }
        double pricewithouttax =
            double.parse(_textprice.text) * totaltax / 100; //حسم
        _textprice.text =
            (double.parse(_textprice.text) - pricewithouttax).toString();

        double totalprice = double.parse(_textprice.text) *
            double.parse(_amount.text.isEmpty ? '1' : _amount.text);
        // totalprice.floorToDouble();
        _textprice.text = totalprice.toStringAsFixed(2).toString();
      }
    });
  }

  ProductType? selectedProductType;

  onChangeProductType(ProductType productType, bool isSelected) {
    if (!isSelected) {
      selectedProductType = null;
      listProduct =
          List.of(Provider.of<product_vm>(context, listen: false).listProduct)
              .toList();
      setState(() {});
      return;
    }
    selectedProductType = productType;
    listProduct =
        List.of(Provider.of<product_vm>(context, listen: false).listProduct)
            .where((element) =>
                element.type == selectedProductType!.index.toString())
            .toList();
    selectedProduct = null;
    selectedvalue = null;
    setState(() {});
  }

  bool isInit = true;

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      listProduct = Provider.of<product_vm>(context, listen: true).listProduct;
      isInit = false;
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                double _total = 0;
                List<ProductsInvoice>? pinv = invoiceVm.productsInvoiceList;
                for (int i = 0; i < pinv.length; i++) {
                  _total = _total + double.parse(pinv[i].price.toString());
                }
                widget.invoice!.total = _total.toStringAsFixed(2).toString();

                invoiceVm.set_total(_total.toString());

                widget.invoice!.products = pinv;

                AppNavigator.pop();
              },
              icon: Icon(
                Icons.check_rounded,
                color: kWhiteColor,
              )),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white38,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 8.0,
                    color: Colors.black87.withOpacity(0.2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: RowEdit(name: "اختر النوع"),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
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
                              controller: GroupButtonController(
                                  selectedIndex: selectedProductType?.index),
                              options: GroupButtonOptions(
                                  buttonWidth:
                                      (MediaQuery.of(context).size.width / 2) -
                                          50,
                                  borderRadius: BorderRadius.circular(10)),
                              buttons: ['أجهزة', 'برامج'],
                              enableDeselect: true,
                              onSelected: (_, index, isselected) =>
                                  onChangeProductType(
                                      ProductType.values[index], isselected),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomSearchableDropDown<ProductModel>(
                            hint: "اختر منتج",
                            items: listProduct,
                            itemAsString: (item) => item?.nameProduct ?? '',
                            filterFn: (item, filter) {
                              return item.nameProduct
                                  .toLowerCase()
                                  .contains(filter.toLowerCase());
                            },
                            selectedItem: selectedProduct,
                            onChanged: (value) {
                              setState(() {
                                selectedProduct = value;
                                selectedvalue =
                                    selectedProduct?.idProduct.toString();
                                // index = listProduct.indexWhere((element) => element.idProduct == selectedvalue);
                                calculate();
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Flexible(
                                  child: Column(
                                children: [
                                  RowEdit(name: 'الكمية', des: ''),
                                  EditTextFormField(
                                    //read: false,
                                    onChanged: (val) {
                                      if (val.isEmpty) calculate();
                                    },
                                    inputType: TextInputType.number,
                                    label: 'الكمية',
                                    // radius: 10,

                                    controller: _amount,
                                    hintText: 'الكمية',
                                    inputformate: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: Column(
                                children: [
                                  RowEdit(name: 'السعر', des: ''),
                                  EditTextFormField(
                                    vaildator: (value) {
                                      if (value.toString().trim().isEmpty) {
                                        return AppStrings.labelEmpty;
                                      } else if (double.tryParse(
                                              value.toString()) ==
                                          null) {
                                        return 'من فضلك ادخل عدد';
                                      }
                                      return null;
                                    },
                                    //ontap: calculate,
                                    //read: false,
                                    controller: _textprice,
                                    label: 'السعر',
                                    hintText: Provider.of<UserProvider>(context,
                                            listen: true)
                                        .currentUser
                                        .currency
                                        .toString(),
                                    inputType: TextInputType.number,
                                    // inputformate: <TextInputFormatter>[
                                    //   FilteringTextInputFormatter.digitsOnly
                                    // ],
                                    //radius: 10
                                  ),
                                ],
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    RowEdit(name: ' الخصم للموظف', des: ' '),
                                    EditTextFormField(
                                      onChanged: (val) {
                                        calculate();
                                      },
                                      inputType: TextInputType.number,
                                      controller: _taxuser,
                                      hintText: '%',
                                      maxLength: 3,
                                      inputformate: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    RowEdit(name: ' الخصم للمشرف', des: ' '),
                                    EditTextFormField(
                                      onChanged: (val) {
                                        calculate();
                                      },
                                      inputType: TextInputType.number,
                                      controller: _taxadmin,
                                      hintText: '%',
                                      maxLength: 3,
                                      inputformate: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          const MySeparator(color: Colors.grey),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text(' إضافة منتج للفاتورة ' ,style: TextStyle(fontFamily: kfontfamily2),),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kMainColor)),
                                      onPressed: () {
                                        //iduser
                                        if (_textprice.text.isNotEmpty &&
                                            selectedvalue != null) {
                                          // final index =
                                          //     listProduct.indexWhere((element) => element.idProduct == selectedvalue);
                                          ProductModel pm = selectedProduct!;
                                          ProductsInvoice pp = ProductsInvoice(
                                            idInvoiceProduct: null,
                                            fkIdInvoice:
                                                widget.invoice!.idInvoice ==
                                                        null
                                                    ? '0'
                                                    : widget.invoice!.idInvoice
                                                        .toString(),
                                            fkclient:
                                                widget.invoice!.fkIdClient,
                                            fkuser: widget.invoice!.fkIdUser,
                                            fkProduct: pm.idProduct,
                                            fkConfig: pm.fkConfig == null
                                                ? "null"
                                                : pm.fkConfig,
                                            fkCountry: pm.fkCountry,
                                            price: _textprice.text,
                                            amount: _amount.text.isEmpty
                                                ? '1'
                                                : _amount.text,
                                            rateAdmin: _taxadmin.text,
                                            rateUser: _taxuser.text,
                                            nameProduct: pm.nameProduct,
                                            type: pm.type,
                                            idProduct: pm.idProduct,
                                            priceProduct: pm.priceProduct,
                                            taxtotal: pm.value_config == null
                                                ? "null"
                                                : pm.value_config,
                                            typeProdRenew: pm.typeProdRenew,
                                            localId: DateTime.now()
                                                .millisecondsSinceEpoch
                                                .toString(),
                                          );
                                          listAdded.add(pp);

                                          invoiceVm.addNewProductInvoice(pp);
                                        } else {
                                          AppConstants.showSnakeBar(context,
                                              'من فضلك تأكد من عملية الإدخال');
                                        }
                                        setState(() {
                                          _taxuser.text = '';
                                          _taxadmin.text = '';
                                          _textprice.text = '';
                                          _amount.text = '';
                                          selectedvalue = null;
                                          selectedProduct = null;
                                        });
                                      },
                                      child: Text('إضافة المنتج للفاتورة')),
                                ),
                                Text(''),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: Consumer<InvoiceVm>(
                              builder: (_, data, __) => Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount:
                                          data.productsInvoiceList.length,
                                      itemBuilder: (context, index) {
                                        return CardProductInvoice(
                                          invoice: widget.invoice,
                                          itemProd:
                                              data.productsInvoiceList[index],
                                          idUser: widget.invoice!.fkIdUser,
                                          idClient: widget.invoice!.fkIdClient,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
