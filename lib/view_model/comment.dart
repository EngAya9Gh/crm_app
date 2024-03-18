import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../core/common/enums/comment_type.dart';
import '../core/utils/end_points.dart';

class comment_vm extends ChangeNotifier {
  List<CommentModel> _allCommentsList = [];
  List<CommentModel> filteredComments = [];
  CommmentType filterCommentType = CommmentType.all;
  bool isloadadd = false;
  bool isLoading = false;

  Future<void> getComment(String fk_client) async {
    try {
      isLoading = true;
      _allCommentsList = [];
      filteredComments = [];
      //isloadadd=true;
      notifyListeners();
      // if(listComments.isEmpty){
      List<dynamic> data = [];
      data = await Api().get(
          url: EndPoints.baseUrls.url +
              'care/viewcomment.php?fk_client=$fk_client');

      _allCommentsList = data.map((e) => CommentModel.fromJson(e)).toList();

      filteredComments = _allCommentsList;

      isLoading = false;
      //isloadadd=false;
      notifyListeners();
    } catch (e) {
      print("error => $e");
      isLoading = false;
      notifyListeners();
    }
  }

  void filterCommentsByType(String type) {
    if (type == CommmentType.all.value) {
      filteredComments = _allCommentsList;
      notifyListeners();
      return;
    }
    filteredComments = _allCommentsList
        .where((element) => element.type_comment == type)
        .toList();
    notifyListeners();
  }

  Future<String> addComment_vm(
      Map<String, dynamic?> body, String? imageurl) async {
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
