import '../core/common/models/client_model.dart';
import 'commentmodel.dart';

class LastCommentClientModel {
  LastCommentClientModel({
    required this.clientObject,
    this.allComment = const [],
    this.dateCommentClient,
    this.hoursLastComment,
    this.ageClient,
  });

  late ClientModel clientObject;

  List<CommentModel> allComment = [];
  String? dateCommentClient;
  String? hoursLastComment;
  String? ageClient;

  LastCommentClientModel.fromJson(Map<String, dynamic> jsondata) {
    clientObject = getproud(jsondata['client_obj']);
    allComment =
        jsondata['allComment'] == null ? [] : getcomm(jsondata['allComment']);
    dateCommentClient = jsondata['dateCommentClient'];
    hoursLastComment = jsondata['hoursLastComment'];
    ageClient = jsondata['age_client'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    return _data;
  }

  ClientModel getproud(data) {
    List<ClientModel> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(ClientModel.fromJson(data));
      }
    }
    return prodlist[0];
  }

  List<CommentModel> getcomm(data) {
    List<CommentModel> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        //
        prodlist.add(CommentModel.fromJson(data[i]));
      }
    }
    return prodlist;
  }
}
