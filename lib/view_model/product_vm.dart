
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/ProductService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'country_vm.dart';

class product_vm extends ChangeNotifier {
  List<ProductModel> listProduct = [];

  UserModel? usercurrent;

  void setvalue(user){
    print('in set usercurrent in product vm');
    usercurrent=user;
    notifyListeners();
  }

  Future<void> getproduct_vm() async {
    listProduct.clear();
    print('after clear');
    print(listProduct.length);
    listProduct = await ProductService().getAllProduct(usercurrent!.fkCountry.toString());
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
    print(res);
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









