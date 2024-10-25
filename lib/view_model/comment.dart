import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../api/api.dart';
import '../core/common/enums/comments/comment_type_enum.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/errors/base_app_exception.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/commentmodel.dart';

class comment_vm extends ChangeNotifier {
  List<CommentModel> _allCommentsList = [];
  List<CommentModel> filteredComments = [];
  CommentTypeEnum filterCommentType = CommentTypeEnum.all;
  bool isloadadd = false;
  bool isLoading = false;

  Future<void> getComments(String fk_client) async {
    try {
      _allCommentsList = [];
      filteredComments = [];
      isLoading = true;
      notifyListeners();

      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      var response = await apiServices.get(
        endPoint: EndPoints.care.viewComments,
        queryParameters: {'fk_client': fk_client},
      );
      // todo: remove after backend changes
      response = jsonDecode(response);

      final data = apiDataHandler(response);

      _allCommentsList = List<CommentModel>.from(data.map((e) {
        return CommentModel.fromJson(e);
      }).toList());

      filteredComments = _allCommentsList;

      isLoading = false;
      notifyListeners();
    } on BaseAppException catch (e) {
      debugPrint(e.message);
      isLoading = false;
      notifyListeners();
      throw e.message;
    } catch (e) {
      debugPrint("error in getComments is => $e");
      isLoading = false;
      notifyListeners();
    }
  }

  void filterCommentsByType(String type) {
    if (type == CommentTypeEnum.all.value) {
      filteredComments = _allCommentsList;
      notifyListeners();
      return;
    }
    filteredComments = _allCommentsList
        .where((element) => element.type_comment.contains(type))
        .toList();
    notifyListeners();
  }

  Future<String> addComment_vm(
      Map<String, dynamic> body, String? imageurl,String clientId) async {
    try {
      isloadadd = true;
      notifyListeners();
      var sentBody={
        'content': body["content"],
        if (body["type_comment"] != null)
          'type_comment': body["type_comment"],
      };
      var res = await Api().post(
          url: EndPoints.baseUrls.urlLaravel + 'addComment/$clientId', body: sentBody);
      if(res!="error"){
        body.addAll({
          'id_comment': res["id_comment"]!=null?res["id_comment"].toString():"",
          'date_comment':
              DateTime.now().toString(), //formatter.format(DateTime.now())
        });
        _allCommentsList.insert(0, CommentModel.fromJson(body));
        filteredComments = _allCommentsList;
        filterCommentsByType(filterCommentType.value);

        isloadadd = false;
        notifyListeners();
      }
      isloadadd = false;
      notifyListeners();
      return "success";
    } catch (e,s) {
      print(e.toString() + s.toString());
      isloadadd = false;
      notifyListeners();
      return "error";
    }
  }

  addCommentFromAddInvoice(CommentModel comment) {
    filteredComments.insert(0, comment);
    notifyListeners();
  }
}
