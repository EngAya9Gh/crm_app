import 'package:crm_smart/core/services/api/api_services.dart';

import '../api/api.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/productmodel.dart';

class ProductService {
  Future<ProductModel> addProduct(Map<String, dynamic> body) async {
    try{

    var result = await Api().post(
        url: EndPoints.baseUrls.urlLaravel + EndPoints.products.addProduct, body: body);
    return ProductModel.fromJson(
        result['message']); //result !="error"? result:"false";}
    }
    catch(e){
    throw Exception(e.toString());
    }
  }

  //id_product
  Future<ProductModel> updateProduct(Map<String, dynamic> body, String idproduct) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.urlLaravel + EndPoints.products.updateProduct(int.parse(idproduct)),
        body: body);
    return ProductModel.fromJson(result['message']); //result=="done"? true:false;
  }

  Future<List<ProductModel>> getAllProduct(String fk_country) async {
    List<dynamic> data = [];
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await apiServices.get(
      endPoint: 'products',
    );
    // data = await ApiServices.get(
    //
    //     endPoint: EndPoints.baseUrls.urlLaravel +
    //         'products',);
    data = response['message'];
    List<ProductModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(ProductModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<String> deleteProductById(String idproduct) async {
    String res = "";
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final ressponse = await apiServices.post(
        endPoint:EndPoints.products.deleteProduct(int.parse(idproduct)) ,
      );
      res=ressponse['result'];
      // res = await Api().delete(
      //     url: EndPoints.baseUrls.urlLaravel + EndPoints.products.deleteProduct(int.parse(idproduct)), body: {});
    } catch (e) {
      return res;
    }
    return res;
  }
}
