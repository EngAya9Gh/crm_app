
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

class product_vm extends ChangeNotifier {
  List<ProductModel> listProduct = [];
  bool   isloading=false;

  UserModel? usercurrent;

  void setvalue(user){
    
    usercurrent=user;
    notifyListeners();
  }
  // searchProducts
  Future<void> searchProducts(
      String productName) async {
    List<ProductModel> templistProduct = [];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    
    if(productName.isNotEmpty) {
      if(listProduct.isNotEmpty ) {
         listProduct.forEach((element) {
          if(element.nameProduct.toString().contains(searchKey,0)
           // || element.mobile!.contains(searchKey,0)
          )
            templistProduct.add(element);
        });
      }}
    else {
      getproduct_vm();
    }
    listProduct=List.from(templistProduct);
    notifyListeners();
  }
  Future<void> getproduct_vm() async {
    isloading=true;
    notifyListeners();
    // listProduct.clear();
    
    
    listProduct = await ProductService()
        .getAllProduct(usercurrent!.fkCountry.toString());
    isloading=false;
    notifyListeners();
  }

  Future<String> addproduct_vm(Map<String, dynamic?> body) async {
    ProductModel res = await ProductService().addProduct(body);
    // if (res!="false") {
    //   body.addAll({'id_product':res});
      listProduct.insert(0,res);
      //notifyListeners();
   // }
    notifyListeners();
    return "done";
  }
  Future<bool> updateproduct_vm(Map<String, dynamic?> body,String id_product) async {
    ProductModel res = await ProductService().updateProduct(body,id_product);

      final index=listProduct.indexWhere((element) => element.idProduct==id_product);
      listProduct[index]=res;
      notifyListeners();

    return true;
  }
  Future<String> deleteProduct(String? id_product) async {
    //listProduct=[];
    String res = await ProductService().deleteProductById(id_product!);
    
      if(res=="done"){
        final index=listProduct.indexWhere(
                (element) =>
        element.idProduct==id_product);
        listProduct.removeAt(index);
        notifyListeners();

    }
    return res;
    }

  }









