import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/combox_widget/regoincombox.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/CardProduct_Invoice.dart';
import 'package:crm_smart/ui/widgets/product_widget/cardProduct.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

enum ProductType { device, program }

class add_invoiceProduct extends StatefulWidget {
  add_invoiceProduct(
      {required this.invoice,
      // required this.indexinvoic,
      Key? key})
      : super(key: key);
  InvoiceModel? invoice;

  // int indexinvoic;
  @override
  _add_invoiceProductState createState() => _add_invoiceProductState();
}

class _add_invoiceProductState extends State<add_invoiceProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<ProductModel> listProduct = [];
  List<ProductsInvoice> listAdded = [];
  String? selectedvalue = null;
  ProductModel? selectedProduct = null;
  TextEditingController _taxuser = TextEditingController();
  late String _taxuser_value;

  TextEditingController _textprice = TextEditingController();

  TextEditingController _taxadmin = TextEditingController();
  late String _taxadmin_value;
  TextEditingController _amount = TextEditingController();
  late String _amount_value;
  // late int index = 0;
  String? taxCountry = null;

  @override
  void initState() {
    _taxuser.text = '';
    _taxuser_value = '';
    _taxadmin.text = '';
    _taxadmin_value = '';
    _textprice.text = '';
    _amount.text = '';
    _amount_value = '1';
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
                List<ProductsInvoice>? pinv =
                    Provider.of<invoice_vm>(context, listen: false)
                        .listproductinvoic;
                for (int i = 0; i < pinv.length; i++) {
                  _total = _total + double.parse(pinv[i].price.toString());
                }
                widget.invoice!.total = _total.toStringAsFixed(2).toString();

                Provider.of<invoice_vm>(context, listen: false)
                    .set_total(_total.toString());

                widget.invoice!.products = pinv;

                // Provider.of<invoice_vm>(context,listen: false)
                //   .updatelistproducetInvoice();//to refresh total in list invoice

                Navigator.pop(context);
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
                          DropdownSearch<ProductModel>(
                            items: listProduct,
                            dropdownSearchDecoration: InputDecoration(
                                hintText: "اختر منتج",
                                isCollapsed: true,
                                isDense: true),
                            itemAsString: (item) => item?.nameProduct ?? '',
                            searchFieldProps: TextFieldProps(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: "ابحث هنا...",
                                )),
                            dropDownButton: Icon(Icons.arrow_drop_down_rounded),
                            showSearchBox: true,
                            popupShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
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

                          // DropdownButton(
                          //   isExpanded: true,
                          //   hint: Text("اختر منتج"),
                          //   items: listProduct.map((level_one) {
                          //     return DropdownMenuItem(
                          //       child: Text(level_one.nameProduct), //label of item
                          //       value: level_one.idProduct, //value of item
                          //     );
                          //   }).toList(),
                          //   value:
                          //   selectedvalue, //select_dataItem!.idCountry ,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       selectedvalue = value.toString();
                          //       index=listProduct.indexWhere(
                          //               (element) => element.idProduct==selectedvalue);
                          //       calculate();
                          //     });
                          //     //Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
                          //   },
                          // ),
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
                                      if (val == null) _amount_value = '';
                                      _amount_value = val;
                                      calculate();
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
                                    vaild: (value) {
                                      if (value.toString().trim().isEmpty) {
                                        return labelEmpty;
                                      }
                                      if (double.tryParse(value.toString()) ==
                                          null) return 'من فضلك ادخل عدد';
                                      // else if(value.characters){
                                      //   return ;
                                      // }
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
                                        _taxuser_value = val;
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
                                        _taxadmin_value = val;
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
                              //   //TextBox.fromLTRBD(20, 20, 20, 20,TextDirection.rtl),
                            ],
                          ),

                          SizedBox(
                            height: 5,
                          ),
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
                                              idInvoiceProduct: "null",
                                              fkIdInvoice: widget
                                                          .invoice!.idInvoice ==
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
                                              //value: listProduct[index].idProduct,
                                              //idInvoiceProduct: "null",
                                              priceProduct: pm.priceProduct,
                                              taxtotal: pm.value_config == null
                                                  ? "null"
                                                  : pm.value_config,
                                              typeProdRenew: pm.typeProdRenew);
                                          listAdded.add(pp);

                                          Provider.of<invoice_vm>(context,
                                                  listen: false)
                                              .addlistproductinvoic(pp);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'من فضلك تأكد من عملية الإدخال')));
                                        }
                                        setState(() {
                                          _taxuser.text = '';
                                          _taxuser_value = '';
                                          _taxadmin.text = '';
                                          _taxadmin_value = '';
                                          _textprice.text = '';
                                          _amount.text = '';
                                          _amount_value = '1';
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
                            child: Consumer<invoice_vm>(
                              builder: (_, data, __) => Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemCount: data.listproductinvoic.length,
                                      itemBuilder: (context, index) {
                                        return CardProduct_invoice(
                                          invoice: widget.invoice,
                                          itemProd:
                                              data.listproductinvoic[index],
                                          index: index,
                                          //value_config:  listProduct[index].value_config,
                                          iduser: widget.invoice!.fkIdUser,
                                          idclient: widget.invoice!.fkIdClient,
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
