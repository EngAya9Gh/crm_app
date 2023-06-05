import 'package:crm_smart/model/commentmodel.dart';

import 'clientmodel.dart';

class LastcommentClientModel {
  LastcommentClientModel({
    required this.client_obj,
  });

  ClientModel? client_obj;

  List<CommentModel>? allComment;
  String? dateCommentClient;
  String? hoursLastComment;

  LastcommentClientModel.fromJson(Map<String, dynamic> jsondata) {
    client_obj =  ClientModel.fromJson(jsondata['client_obj']);
    allComment    = jsondata['allComment'].map((e) {
      CommentModel.fromJson(e);
    }).toList();
    dateCommentClient = jsondata['dateCommentClient'];
    hoursLastComment = jsondata['hoursLastComment'];
    // type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    return _data;
  }
}
