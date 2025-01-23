import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/invoiceModel.dart';
import '../model/productmodel.dart';
import '../model/usermodel.dart';
import '../provider/loadingprovider.dart';
import '../services/ProductService.dart';
import '../ui/screen/invoice/add_invoice_product.dart';

class  product_vm extends ChangeNotifier {
  List<ProductModel> listProduct = [];
  List<ProductModel> listFilteredTypeProduct = [];
  bool isloading = false;
  bool isloadingCal = false;


  UserModel? usercurrent;

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  // searchProducts
  Future<void> searchProducts(String productName) async {
    List<ProductModel> templistProduct = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //

    if (productName.isNotEmpty) {
      if (listProduct.isNotEmpty) {
        listProduct.forEach((element) {
          if (element.nameProduct.toString().contains(searchKey, 0)
              // || element.mobile!.contains(searchKey,0)
              ) templistProduct.add(element);
        });
      }
    } else {
      getproduct_vm();
    }
    listProduct = List.from(templistProduct);
    notifyListeners();
  }

  Future<void> getproduct_vm({String? type}) async {
    isloading = true;
    notifyListeners();
    // listProduct.clear();
    debugPrint("start fetching");
    listProduct =
        await ProductService().getAllProduct(usercurrent!.fkCountry.toString(),type: type);
    isloading = false;
    notifyListeners();
  }
  Future<void> getProductsWithOffer({String? offerId}) async {
    isloading = true;
    notifyListeners();
    // listProduct.clear();
    debugPrint("start fetching");
    listProduct =
        await ProductService().getAllProductByOfferId(offerId);
    isloading = false;
    notifyListeners();
  }

  Future<String> addproduct_vm(Map<String, dynamic> body) async {
    try {
      ProductModel res = await ProductService().addProduct(body);
      // if (res!="false") {
      print(res);
      //   body.addAll({'id_product':res});
      listProduct.insert(0, res);
      //notifyListeners();
      // }
      notifyListeners();
      return "done";
    }catch(e,s){
      // throw Exception(e.toString());
      return "error";
    }
  }

  Future<bool> updateproduct_vm(
      Map<String, dynamic> body, String id_product) async {
    ProductModel res = await ProductService().updateProduct(body, id_product);

    final index =
        listProduct.indexWhere((element) => element.idProduct == id_product);
    listProduct[index] = res;
    notifyListeners();

    return true;
  }

  Future<String> deleteProduct(String? id_product) async {
    //listProduct=[];
    String res = await ProductService().deleteProductById(id_product!);

    if (res == "done") {
      final index =
          listProduct.indexWhere((element) => element.idProduct == id_product);
      listProduct.removeAt(index);
      notifyListeners();
    }
    return res;
  }
  Future<String> changeFilterType(ProductType productType) async {
  listFilteredTypeProduct=  listProduct.where((element) => element.type == productType.index.toString()).toList();
      notifyListeners();
    return '';
  }

  Future<List<CalculatePriceProductModel>> CalculateProductsPrice(List<ProductsInvoice> productsInvoice) async {
    //listProduct=[];
    isloadingCal = true;
    notifyListeners();
    var res = await ProductService().calculateProductsPrice(productsInvoice);
    isloadingCal = false;
    notifyListeners();
    return res;
  }
}

class CalculatePriceProductModel {
  final String? product;
  final String? amount;
  final String? unitInitialPrice;
  final int? unitPriceAfterOffer;
  final int? unitFinalPrice;
  final int? finalPrice;

  CalculatePriceProductModel({
    this.product,
    this.amount,
    this.unitInitialPrice,
    this.unitPriceAfterOffer,
    this.unitFinalPrice,
    this.finalPrice,
  });

  CalculatePriceProductModel copyWith({
    String? product,
    String? amount,
    String? unitInitialPrice,
    int? unitPriceAfterOffer,
    int? unitFinalPrice,
    int? finalPrice,
  }) =>
      CalculatePriceProductModel(
        product: product ?? this.product,
        amount: amount ?? this.amount,
        unitInitialPrice: unitInitialPrice ?? this.unitInitialPrice,
        unitPriceAfterOffer: unitPriceAfterOffer ?? this.unitPriceAfterOffer,
        unitFinalPrice: unitFinalPrice ?? this.unitFinalPrice,
        finalPrice: finalPrice ?? this.finalPrice,
      );

  factory CalculatePriceProductModel.fromJson(Map<String, dynamic> json) => CalculatePriceProductModel(
    product: json["product"],
    amount: json["amount"],
    unitInitialPrice: json["unit_initial_price"],
    unitPriceAfterOffer: json["unit_price_after_offer"],
    unitFinalPrice: json["unit_final_price"],
    finalPrice: json["final_price"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "amount": amount,
    "unit_initial_price": unitInitialPrice,
    "unit_price_after_offer": unitPriceAfterOffer,
    "unit_final_price": unitFinalPrice,
    "final_price": finalPrice,
  };
}

