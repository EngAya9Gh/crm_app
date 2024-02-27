import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../core/common/enums/comment_type.dart';

class comment_vm extends ChangeNotifier {
  List<CommentModel> _allCommentsList = [];
  List<CommentModel> filteredComments = [];
  bool isloadadd = false;
  bool isLoading = false;

  Future<void> getComment(String fk_client) async {
    try {
      isLoading = true;
      filteredComments = [];
      //isloadadd=true;
      notifyListeners();
      // if(listComments.isEmpty){
      List<dynamic> data = [];
      data = await Api()
          .get(url: url + 'care/viewcomment.php?fk_client=$fk_client');

      _allCommentsList = data.map((e) => CommentModel.fromJson(e)).toList();

      filteredComments = _allCommentsList;

      isLoading = false;
      //isloadadd=false;
      notifyListeners();
    } catch (e) {
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
      String res =
          await Api().post(url: url + 'care/addcomment.php', body: body);
      if (res != "error") {
        body.addAll({
          'id_comment': res,
          'date_comment':
              DateTime.now().toString(), //formatter.format(DateTime.now())
        });
        //listComments=[];
        _allCommentsList.insert(0, CommentModel.fromJson(body));
        filteredComments.insert(0, CommentModel.fromJson(body));
        final index =
            filteredComments.indexWhere((element) => element.idComment == res);
        filteredComments[index].imgImage = imageurl.toString();
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
