import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/productmodel.dart';

import '../core/utils/end_points.dart';

class ProductService {
  Future<ProductModel> addProduct(Map<String, dynamic?> body) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.url + "products/addProduct.php", body: body);
    return ProductModel.fromJson(
        result[0]); //result !="error"? result:"false";}
  }

  //id_product
  Future<ProductModel> updateProduct(
      Map<String, dynamic> body, String idproduct) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.url +
            "products/updateProduct.php?id_product=$idproduct",
        body: body);
    return ProductModel.fromJson(result[0]); //result=="done"? true:false;
  }

  Future<List<ProductModel>> getAllProduct(String fk_country) async {
    List<dynamic> data = [];

    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'products/getAllProduct.php?fk_country=$fk_country');

    List<ProductModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ProductModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<ProductModel>> getAllProductById(String idproduct) async {
    List<dynamic> data = await Api().get(
        url: EndPoints.baseUrls.url +
            'products/getProductById.php?idproduct=$idproduct');

    List<ProductModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ProductModel.fromJson(data[i]));
    }
    return prodlist;
  }

  Future<String> deleteProductById(String idproduct) async {
    String res = "";
    try {
      res = await Api().delete(
          url: EndPoints.baseUrls.url +
              'products/deleteProduct.php?fk_product=$idproduct');
    } catch (e) {
      return res;
    }
    return res;
  }
}
