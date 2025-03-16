import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:crm_smart/core/errors/server_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../core/common/enums/comments/comment_type_enum.dart';
import '../core/common/enums/toast_colors_enum.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/common/helpers/app_snackbar.dart';
import '../core/common/models/user_entity.dart';
import '../core/errors/base_app_exception.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/commentmodel.dart';
import '../model/usermodel.dart';

class comment_vm extends ChangeNotifier {
  List<CommentModel> _allCommentsList = [];
  List<CommentModel> filteredComments = [];
  List<CommentModel> commentMention = [];
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
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      var response = await apiServices.get(
        endPoint: EndPoints.care.viewComments + '/' + fk_client,
      );
      // todo: remove after backend changes
      response = (response is String) ? jsonDecode(response) : response;

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

  void filterCommentsByType(String? type, {List<String>? nameUsers}) {
    if (type == CommentTypeEnum.all.value) {
      filteredComments = _allCommentsList
          .where((e) => (nameUsers?.isEmpty ?? true)
              ? true
              : nameUsers?.any((element) {
                    return e.mention_users?.map((e) => e.nameUser).contains(element) ?? false;
                  }) ??
                  false)
          .toList();
      notifyListeners();
      return;
    } else if (type == CommentTypeEnum.Collection.value) {
      filteredComments = _allCommentsList
          .where((element) => ((element.type_comment == CommentTypeEnum.Collection.value) ||
              (element.type_comment == CommentTypeEnum.Renewal.value) ||
              (element.type_comment == CommentTypeEnum.Withdrawal.value)))
          .where((e) => (nameUsers?.isEmpty ?? true)
              ? true
              : nameUsers?.any((element) {
                    return e.mention_users?.map((e) => e.nameUser).contains(element) ?? false;
                  }) ??
                  false)
          .toList();
      notifyListeners();
      return;
    }
    filteredComments = _allCommentsList
        .where((element) => element.type_comment.contains(type ?? ''))
        .where((e) => (nameUsers?.isEmpty ?? true)
            ? true
            : nameUsers?.any((element) {
                  return e.mention_users?.map((e) => e.nameUser).contains(element) ?? false;
                }) ??
                false)
        .toList();
    print(filteredComments);
    notifyListeners();
  }

  Future<String> addComment_vm(Map<String, dynamic> body, String? imageurl, String clientId, List<UserEntity> users) async {
    try {
      isloadadd = true;
      notifyListeners();
      Map mapUser = {};

      users.forEachIndexed(
        (index, element) => mapUser.addAll({'user_ids[$index]': element.id}),
      );

      var sentBody = {
        'content': body["content"],
        if (body["type_comment"] != null) 'type_comment': body["type_comment"],
        ...mapUser,
      };
      var res = await GetIt.I<ApiServices>().postRequestWithFile(
        endPoint: EndPoints.baseUrls.urlLaravel + 'addComment/$clientId',
        data: sentBody,
      );
      if (res != "error") {
        body.addAll({
          'id_comment': res["id_comment"] != null ? res["id_comment"].toString() : "",
          'date_comment': DateTime.now().toString(), //formatter.format(DateTime.now())
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
    } catch (e, s) {
      print(e.toString() + s.toString());
      isloadadd = false;
      notifyListeners();
      return "error";
    }
  }

  Future<String> editComment_vm(String content, CommentModel comment, List<UserEntity> users) async {
    try {
      isloadadd = true;
      notifyListeners();
      Map mapUser = {};

      users.forEachIndexed(
        (index, element) => mapUser.addAll({'user_ids[$index]': element.id}),
      );

      var sentBody = {
        'content': content,
        'type_comment': comment.type_comment,
        ...mapUser,
      };
      var res = await GetIt.I<ApiServices>().post(
        endPoint: EndPoints.baseUrls.urlLaravel + 'editComment/${comment.idComment}',
        data: sentBody,
      );
      if (res['result'] == "success") {
        var list = _allCommentsList
            .map(
              (element) => element.idComment == comment.idComment ? element.copyWith(content: res['message']['content']) : element,
            )
            .toList();
        filteredComments = list;
        filterCommentsByType(filterCommentType.value);

        isloadadd = false;
        notifyListeners();
      }
      isloadadd = false;
      notifyListeners();
      return "success";
    } catch (e, s) {
      print(e.toString() + s.toString());
      isloadadd = false;
      notifyListeners();
      if ((e as AppNetworkResponseException).statusCode == 400) {
        AppSnackbar.showSnakeBar('لايمكن تعديل التعليق بعد مرور مدة ساعة من انشاءه', color: ToastColorsEnum.warning);
      }
      return "error";
    }
  }

  Future<String> replyComment_vm(CommentModel comment,) async {
    try {
      isloadadd = true;
      notifyListeners();


      var sentBody = {
        'content': comment.content,
        'comment_id': comment.idComment,
      };
      var res = await GetIt.I<ApiServices>().post(
        endPoint: EndPoints.baseUrls.urlLaravel + 'addComment/${comment.fkClient}',
        data: sentBody,
      );
      if (res['result'] == "success") {

        isloadadd = false;
        notifyListeners();
      }
      isloadadd = false;
      notifyListeners();
      return "success";
    } catch (e, s) {
      print(e.toString() + s.toString());
      isloadadd = false;
      notifyListeners();
      return "error";
    }
  }

  Future<List<UserEntity>?> getAllUsersComment() async {
    try {
      isloadadd = true;
      notifyListeners();
      var res = await GetIt.I<ApiServices>().get(
        endPoint: EndPoints.baseUrls.urlLaravel + 'users/user-comment',
      );
      if (res['result'] == "success") {
        isloadadd = false;
        notifyListeners();
        return List.from(
          (res['message']).map((e) => UserModel.fromJson(e)),
        );
      }
    } catch (e, s) {
      print(e.toString() + s.toString());
      isloadadd = false;
      notifyListeners();
      return [];
    }
    return null;
  }

  addCommentFromAddInvoice(CommentModel comment) {
    filteredComments.insert(0, comment);
    notifyListeners();
  }

  Future<void> getCommentMentions() async {
    try {
      commentMention = [];
      isLoading = true;
      notifyListeners();

      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      var response = await apiServices.get(endPoint: EndPoints.care.commentMention);

      final data = apiDataHandler(response);

      commentMention = List<CommentModel>.from(data.map((e) {
        return CommentModel.fromJson(e);
      }).toList());

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
}
