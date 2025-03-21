import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/sales/packages_offers/presentation/manager/packages_offers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/common/helpers/input_validator.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_group_button.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/common/widgets/custom_error_widget.dart';
import '../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/sales/packages_offers/data/models/package_offer_model.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/productmodel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/product_vm.dart';
import '../../widgets/custom_widget/app_separator_dots_line.dart';
import '../../widgets/invoice_widget/card_product_Invoice.dart';

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
  final ValueNotifier<PackageOfferModel?> selectedOfferModel = ValueNotifier(null);
  TextEditingController _taxuser = TextEditingController();

  TextEditingController _textprice = TextEditingController();

  TextEditingController _taxadmin = TextEditingController();
  TextEditingController _amount = TextEditingController();

  // late int index = 0;
  String? taxCountry = null;
  late product_vm productVm;

  @override
  void initState() {
    context.read<PackagesOffersBloc>().add(GetPackagesOffersFilterEvent());
    productVm = Provider.of<product_vm>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productVm.getProductsWithOffer(); // Now it's safe to call
    });
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
          _taxuser.selection = TextSelection.fromPosition(TextPosition(offset: _taxuser.text.length));
        }
      }

      if (_taxuser.text.trim().isNotEmpty) {
        final userTax = num.tryParse(_taxuser.text.trim()) ?? 0;

        if (userTax > 100) {
          _taxuser.text = 100.toString();
          _taxuser.selection = TextSelection.fromPosition(TextPosition(offset: _taxuser.text.length));
        }
      }
    });
    _taxadmin.addListener(() {
      if (_taxuser.text.trim().isNotEmpty && _taxadmin.text.trim().isNotEmpty) {
        final userTax = num.tryParse(_taxuser.text.trim()) ?? 0;
        final adminTax = num.tryParse(_taxadmin.text.trim()) ?? 0;

        if (userTax + adminTax > 100) {
          _taxadmin.text = (100 - userTax).toString();
          _taxadmin.selection = TextSelection.fromPosition(TextPosition(offset: _taxuser.text.length));
        }
      }

      if (_taxadmin.text.trim().isNotEmpty) {
        final adminTax = num.tryParse(_taxadmin.text.trim()) ?? 0;

        if (adminTax > 100) {
          _taxadmin.text = 100.toString();
          _taxadmin.selection = TextSelection.fromPosition(TextPosition(offset: _taxadmin.text.length));
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
        _textprice.text = double.parse(selectedProduct?.priceProduct ?? "0.0").toStringAsFixed(2);
        String? taxCountry = selectedProduct?.value_config;

        if (taxCountry != null) {
          double pricewithtax = double.parse(_textprice.text) * double.parse(taxCountry) / 100;

          _textprice.text = (double.parse(_textprice.text) + pricewithtax).toString();
        }
        if (_taxadmin.text != '' && _taxuser.text != '') {
          totaltax = double.parse(_taxadmin.text) + double.parse(_taxuser.text);
          //_textprice.text=totaltax.toString();
        } else {
          if (_taxadmin.text != '') totaltax = double.parse(_taxadmin.text);
          if (_taxuser.text != '') totaltax = double.parse(_taxuser.text);
        }
        double pricewithouttax = double.parse(_textprice.text) * totaltax / 100; //حسم
        _textprice.text = (double.parse(_textprice.text) - pricewithouttax).toString();

        double totalprice = double.parse(_textprice.text) * double.parse(_amount.text.isEmpty ? '1' : _amount.text);
        // totalprice.floorToDouble();
        _textprice.text = totalprice.toStringAsFixed(2).toString();
      }
    });
  }

  ProductType? selectedProductType;

  onChangeProductType(ProductType productType, bool isSelected) {
    if (!isSelected) {
      selectedProductType = null;
      listProduct = List.of(Provider.of<product_vm>(context, listen: false).listProduct).toList();
      setState(() {});
      return;
    }
    selectedProductType = productType;
    productVm.changeFilterType(productType);
    listProduct = List.of(Provider.of<product_vm>(context, listen: false).listProduct)
        .where((element) => element.type == selectedProductType!.index.toString())
        .toList();
    selectedProduct = null;
    selectedvalue = null;
    setState(() {});
  }

  bool isInit = true;

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      listProduct = productVm.listProduct;
      isInit = false;
    }

    return AppScaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: 'إضافة منتجات للفاتورة',
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
              icon: AppIcon(
                Icons.check_rounded,
                color: AppColors.white,
              )),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppCardContainer(
            child: SingleChildScrollView(
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
                          child: AppText('اختر النوع'),
                        ),
                        SizedBox(height: 10),
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
                          child: AppGroupButton(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            groupButtonController: GroupButtonController(selectedIndex: selectedProductType?.index),
                            buttons: ['أجهزة', 'برامج'],
                            onSelected: (value, index, isSelected) {
                              onChangeProductType(ProductType.values[index], isSelected);
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        BlocBuilder<PackagesOffersBloc, PackagesOffersState>(
                          builder: (context, state) {
                            if (state.allFilterOffersPackages.isLoading()) {
                              return AppLoader();
                            } else if (state.allFilterOffersPackages.isFailed()) {
                              return AppErrorWidget(
                                message: 'error try again',
                                onPressed: () {
                                  context.read<PackagesOffersBloc>().add(GetPackagesOffersFilterEvent());
                                },
                              );
                            } else if (state.allFilterOffersPackages.data?.isEmpty ?? true) {
                              return SizedBox.shrink();
                            }
                            return ValueListenableBuilder(
                              valueListenable: selectedOfferModel,
                              builder: (context, value, child) => Row(
                                children: [
                                  Expanded(
                                    child: CustomSearchableDropDown<PackageOfferModel>(
                                      hint: 'العروض',
                                      items: state.allFilterOffersPackages.data ?? [],
                                      itemAsString: (item) => item!.name ?? '',
                                      selectedItem: value,
                                      onChanged: (value) async {
                                        selectedOfferModel.value = value;
                                        productVm.getProductsWithOffer(offerId: value!.id.toString()).then(
                                          (value) {
                                            listProduct = List.of(Provider.of<product_vm>(context, listen: false).listProduct);
                                            if (selectedProductType != null) {
                                              productVm.changeFilterType(selectedProductType!);
                                            }
                                            selectedProduct = null;
                                            setState(() {});
                                          },
                                        ); // Now it's safe to call
                                      },
                                      validator: (value) {
                                        return InputValidator.requiredFiled(value);
                                      },
                                      filterFn: (item, filter) {
                                        return item.name!.toLowerCase().contains(filter.toLowerCase());
                                      },
                                      compareFn: (item, selectedItem) => item.id == selectedItem.id,
                                    ),
                                  ),
                                  if (value != null)
                                    InkWell(
                                      onTap: () {
                                        productVm.getProductsWithOffer().then(
                                          (value) {
                                            listProduct = List.of(Provider.of<product_vm>(context, listen: false).listProduct);
                                          },
                                        );
                                        selectedOfferModel.value = null;
                                        selectedProduct = null;
                                        setState(() {});
                                      },
                                      child: Icon(Icons.delete),
                                    )
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        Consumer<product_vm>(
                          builder: (context, value, child) {
                            if (value.isloading) {
                              return AppLoader();
                            } else
                              return CustomSearchableDropDown<ProductModel>(
                                hint: "اختر منتج",
                                items: selectedProductType != null ? value.listFilteredTypeProduct : value.listProduct,
                                itemAsString: (item) => item?.nameProduct ?? '',
                                filterFn: (item, filter) {
                                  return item.nameProduct?.toLowerCase().contains(filter.toLowerCase()) ?? false;
                                },
                                compareFn:  (item, selectedItem) => item.idProduct == selectedItem.idProduct,
                                selectedItem: selectedProduct,
                                onChanged: (value) {
                                  setState(() {
                                    selectedProduct = value;
                                    selectedvalue = selectedProduct?.idProduct.toString();

                                    // index = listProduct.indexWhere((element) => element.idProduct == selectedvalue);
                                    calculate();
                                  });
                                },
                              );
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText('الكمية'),
                                  AppTextField(
                                    hintText: 'الكمية',
                                    controller: _amount,
                                    onChange: (val) {
                                      calculate();
                                    },
                                    inputType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText('السعر'),
                                  AppTextField(
                                    hintText: 'السعر',
                                    controller: _textprice,
                                    inputType: TextInputType.numberWithOptions(decimal: true),
                                    validator: (value) {
                                      if (value.toString().trim().isEmpty) {
                                        return AppStrings.labelEmpty;
                                      } else if (double.tryParse(value.toString()) == null) {
                                        return 'من فضلك ادخل عدد';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText('الخصم للموظف'),
                                  AppTextField(
                                    hintText: 'الخصم للموظف',
                                    controller: _taxuser,
                                    onChange: (val) {
                                      calculate();
                                    },
                                    inputType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                    prefix: AppText('%'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText('الخصم للمشرف'),
                                  AppTextField(
                                    hintText: 'الخصم للمشرف',
                                    controller: _taxadmin,
                                    onChange: (val) {
                                      calculate();
                                    },
                                    inputType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                    prefix: AppText('%'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ValueListenableBuilder(
                            valueListenable: selectedOfferModel,
                            builder: (context, value, child) {
                              if (value != null) {
                                return Consumer<product_vm>(
                                  builder: (context, value, child) => AppElevatedButton(
                                    isLoading: (selectedvalue != null && value.isloadingCal),
                                    text: "تطبيق خصم العرض على المنتج",
                                    onPressed: () async {
                                      if (_textprice.text.isNotEmpty && selectedvalue != null) {
                                        ProductModel pm = selectedProduct!;
                                        ProductsInvoice pp = ProductsInvoice(
                                            idInvoiceProduct: null,
                                            fkIdInvoice: widget.invoice!.idInvoice == null ? '0' : widget.invoice!.idInvoice.toString(),
                                            fkclient: widget.invoice!.fkIdClient,
                                            fkuser: widget.invoice!.fkIdUser,
                                            fkProduct: pm.idProduct,
                                            fkConfig: pm.fkConfig == null ? "null" : pm.fkConfig,
                                            fkCountry: pm.fkCountry,
                                            price: _textprice.text,
                                            amount: _amount.text.isEmpty ? '1' : _amount.text,
                                            rateAdmin: _taxadmin.text,
                                            rateUser: _taxuser.text,
                                            nameProduct: pm.nameProduct,
                                            type: pm.type,
                                            idProduct: pm.idProduct,
                                            priceProduct: pm.priceProduct,
                                            taxtotal: pm.value_config == null ? "null" : pm.value_config,
                                            typeProdRenew: pm.typeProdRenew,
                                            localId: DateTime.now().millisecondsSinceEpoch.toString(),
                                            offerId: selectedOfferModel.value?.id.toString());
                                        productVm.CalculateProductsPrice([pp]).then(
                                          (value) {
                                            _amount.text = value.first.amount!;
                                            _textprice.text = value.first.finalPrice.toString();
                                          },
                                        );
                                      } else {
                                        AppSnackbar.showSnakeBar(
                                          'من فضلك تأكد من عملية الإدخال',
                                          color: ToastColorsEnum.error,
                                        );
                                      }
                                    },
                                  ),
                                );
                              }
                              return SizedBox.shrink();
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: AppElevatedButton(
                            text: 'إضافة المنتج للفاتورة',
                            onPressed: () {
                              //iduser
                              if (_textprice.text.isNotEmpty && selectedvalue != null) {
                                // final index =
                                //     listProduct.indexWhere((element) => element.idProduct == selectedvalue);
                                ProductModel pm = selectedProduct!;
                                ProductsInvoice pp = ProductsInvoice(
                                  idInvoiceProduct: null,
                                  fkIdInvoice: widget.invoice!.idInvoice == null ? '0' : widget.invoice!.idInvoice.toString(),
                                  fkclient: widget.invoice!.fkIdClient,
                                  fkuser: widget.invoice!.fkIdUser,
                                  fkProduct: pm.idProduct,
                                  fkConfig: pm.fkConfig == null ? "null" : pm.fkConfig,
                                  fkCountry: pm.fkCountry,
                                  price: _textprice.text,
                                  amount: _amount.text.isEmpty ? '1' : _amount.text,
                                  rateAdmin: _taxadmin.text,
                                  rateUser: _taxuser.text,
                                  nameProduct: pm.nameProduct,
                                  type: pm.type,
                                  idProduct: pm.idProduct,
                                  priceProduct: pm.priceProduct,
                                  taxtotal: pm.value_config == null ? "null" : pm.value_config,
                                  typeProdRenew: pm.typeProdRenew,
                                  localId: DateTime.now().millisecondsSinceEpoch.toString(),
                                  offerId:selectedOfferModel.value==null?null:selectedOfferModel.value!.id.toString()
                                );
                                listAdded.add(pp);

                                invoiceVm.addNewProductInvoice(pp);
                              } else {
                                AppSnackbar.showSnakeBar(
                                  'من فضلك تأكد من عملية الإدخال',
                                  color: ToastColorsEnum.error,
                                );
                              }
                              setState(() {
                                _taxuser.text = '';
                                _taxadmin.text = '';
                                _textprice.text = '';
                                _amount.text = '';
                                selectedvalue = null;
                                selectedProduct = null;
                                selectedOfferModel.value = null;
                                selectedProductType=null;
                                productVm.getProductsWithOffer(); // Now it's safe to call
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        const AppSeparatorDotsLine(color: Colors.grey),
                        SizedBox(height: 10),
                        Consumer<InvoiceVm>(
                          builder: (_, data, __) => Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: data.productsInvoiceList.length,
                                itemBuilder: (context, index) {
                                  return CardProductInvoice(
                                    invoice: widget.invoice,
                                    itemProd: data.productsInvoiceList[index],
                                    idUser: widget.invoice!.fkIdUser,
                                    idClient: widget.invoice!.fkIdClient,
                                  );
                                },
                              ),
                            ],
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
    );
  }
}
