import 'dart:convert';

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../core/common/enums/comment_type_enum.dart';
import '../core/utils/end_points.dart';

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

      _allCommentsList = List<CommentModel>.from(
          data.map((e) => CommentModel.fromJson(e)).toList());

      filteredComments = _allCommentsList;

      isLoading = false;
      notifyListeners();
    } on BaseAppException catch (e) {
      debugPrint(e.message);
      isLoading = false;
      notifyListeners();
      throw e;
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
      Map<String, dynamic> body, String? imageurl) async {
    try {
      isloadadd = true;
      final DateFormat formatter = DateFormat('yyyy-MM-dd h-m-s');
      notifyListeners();
      String res = await Api().post(
          url: EndPoints.baseUrls.url + 'care/addcomment.php', body: body);
      if (res != "error") {
        body.addAll({
          'id_comment': res,
          'date_comment':
              DateTime.now().toString(), //formatter.format(DateTime.now())
        });
        //listComments=[];
        _allCommentsList.insert(0, CommentModel.fromJson(body));
        filteredComments = _allCommentsList;
        filterCommentsByType(filterCommentType.value);

        isloadadd = false;
        notifyListeners();
      }
      isloadadd = false;
      notifyListeners();
      return res;
    } catch (e) {
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
