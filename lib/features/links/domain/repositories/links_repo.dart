
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../data/models/link_model.dart';

abstract class LinksImportantRepository{
  Future<Result<ResponseWrapper<List<LinkImportantModel>>>> getLinkImportant();
  Future<Result<ResponseWrapper<LinkImportantModel>>> addLink(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<LinkImportantModel>>> editLink(Map<String, dynamic> body,String id);
  
}